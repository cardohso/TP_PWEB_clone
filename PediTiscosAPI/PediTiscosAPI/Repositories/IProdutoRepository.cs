using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Repositories
{
    public interface IProdutoRepository
    {
        Task<List<DTO.Produto>> ObterTodosProdutosAsync();
        Task<Produto> ObterProdutoPorIdAsync(int id);
        Task AtualizarProdutoAsync(Produto produto);
        Task RemoverProdutoAsync(int id);
        Task<Produto> ToggleStatusProdutoAsync(int id);
        Task<IEnumerable<DTO.Produto>> ObterProdutosDisponiveisAsync();
        Task<List<Produto>> ObterProdutosPorCategoriaAsync(int value);
        Task<List<Produto>> ObterProdutosPorDetalheAsync(int value);
        Task<List<Produto>> ObterProdutosEmPromocaoAsync();
        Task<List<Produto>> ObterProdutosMaisVendidosAsync();
        Task<List<Produto>> ObterProdutosPopularesAsync();
        Task<IEnumerable<DTO.Produto>> ObterProdutosDisponiveisPorCategoriaAsync(int categoriaId);
    }
}
