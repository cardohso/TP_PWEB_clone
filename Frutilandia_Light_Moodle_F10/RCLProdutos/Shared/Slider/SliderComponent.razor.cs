
using Microsoft.AspNetCore.Components;
using RCLAPI.DTO;
using RCLAPI.Services;
using RCLProdutos.Services.Interfaces;

namespace RCLProdutos.Shared.Slider
{
    public partial class SliderComponent
    {
        [SupplyParameterFromQuery]
        public string nomeCat { get; set; }

        [SupplyParameterFromQuery]
        public int Id { get; set; }

        [SupplyParameterFromQuery]
        private int compraSugerida { get; set; }

        [Parameter]
        public int? initProd { get; set; }

        [Inject]
        public IApiServices? _apiServices { get; set; }
       
        [Inject]
        public ISliderUtilsServices sliderUtilsService { get; set; }
        private List<Produto>? produtos { get; set; }
        private List<ProdutoFavorito>? userFavoritos { get; set; }

        public Produto sugestaoProduto = new Produto();
        private int witdthPerc { get; set; } = 0;
        private bool IsDisabledNext { get; set; } = false;
        private bool IsDisbledPrevious { get; set; } = false;

        public static int? actualProd=0;
        protected override async Task OnInitializedAsync()
        {
            int? categoriasenviadaID;
            string? produtosEspecificos;

            // Verificar se não há valor na categoria ou no tipo, e chamar a API para obter todos os produtos
            if (Id == 0 && actualProd == 0 || nomeCat == "Todos")
            {
                produtosEspecificos = "todos";
                categoriasenviadaID = null;  // Categoria não fornecida, obter todos os produtos
            }
            else if (actualProd == Id)
            {
                categoriasenviadaID = Id;
                produtosEspecificos = "categoria";  // Filtrar por categoria
            }
            else
            {
                if (Id > 0)
                {
                    categoriasenviadaID = Id;
                    actualProd = Id;
                    produtosEspecificos = "categoria";  // Filtrar por categoria
                }
                else
                {
                    categoriasenviadaID = actualProd;
                    produtosEspecificos = "categoria";  // Filtrar por categoria
                }
            }

            try
            {
                Console.WriteLine($"Tipo: {produtosEspecificos}");
                Console.WriteLine($"CategoriaId: {categoriasenviadaID}");

                produtos = await _apiServices!.GetProdutosEspecificos(produtosEspecificos, categoriasenviadaID);

                foreach (var produto in produtos)
                {
                    Console.WriteLine($"Id: {produto.Id}");
                    Console.WriteLine($"Nome: {produto.Nome}");
                    Console.WriteLine($"Detalhe: {produto.Detalhe}");
                    Console.WriteLine($"Preço: {produto.Preco}");
                    Console.WriteLine($"Disponível: {produto.Disponivel}");
                    Console.WriteLine($"Promoção: {produto.Promocao}");
                    Console.WriteLine($"CategoriaId: {produto.CategoriaId}");
                    Console.WriteLine($"Em Stock: {produto.EmStock}");
                    Console.WriteLine($"Imagem URL: {produto.UrlImagem}");
                    Console.WriteLine($"Origem: {produto.Origem}");
                   

                    Console.WriteLine("------------");
                }
            


                // Exemplo de uso do produto para sugerir um produto aleatório
                Random random = new Random();
                int[]? indices = produtos
                                       .Where(item => item is not null)
                                       .Select(item => item.Id)
                                       .ToArray();

                int sugestaoProdutoId = random.Next(0, produtos.Count - 1);
                sugestaoProduto = produtos[indices[sugestaoProdutoId] - 1];
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            await LoadMarginsLeft();

            int qtdProd = produtos.Count;
            witdthPerc = qtdProd * 100;
            sliderUtilsService.WidthSlide2 = 100f / qtdProd;
            sliderUtilsService.OnChange += StateHasChanged;
        }

        async Task LoadMarginsLeft()
        {
            foreach (var produto in produtos)
            {
                sliderUtilsService.MarginLeftSlide.Add("margin-left:0%");
            }
        }

        void PreviousSlide()
        {
            if (sliderUtilsService.CountSlide != 0)
            {
                sliderUtilsService.MarginLeftSlide[sliderUtilsService.CountSlide - 1] = "margin-left:0%";
                sliderUtilsService.CountSlide--;
                IsDisabledNext = false;
                IsDisbledPrevious = false;
            }
            else
            {
                sliderUtilsService.MarginLeftSlide[0] = "margin-left:0%";
                IsDisbledPrevious = true;
            }
            sliderUtilsService.Index = sliderUtilsService.CountSlide;
        }

        void NextSlide()
        {
            sliderUtilsService.CountSlide++;
            sliderUtilsService.Index = sliderUtilsService.CountSlide;
            if (sliderUtilsService.CountSlide < sliderUtilsService.MarginLeftSlide.Count)
            {
                string WidthSlideS = (Convert.ToString(sliderUtilsService.WidthSlide2));
                WidthSlideS = WidthSlideS.Replace(",", ".");
                sliderUtilsService.MarginLeftSlide[sliderUtilsService.CountSlide - 1] = $"margin-left:-{sliderUtilsService.WidthSlide2}%";
                IsDisabledNext = false;
                IsDisbledPrevious = false;
            }
            else
            {
                IsDisabledNext = true;
            }
        }
    }
}
