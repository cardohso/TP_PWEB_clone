using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PediTiscosAPI.Entities;
using PediTiscosAPI.Repositories;

namespace PediTiscosAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize] // Exige autenticação para todos os métodos, exceto os explicitamente liberados
    public class CategoriasController : ControllerBase
    {
        private readonly ICategoriaRepository _categoriaRepository;

        public CategoriasController(ICategoriaRepository categoriaRepository)
        {
            _categoriaRepository = categoriaRepository;
        }

        // GET: api/Categorias
        [HttpGet]
        [AllowAnonymous] // Qualquer pessoa pode acessar sem autenticação
        public async Task<IActionResult> ObterCategorias()
        {
            var categorias = await _categoriaRepository.GetCategoriasAsync();
            return Ok(categorias);
        }

        // GET: api/Categorias/{id}
        [HttpGet("{id}")]
        [AllowAnonymous] // Qualquer pessoa pode acessar sem autenticação
        public async Task<IActionResult> ObterCategoriaPorId(int id)
        {
            var categoria = await _categoriaRepository.ObterCategoriaPorIdAsync(id);
            if (categoria == null)
                return NotFound("Categoria não encontrada.");

            return Ok(categoria);
        }

        // POST: api/Categorias
        [HttpPost]
        [Authorize(Roles = "ADMIN")] // Apenas "ADMIN" pode criar categorias
        public async Task<IActionResult> CriarCategoria([FromBody] Categoria categoria)
        {
            var novaCategoria = await _categoriaRepository.CriarCategoriaAsync(categoria);
            return CreatedAtAction(nameof(ObterCategoriaPorId), new { id = novaCategoria.Id }, novaCategoria);
        }

        // PUT: api/Categorias/{id}
        [HttpPut("{id}")]
        [Authorize(Roles = "ADMIN")] // Apenas "ADMIN" pode atualizar categorias
        public async Task<IActionResult> AtualizarCategoria(int id, [FromBody] Categoria categoria)
        {
            if (id != categoria.Id)
                return BadRequest("O ID da categoria não corresponde.");

            await _categoriaRepository.AtualizarCategoriaAsync(categoria);
            return NoContent();
        }

        // DELETE: api/Categorias/{id}
        [HttpDelete("{id}")]
        [Authorize(Roles = "ADMIN")] // Apenas "ADMIN" pode deletar categorias
        public async Task<IActionResult> RemoverCategoria(int id)
        {
            var categoria = await _categoriaRepository.ObterCategoriaPorIdAsync(id);
            if (categoria == null)
                return NotFound("Categoria não encontrada.");

            await _categoriaRepository.RemoverCategoriaAsync(id);
            return NoContent();
        }
    }
}
