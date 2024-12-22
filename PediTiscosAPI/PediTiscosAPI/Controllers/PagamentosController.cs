using Microsoft.AspNetCore.Mvc;
using PediTiscosAPI.Data;
using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PagamentosController : ControllerBase
    {
        private readonly AppDbContext _context;

        public PagamentosController(AppDbContext context)
        {
            _context = context;
        }

        [HttpPost]
        public async Task<IActionResult> CriarPagamento([FromBody] Pagamento pagamento)
        {
            // Verificar se o pedido existe
            var pedido = await _context.Pedidos.FindAsync(pagamento.PedidoId);
            if (pedido == null)
            {
                return NotFound("Pedido não encontrado.");
            }

            pagamento.Status = "Pendente";
            pagamento.Data = DateTime.Now;

            _context.Pagamentos.Add(pagamento);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(ObterPagamento), new { id = pagamento.Id }, pagamento);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> ObterPagamento(int id)
        {
            var pagamento = await _context.Pagamentos.FindAsync(id);
            if (pagamento == null)
            {
                return NotFound("Pagamento não encontrado.");
            }

            return Ok(pagamento);
        }

        [HttpPut("{id}/status")]
        public async Task<IActionResult> AtualizarStatus(int id, [FromBody] string status)
        {
            var pagamento = await _context.Pagamentos.FindAsync(id);
            if (pagamento == null)
            {
                return NotFound("Pagamento não encontrado.");
            }

            pagamento.Status = status;
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
