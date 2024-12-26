using System.ComponentModel.DataAnnotations;

namespace PediTiscosAPI.Entities
{
    public class Pagamento
    {
        public int Id { get; set; }
        [Required]
        public int PedidoId { get; set; }
        [Required]
        public decimal Valor { get; set; }
        [Required]
        public string MetodoPagamento { get; set; } // Cartão, PIX, etc.
        public string Status { get; set; } // Pendente, Aprovado, Rejeitado
        public DateTime Data { get; set; }
        public Pedido Pedido { get; set; }
    }
}
