using PediTiscosAPI.Entities;

public class Pedido
{
    public int Id { get; set; }
    public string ClienteId { get; set; }
    public DateTime Data { get; set; }
    public List<Produto> Produtos { get; set; }
}
