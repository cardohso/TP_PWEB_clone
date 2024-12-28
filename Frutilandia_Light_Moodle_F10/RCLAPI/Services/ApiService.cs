using Microsoft.Extensions.Logging;
using System.Net;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using Xamarin.Essentials;

using RCLAPI.DTO;
using System.Net.Http.Json;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNet.Identity;

namespace RCLAPI.Services;
public class ApiService : IApiServices
{
    private readonly ILogger<ApiService> _logger;
    private readonly HttpClient _httpClient = new();
    JsonSerializerOptions _serializerOptions;

    private List<Produto> produtos;

    private List<Categoria> categorias;

    private Produto _detalhesProduto;
    public ApiService(ILogger<ApiService> logger)
    {
        _logger = logger;
        _serializerOptions = new JsonSerializerOptions
        {
            PropertyNameCaseInsensitive = true
        };

        _detalhesProduto = new Produto();

        categorias = new List<Categoria>();
    }

    private void AddAuthorizationHeader()
    {
        var token = Preferences.Get("accesstoken", string.Empty);

        if (!string.IsNullOrEmpty(token))
        {
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
        }
    }


    public async Task<(ImagemPerfil? ImagemPerfil, string? ErrorMessage)> GetImagemPerfilUsuario()
    {
        string endpoint = "api/Usuarios/imagemperfil";

        return await GetAsync<ImagemPerfil>(endpoint);
    }

    public async Task<ApiResponse<bool>> Login(DTO.LoginModel loginModel)
    {
        try
        {
            // Serializa o modelo de login para JSON
            var json = JsonSerializer.Serialize(loginModel, _serializerOptions);

            // Prepara o conteúdo para a requisição HTTP
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            // Define o endpoint de login
            string endpoint = "api/Auth/login";

            // Envia a requisição POST para o endpoint de login
            HttpResponseMessage response = await _httpClient.PostAsync($"{AppConfig.BaseUrl}{endpoint}", content);

            // Verifica se a resposta indica sucesso
            if (!response.IsSuccessStatusCode)
            {
                _logger.LogError($"Erro ao enviar requisição HTTP: {response.StatusCode}");
                return new ApiResponse<bool>
                {
                    ErrorMessage = $"Erro ao enviar requisição HTTP: {response.StatusCode}"
                };
            }

            // Lê o conteúdo da resposta como string
            var jsonResult = await response.Content.ReadAsStringAsync();

            // Desserializa o JSON para o objeto Token
            var token = JsonSerializer.Deserialize<Token>(jsonResult, _serializerOptions);

            if (token == null || string.IsNullOrEmpty(token.AccessToken))
            {
                _logger.LogError("Token inválido recebido da API.");
                return new ApiResponse<bool>
                {
                    ErrorMessage = "Token inválido recebido da API."
                };
            }

            // Armazenando o token no Preferences para futuras requisições
            Preferences.Set("accesstoken", token.AccessToken);

            // Log de sucesso
            _logger.LogInformation("Login realizado com sucesso.");

            return new ApiResponse<bool> { Data = true };
        }
        catch (Exception ex)
        {
            // Captura erros e retorna como mensagem de erro na resposta
            _logger.LogError($"Erro no login: {ex.Message}");
            return new ApiResponse<bool> { ErrorMessage = ex.Message };
        }
    }
    //public async Task<ApiResponse<bool>> RegistarUtilizador(Utilizador utilizador)
    //{
    //    try
    //    {

    //        // Serializando o Utilizador para JSON para envio na requisição
    //        var json = JsonSerializer.Serialize(utilizador);
    //        var content = new StringContent(json, Encoding.UTF8, "application/json");

    //        // Enviando a requisição para o endpoint de registro
    //        string endpoint = "api/Auth/register";  // Defina o endpoint correto
    //        HttpResponseMessage response = await _httpClient.PostAsync($"{AppConfig.BaseUrl}{endpoint}", content);

