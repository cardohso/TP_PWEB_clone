using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PediTiscosAPI.Entities;
using PediTiscosAPI.Repositories;

namespace PediTiscosAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize] // Exige autenticação para todos os métodos por padrão
    public class ProdutosController : ControllerBase
    {
        private readonly IProdutoRepository _produtoRepository;

        public ProdutosController(IProdutoRepository produtoRepository)
        {
            _produtoRepository = produtoRepository;
        }

        // GET: api/Produtos
        [HttpGet]
        [AllowAnonymous] // Qualquer pessoa pode acessar sem autenticação
        public async Task<IActionResult> GetProdutos()
        {
            var produtos = await _produtoRepository.ObterTodosProdutosAsync();
            return Ok(produtos);
        }

        // PUT: api/Produtos/{id}
        [HttpPut("{id}")]
        [Authorize(Roles = "ADMIN, MANAGER")] // Apenas "ADMIN" e "MANAGER" podem atualizar produtos
        public async Task<IActionResult> UpdateProduto(int id, [FromBody] Produto produto)
        {
            if (id != produto.Id)
                return BadRequest("ID do produto não corresponde.");
            if (produto is null)
            {
                throw new ArgumentNullException(nameof(produto));
            }

            await _produtoRepository.AtualizarProdutoAsync(produto);
            return NoContent();
        }

        // DELETE: api/Produtos/{id}
        [HttpDelete("{id}")]
        [Authorize(Roles = "ADMIN")] // Apenas "ADMIN" pode deletar produtos
        public async Task<IActionResult> DeleteProduto(int id)
        {
            var produto = await _produtoRepository.ObterProdutoPorIdAsync(id);
            if (produto == null)
                return NotFound();

            await _produtoRepository.RemoverProdutoAsync(id);
            return NoContent();
        }

        // PATCH: api/Produtos/{id}/status
        [HttpPatch("{id}/status")]
        [Authorize(Roles = "ADMIN, MANAGER")] // Apenas "ADMIN" e "MANAGER" podem alterar status do produto
        public async Task<IActionResult> ToggleProdutoStatus(int id)
        {
            var produto = await _produtoRepository.ToggleStatusProdutoAsync(id);
            if (produto == null)
                return NotFound();

            return Ok(produto);
        }
    }
}
