using Microsoft.AspNetCore.Http;
using PediTiscosAPI.Entities;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;


namespace PediTiscosAPI.DTO;
public class Produto
{
    public int Id { get; set; }
    [StringLength(100)]
    [Required]
    public string? Nome { get; set; }
    [StringLength(200)]
    [Required]
    public string? Detalhe { get; set; }

    [StringLength(200)]

    public string? Origem { get; set; }

    public string? Titulo { get; set; } = string.Empty;

    [StringLength(200)]
    [Required]
    public string? UrlImagem { get; set; }

    [Required]
    [Column(TypeName = "decimal(10,2)")]
    public decimal Preco { get; set; }
    public bool Promocao { get; set; }
    public bool MaisVendido { get; set; }
    public decimal EmStock { get; set; }
    public bool Disponivel { get; set; }
    public byte[]? Imagem { get; set; }
    public int? modoEntregaId { get; set; }
    public int CategoriaId { get; set; }
    public PediTiscosAPI.Entities.Categoria categoria { get; set; }

    [NotMapped]
    public IFormFile? ImageFile { get; set; }

    [JsonIgnore]
    [NotMapped]
    public bool Favorito { get; set; }
    public ModoEntrega Modoentrega { get; set; }

}