    //        // Verificando se a requisição foi bem-sucedida
    //        Console.Write(response);
    //        if (!response.IsSuccessStatusCode)
    //        {
    //            _logger.LogError($"Erro ao enviar requisição HTTP: {response.StatusCode}");
    //            return new ApiResponse<bool>
    //            {
    //                ErrorMessage = $"Erro ao enviar requisição HTTP: {response.StatusCode}"
    //            };
    //        }

    //        // Retornando sucesso
    //        return new ApiResponse<bool> { Data = true };
    //    }
    //    catch (Exception ex)
    //    {
    //        _logger.LogError($"Erro ao registrar o usuário: {ex.Message}");
    //        return new ApiResponse<bool> { ErrorMessage = ex.Message };
    //    }
    //}
    public async Task<ApiResponse<bool>> RegistarUtilizador(Utilizador Utilizador)
    {
        try
        {
            var json = JsonSerializer.Serialize(Utilizador, _serializerOptions);
            Console.WriteLine($"JSON enviado: {json}");

            var content = new StringContent(json, Encoding.UTF8, "application/json");

            string endpoint = "api/Auth/register";
            // Enviando a requisição de registro
            HttpResponseMessage response = await _httpClient.PostAsync($"{AppConfig.BaseUrl}{endpoint}", content);
            Console.WriteLine(content);

            if (!response.IsSuccessStatusCode)
            {
                _logger.LogError($"Erro ao enviar requisitos Http: {response.StatusCode}");
                return new ApiResponse<bool>
                {
                    ErrorMessage = $"Erro ao enviar requisição HTTP: {response.StatusCode}"
                };
            }

            return new ApiResponse<bool> { Data = true };
        }
        catch (Exception ex)
        {
            _logger.LogError($"Erro ao registar o utilizador: {ex.Message}");
            return new ApiResponse<bool> { ErrorMessage = ex.Message };
        }
    }




    // ********************* Categorias  **********

