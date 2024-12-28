using Microsoft.AspNetCore.Mvc;
using PediTiscosAPI.Entities;
using PediTiscosAPI.Repositories;

namespace PediTiscosAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CarrinhoController : ControllerBase
    {
        private readonly ICarrinhoRepository _carrinhoRepository;

        public CarrinhoController(ICarrinhoRepository carrinhoRepository)
        {
            _carrinhoRepository = carrinhoRepository;
        }

        // POST: api/Carrinho/{clienteId}/adicionar
        [HttpPost("adicionar")]
        public async Task<IActionResult> AdicionarItemAoCarrinho([FromBody] ItemCarrinhoCompra item)
        {
            // Verifica se o item recebido é válido
            if (item == null || item.ProdutoId <= 0 || item.Quantidade <= 0)
            {
                return BadRequest("Item inválido ou incompleto.");
            }

            // Obtem o ClienteId (nome do usuário) a partir do token JWT
            var clienteId = User.Identity?.Name;

            if (string.IsNullOrEmpty(clienteId))
            {
                return Unauthorized("Cliente não autenticado.");
            }

            // Chamada ao repositório para adicionar o item
            var sucesso = await _carrinhoRepository.AdicionarItemAoCarrinhoAsync(clienteId, item);

            if (!sucesso)
            {
                return BadRequest("Não foi possível adicionar o item ao carrinho. Verifique o Stocck ou o produto.");
            }

            return NoContent(); // Retorna 204 (No Content) se o item foi adicionado com sucesso
        }


        // GET: api/Carrinho/{clienteId}
        [HttpGet("{clienteId}")]
        public async Task<IActionResult> ObterItensCarrinho(string clienteId)
        {
            var itens = await _carrinhoRepository.ObterItensCarrinhoPorClienteIdAsync(clienteId);
            return Ok(itens);
        }


        // DELETE: api/Carrinho/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> RemoverItemDoCarrinho(int id)
        {
            await _carrinhoRepository.RemoverItemDoCarrinhoAsync(id);
            return NoContent();
        }

        // DELETE: api/Carrinho/{clienteId}/limpar
        [HttpDelete("{clienteId}/limpar")]
        public async Task<IActionResult> LimparCarrinho(string clienteId)
        {
            await _carrinhoRepository.LimparCarrinhoAsync(clienteId);
            return NoContent();
        }
    }
}
