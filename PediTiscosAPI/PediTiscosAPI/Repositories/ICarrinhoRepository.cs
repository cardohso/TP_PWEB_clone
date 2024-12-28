using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Repositories
{
    public interface ICarrinhoRepository
    {
        Task<Boolean> AdicionarItemAoCarrinhoAsync(string userId,ItemCarrinhoCompra item);
        Task<List<ItemCarrinhoCompra>> ObterItensCarrinhoPorClienteIdAsync(string clienteId);
        Task RemoverItemDoCarrinhoAsync(int id);
        Task LimparCarrinhoAsync(string clienteId);
    }
}
