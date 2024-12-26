using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Repositories
{
    public interface IPedidoRepository
    {
        Task<Pedido> ObterPedidoPorIdAsync(int id);
        Task<List<Pedido>> ObterTodosOsPedidosAsync();
        Task<Pedido> CriarPedidoAsync(Pedido pedido);
    }
}