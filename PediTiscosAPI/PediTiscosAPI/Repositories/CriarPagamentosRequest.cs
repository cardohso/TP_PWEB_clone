using System.ComponentModel.DataAnnotations;

public class CriarPagamentoRequest
{
    [Required]
    public string ClienteId { get; set; } // ID do cliente que fez o pedido

    [Required]
    public string MetodoPagamento { get; set; } // Método de pagamento escolhido

    [Required]
    public List<ProdutoPedido> Produtos { get; set; } // Produtos no carrinho
}

public class ProdutoPedido
{
    [Required]
    public int Id { get; set; } // ID do produto
    [Required]
    public int Quantidade { get; set; } // Quantidade desejada
}