    public async Task<List<Categoria>> GetCategorias()
    {
        try
        {
            string endpoint = "api/Categorias";
            HttpResponseMessage response = await _httpClient.GetAsync($"{AppConfig.BaseUrl}{endpoint}");

            if (response.IsSuccessStatusCode)
            {
                string content = await response.Content.ReadAsStringAsync();
                return JsonSerializer.Deserialize<List<Categoria>>(content, _serializerOptions) ?? new List<Categoria>();
            }
            else
            {
                throw new Exception($"Erro ao obter categorias: {response.StatusCode} - {response.ReasonPhrase}");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Erro ao obter categorias: {ex.Message}");
            throw;
        }
    }



    // ********************* Produtos  **********
    public async Task<List<Produto>> GetProdutos()
    {
        try
        {
            string endpoint = "api/Produtos";
            HttpResponseMessage response = await _httpClient.GetAsync($"{AppConfig.BaseUrl}{endpoint}");

            if (response.IsSuccessStatusCode)
            {
                string content = await response.Content.ReadAsStringAsync();
                return JsonSerializer.Deserialize<List<Produto>>(content, _serializerOptions) ?? new List<Produto>();
            }
            else
            {
                throw new Exception($"Erro ao obter produtos: {response.StatusCode} - {response.ReasonPhrase}");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Erro ao obter produtos: {ex.Message}");
            throw;
        }
    }

    public async Task<List<Produto>> GetProdutosEspecificos(string tipo, int? categoriaId)
    {
        try
        {
            var url = "";
            if (categoriaId == null)
            {
                url = $"{AppConfig.BaseUrl}api/Produtos";
            }
            else
            {
                url = $"{AppConfig.BaseUrl}api/Produtos/categoriaId/{categoriaId}"; // Corrigido para usar a URL correta
            }
                
                var response = await _httpClient.GetAsync(url);

                // Verificar se a resposta é bem-sucedida
                if (!response.IsSuccessStatusCode)
                {
                    Console.WriteLine($"Erro na API: {response.StatusCode} - {response.ReasonPhrase}");
                    return new List<Produto>(); // Retorna uma lista vazia para evitar erros
                }

                // Verificar se o conteúdo da resposta não está vazio
                var json = await response.Content.ReadAsStringAsync();
                if (string.IsNullOrWhiteSpace(json))
                {
                    Console.WriteLine("A API retornou uma resposta vazia.");
                    return new List<Produto>();
                }

                // Tentar deserializar
                return JsonSerializer.Deserialize<List<Produto>>(json, new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true
                }) ?? new List<Produto>();
            
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Erro ao obter produtos: {ex.Message}");
            return new List<Produto>(); // Retorna uma lista vazia em caso de erro
        }
    }



    public async Task<Produto> GetDetalheProduto(int IdProduto)
    {
        string endpoint = $"api/Produtos/{IdProduto}";

        string caminho = $"{AppConfig.BaseUrl}{endpoint}";

        try
        {
            HttpResponseMessage httpResponseMessage = await _httpClient.GetAsync(caminho);

            if (httpResponseMessage.IsSuccessStatusCode)
            {
                string content = "";

                content = await httpResponseMessage.Content.ReadAsStringAsync();
                _detalhesProduto = JsonSerializer.Deserialize<Produto>(content, _serializerOptions)!;

                return _detalhesProduto;
            }
            else return null;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);

            return null;
        }

    }
    public async Task<(T?Data, string?ErrorMessage)>GetAsync<T>(string endpoint)
    {
        try
        {
            AddAuthorizationHeader();
            var response = await _httpClient.GetAsync(AppConfig.BaseUrl + endpoint);

            if (response.IsSuccessStatusCode)
            {
                var responseString = await response.Content.ReadAsStringAsync();
                var data = JsonSerializer.Deserialize<T>(responseString, _serializerOptions);
                return (data ?? Activator.CreateInstance<T>(), null);
            }
            else
            {
                if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
                {
                    string errorMessage = "Unauthorized";
                    _logger.LogWarning(errorMessage);
                    return (default, errorMessage);
                }

                string generalErrorMessage = $"Erro na requisição: {response.ReasonPhrase}";
                _logger.LogError(generalErrorMessage);
                return (default, generalErrorMessage);
            }
        }
        catch (HttpRequestException ex)
        {
            string errrMessage = $"Erro de requisição HTTP: {ex.Message}";
            _logger.LogError(errrMessage);
            return (default, errrMessage);
        }
        catch (JsonException ex)
        {
            string errorMessage = $"Erro de desserialização JSON: {ex.Message}";
            _logger.LogError(ex.Message);
            return (default, errorMessage);
        }
        catch (Exception ex)
        {
            string errorMessage = $"Erro inesperado: {ex.Message}";
            _logger.LogError(ex.Message);
            return (default, errorMessage);
        }
    }


    // ****************** Utilizadores ********************

    

    private async Task<HttpResponseMessage> PostRequest(string uri, HttpContent content)
    {
        var enderecoURL = AppConfig.BaseUrl + uri;
        try
        {
            var result = await _httpClient.PostAsync(enderecoURL, content);
            return result;
        }
        catch (Exception ex)
        {
            // Log o erro ou trata conforme necessario
            _logger.LogError($"Erro ao enviar requisição POST para {uri}: {ex.Message}");
            return new HttpResponseMessage(HttpStatusCode.BadRequest);
        }
    }

    internal async Task<ApiResponse<bool>> UploadImagemUtilizador(byte[] imageArray)
    {
        try
        {
            var content = new MultipartFormDataContent();

            content.Add(new ByteArrayContent(imageArray), "imagem", "image.jpg");

            var response = await PostRequest("api/Usuarios/uploadfoto", content);

            if (!response.IsSuccessStatusCode)
            {
                string errorMessage = response.StatusCode == HttpStatusCode.Unauthorized ? "Unauthorized"
                    : "Erro ao enviar requisição HTTP: {response.StatusCode}";

                _logger.LogError($"Erro ao enviar requisição HTTP: {response.StatusCode}");

                return new ApiResponse<bool> { ErrorMessage = errorMessage };
            }
            return new ApiResponse<bool> { Data = true };
        }
        catch (Exception ex)
        {
            _logger.LogError($"Erro ao fazer o upload da imagem do utilizador: {ex.Message}");

            return new ApiResponse<bool> {ErrorMessage= ex.Message};
        }
    }

