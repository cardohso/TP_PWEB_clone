using Microsoft.EntityFrameworkCore;
using PediTiscosAPI.Data;
using PediTiscosAPI.Entities;


namespace PediTiscosAPI.Repositories
{
    public class ProdutoRepository : IProdutoRepository
    {
        private readonly AppDbContext _context;

        public ProdutoRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<DTO.Produto>> ObterTodosProdutosAsync()
        {
            var produtos = await _context.Produtos
            .Where(p => p.Disponivel == true) // Somente produtos disponíveis e da categoria específica
                .ToListAsync();

            // Caminho padrão da imagem (exemplo para teste)
            string caminhoImagem = "C:\\Users\\User\\Documents\\GitHub\\TP_PWEB_clone\\PediTiscosAPI\\PediTiscosAPI\\Imagens\\45908.jpg";

            var produtosDto = new List<DTO.Produto>();


            foreach (var produto in produtos)
            {
                // Criar um novo ProdutoDto e transferir os dados do Produto
                var produtoDto = new DTO.Produto
                {
                    Id = produto.Id,
                    Nome = produto.Nome,
                    Detalhe = produto.Detalhe,
                    Preco = produto.Preco,
                    Disponivel = produto.Disponivel,
                    Promocao = produto.Promocao,
                    CategoriaId = produto.CategoriaId,
                    categoria = produto.categoria,
                    EmStock = produto.EmStock,
                    UrlImagem = produto.UrlImagem,
                    modoEntregaId = produto.ModoEntregaId,
                    Modoentrega = produto.modoentrega,
                    Origem = produto.Origem,
                    Imagem = File.Exists(caminhoImagem) ? await File.ReadAllBytesAsync(caminhoImagem) : null
                };

                // Adicionar o produtoDto à lista
                produtosDto.Add(produtoDto);
            }

            // Retornar a lista de produtos DTO
            return produtosDto;
        }
        public async Task<List<Produto>> ObterProdutosPorCategoriaAsync(int categoriaId)
        {
            return await _context.Produtos
                .Where(p => p.CategoriaId == categoriaId && p.Disponivel == true)
                .ToListAsync();
        }

        public async Task<List<Produto>> ObterProdutosEmPromocaoAsync()
        {
            return await _context.Produtos
                .Where(p => p.Promocao == true && p.Disponivel == true)
                .ToListAsync();
        }

        public async Task<List<Produto>> ObterProdutosMaisVendidosAsync()
        {
            return await _context.Produtos
                .Where(p => p.MaisVendido == true && p.Disponivel == true)
                .ToListAsync();
        }

        public async Task<List<Produto>> ObterProdutosPopularesAsync()
        {
            // Implementação para produtos populares (critério baseado no que definir)
            return await _context.Produtos
                .Where(p => p.Disponivel == true) // Exemplo, pode ajustar conforme necessário
                .ToListAsync();
        }


        public async Task<IEnumerable<DTO.Produto>> ObterProdutosDisponiveisPorCategoriaAsync(int categoriaId)
        {
            // Obter produtos disponíveis da categoria específica
            var produtos = await _context.Produtos
                .Where(p => p.Disponivel == true && p.CategoriaId == categoriaId) // Somente produtos disponíveis e da categoria específica
                .ToListAsync();

            // Caminho padrão da imagem (exemplo para teste)
            string caminhoImagem = "C:\\Users\\User\\Documents\\GitHub\\TP_PWEB_clone\\PediTiscosAPI\\PediTiscosAPI\\Imagens\\45908.jpg";

            var produtosDto = new List<DTO.Produto>();


            foreach (var produto in produtos)
            {
                // Criar um novo ProdutoDto e transferir os dados do Produto
                var produtoDto = new DTO.Produto
                {
                    Id = produto.Id,
                    Nome = produto.Nome,
                    Detalhe = produto.Detalhe,
                    Preco = produto.Preco,
                    Disponivel = produto.Disponivel,
                    Promocao = produto.Promocao,
                    CategoriaId = produto.CategoriaId,
                    categoria = produto.categoria,
                    EmStock = produto.EmStock,
                    UrlImagem = produto.UrlImagem,
                    modoEntregaId = produto.ModoEntregaId,
                    Modoentrega = produto.modoentrega,
                    Origem = produto.Origem,
                    Imagem = File.Exists(caminhoImagem) ? await File.ReadAllBytesAsync(caminhoImagem) : null
                };

                // Adicionar o produtoDto à lista
                produtosDto.Add(produtoDto);
            }

            // Retornar a lista de produtos DTO
            return produtosDto;
        }


        public async Task<Produto> ObterProdutoPorIdAsync(int id)
        {
            return await _context.Produtos.FindAsync(id);
        }

        public async Task AtualizarProdutoAsync(Produto produto)
        {
            _context.Entry(produto).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task RemoverProdutoAsync(int id)
        {
            var produto = await _context.Produtos.FindAsync(id);
            if (produto != null)
            {
                _context.Produtos.Remove(produto);
                await _context.SaveChangesAsync();
            }
        }

        public async Task<Produto> ToggleStatusProdutoAsync(int id)
        {
            var produto = await _context.Produtos.FindAsync(id);
            if (produto == null)
                return null;

            produto.Disponivel = !produto.Disponivel;
            _context.Entry(produto).State = EntityState.Modified;
            await _context.SaveChangesAsync();

            return produto;
        }

        public Task<IEnumerable<DTO.Produto>> ObterProdutosDisponiveisAsync()
        {
            throw new NotImplementedException();
        }

        public Task<List<Produto>> ObterProdutosPorDetalheAsync(int value)
        {
            throw new NotImplementedException();
        }
    }
}
