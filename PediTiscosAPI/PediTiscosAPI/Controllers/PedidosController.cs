using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PediTiscosAPI.Data;
using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PedidosController : ControllerBase
    {
        private readonly AppDbContext _context;

        public PedidosController(AppDbContext context)
        {
            _context = context;
        }

        // Registrar um novo pedido
        [HttpPost]
        public async Task<IActionResult> AddPedido([FromBody] Pedido pedido)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            pedido.Data = DateTime.Now; // Data atual do pedido
            _context.Pedidos.Add(pedido);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetPedidoById), new { id = pedido.Id }, pedido);
        }

        // Listar todos os pedidos
        [HttpGet]
        public async Task<IActionResult> GetPedidos()
        {
            var pedidos = await _context.Pedidos
                .Include(p => p.Produtos) // Inclui os produtos associados
                .ToListAsync();

            return Ok(pedidos);
        }

        [HttpGet("historico-compras")]
        public IActionResult GetHistoricoCompras([FromQuery] string clienteId)
        {
            // Verificar se o clienteId foi fornecido (pode vir do token de autenticação)
            if (string.IsNullOrEmpty(clienteId))
            {
                return BadRequest("O cliente não está autenticado.");
            }

            // Consultar os pedidos feitos pelo cliente
            var pedidos = _context.Pedidos
                                  .Where(p => p.ClienteId == clienteId)
                                  .Include(p => p.Produtos)  // Incluir os produtos do pedido, se necessário
                                  .ToList();

            if (!pedidos.Any())
            {
                return NotFound("Nenhum histórico de compras encontrado.");
            }

            return Ok(pedidos);
        }

        // Obter um pedido específico pelo ID
        [HttpGet("{id}")]
        public async Task<IActionResult> GetPedidoById(int id)
        {
            var pedido = await _context.Pedidos
                .Include(p => p.Produtos) // Inclui os produtos associados
                .FirstOrDefaultAsync(p => p.Id == id);

            if (pedido == null)
                return NotFound();

            return Ok(pedido);
        }
    }
}
