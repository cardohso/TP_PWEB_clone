using PediTiscosAPI.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using PediTiscosAPI.Repositories;

[ApiController]
[Route("api/[controller]")]
public class PagamentosController : ControllerBase
{
    private readonly IPagamentoRepository _pagamentoRepository;

    public PagamentosController(IPagamentoRepository pagamentoRepository)
    {
        _pagamentoRepository = pagamentoRepository;
    }

    // Somente usuários autenticados podem criar pagamentos
    [HttpPost]
    [Authorize]  // Adiciona a proteção de autenticação
    public async Task<IActionResult> CriarPagamento([FromBody] CriarPagamentoRequest request)
    {
        try
        {
            var pagamento = await _pagamentoRepository.CriarPagamentoAsync(request);
            return CreatedAtAction(nameof(ObterPagamento), new { id = pagamento.Id }, pagamento);
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> ObterPagamento(int id)
    {
        var pagamento = await _pagamentoRepository.ObterPagamentoPorIdAsync(id);
        if (pagamento == null)
        {
            return NotFound("Pagamento não encontrado.");
        }

        return Ok(pagamento);
    }
}
