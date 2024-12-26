namespace GestãoLoja.Entities
{
    public class Venda
    {
        public int Id { get; set; }
        public DateTime Data { get; set; }
        public string ClienteId { get; set; }
        public string Status { get; set; } = "Pendente";
        public decimal Total { get; set; }
        public Cliente Cliente { get; set; }
        public ICollection<ItemVenda> Itens { get; set; } = new List<ItemVenda>();
    }

    public class ItemVenda
    {
        public int Id { get; set; }
        public int VendaId { get; set; }
        public int ProdutoId { get; set; }
        public int Quantidade { get; set; }
        public decimal PrecoUnitario { get; set; }
        public Venda Venda { get; set; }
        public Produto Produto { get; set; }
    }
}