    // *************** Gerir Favoritos ******************

    public async Task<List<ProdutoFavorito>> GetFavoritos(string utilizadorId)
    {
        string endpoint = $"api/Favoritos/{utilizadorId}";

        HttpResponseMessage response = await _httpClient.GetAsync($"{AppConfig.BaseUrl}{endpoint}");

        var responseString = await response.Content.ReadAsStringAsync();
        List<ProdutoFavorito> data = JsonSerializer.Deserialize<List<ProdutoFavorito>>(responseString, _serializerOptions);

        return data;

    }

    public async Task<(bool Data, string? ErrorMessage)> ActualizaFavorito(string acao, int produtoId)
    {
        try
        {
            var content = new StringContent(string.Empty, Encoding.UTF8, "application/json");

            var response = await FavoritosPutRequest($"api/Favoritos/{produtoId}/{acao}", content );

            if (!response.IsSuccessStatusCode)
            {
                return (true, null);
            }
            else
            {
                if (response.StatusCode == HttpStatusCode.Unauthorized)
                {
                    string errorMessage = "Unauthorized";
                    _logger.LogWarning(errorMessage);
                    return (false, errorMessage);
                }
                string generalErrorMessage = $"Erro na requisição: {response.ReasonPhrase}";
                _logger.LogError(generalErrorMessage);
                return (false, generalErrorMessage);
            }
        }
        catch (HttpRequestException ex)
        {
            string errorMessage = $"Erro de requisição HTTP: {ex.Message}";
            _logger.LogError(errorMessage);
            return (false, errorMessage);
        }
        catch (Exception ex)
        {
            string errorMessage = $"Erro inesperado: {ex.Message}";
            _logger.LogError(errorMessage);
            return (false, errorMessage);
        }
    }

    public async Task<ApiResponse<bool>> AdicionaItemNoCarrinho(ItemCarrinhoCompra itemCarrinho)
    {
        try
        {
            // Serializa o DTO para JSON
            var json = JsonSerializer.Serialize(itemCarrinho, _serializerOptions);

            // Prepara o conteúdo da requisição
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            // Define o endpoint da API para adicionar item ao carrinho
            string endpoint = "api/Carrinho/AdicionarItem";

            // Envia a requisição POST
            HttpResponseMessage response = await _httpClient.PostAsync($"{AppConfig.BaseUrl}{endpoint}", content);

            // Verifica se a requisição foi bem-sucedida
            if (response.IsSuccessStatusCode)
            {
                return new ApiResponse<bool> { Data = true };
            }
            else
            {
                // Caso haja erro, retorna uma mensagem
                _logger.LogError($"Erro ao adicionar item ao carrinho: {response.StatusCode} - {response.ReasonPhrase}");
                return new ApiResponse<bool> { ErrorMessage = "Erro ao adicionar item ao carrinho." };
            }
        }
        catch (Exception ex)
        {
            // Captura erros e retorna como mensagem
            _logger.LogError($"Erro inesperado: {ex.Message}");
            return new ApiResponse<bool> { ErrorMessage = ex.Message };
        }
    }

    private async Task<HttpResponseMessage> FavoritosPutRequest(string uri, HttpContent content)
    {
        var enderecoUrl = AppConfig.BaseUrl + uri;
        try
        {
          //  AddAuthorizationHeader();
            var result = await _httpClient.PutAsync(enderecoUrl, content);
            return result;
        }
        catch (Exception ex)
        {
            _logger.LogError($"Erro ao enviar requisição PUT para {uri}: {ex.Message}");
            return new HttpResponseMessage(HttpStatusCode.BadRequest);
        }
    }
}

