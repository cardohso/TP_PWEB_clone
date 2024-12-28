using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace PediTiscosAPI.Entities
{
    public class ItemCarrinhoCompra
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public int Quantidade { get; set; }

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal PrecoUnitario { get; set; }

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal ValorTotal { get; set; }

        [Required]
        public int ProdutoId { get; set; }

        public string UserId { get; set; }
    }
}
