using System.Text.Json.Serialization;


namespace PediTiscosAPI.Entities
{
    public class Produto
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public decimal Preco { get; set; }
        public bool Ativo { get; set; } 
        public string Descricao { get; set; }
        public int Estoque { get; set; }
        public int CategoriaId { get; set; }

        [JsonIgnore]  // Ignorando a serialização da Categoria para evitar o ciclo
        public Categoria Categoria { get; set; }

        public int? PedidoId { get; set; }
        [JsonIgnore]
        public Pedido Pedido { get; set; }
    }
}
