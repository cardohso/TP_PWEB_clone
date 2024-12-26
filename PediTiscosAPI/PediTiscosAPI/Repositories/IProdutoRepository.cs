using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Repositories
{
    public interface IProdutoRepository
    {
        Task<List<Produto>> ObterTodosProdutosAsync();
        Task<Produto> ObterProdutoPorIdAsync(int id);
        Task AtualizarProdutoAsync(Produto produto);
        Task RemoverProdutoAsync(int id);
        Task<Produto> ToggleStatusProdutoAsync(int id);
    }
}
