namespace PediTiscosAPI.Entities
{
    public class Pagamento
    {
        public int Id { get; set; }
        public int PedidoId { get; set; }
        public decimal Valor { get; set; }
        public string MetodoPagamento { get; set; } // Cartão, PIX, etc.
        public string Status { get; set; } // Pendente, Aprovado, Rejeitado
        public DateTime Data { get; set; }
        public Pedido Pedido { get; set; }
    }
}
