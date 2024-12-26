using RCLAPI.DTO;

namespace RCLAPI.Services;

public interface IApiServices
{
    public Task<List<Produto>> GetProdutos();
    public Task<Produto> GetDetalheProduto(int IdProduto);
    public Task<List<Produto>> GetProdutosEspecificos(string produtoTipo, int? IdCategoria);
    public Task<(T? Data, string? ErrorMessage)> GetAsync<T>(string endpoint);
    public Task<List<Categoria>> GetCategorias();
    public Task<(bool Data, string? ErrorMessage)> ActualizaFavorito(string acao, int produtoId);
    public Task<List<ProdutoFavorito>> GetFavoritos(string utilizadorId);
    public Task<ApiResponse<bool>> RegistarUtilizador(Utilizador utilizador);
    public Task<ApiResponse<bool>> Login(LoginModel loginModel);

}
