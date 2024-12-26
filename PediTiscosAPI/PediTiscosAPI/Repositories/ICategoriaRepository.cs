using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Repositories
{
    public interface ICategoriaRepository
    {
        Task<List<Categoria>> ObterTodasCategoriasAsync();
        Task<Categoria> ObterCategoriaPorIdAsync(int id);
        Task<Categoria> CriarCategoriaAsync(Categoria categoria);
        Task AtualizarCategoriaAsync(Categoria categoria);
        Task RemoverCategoriaAsync(int id);
    }
}
