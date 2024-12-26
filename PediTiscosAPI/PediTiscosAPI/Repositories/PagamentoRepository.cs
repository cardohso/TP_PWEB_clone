using Microsoft.EntityFrameworkCore;
using PediTiscosAPI.Data;
using PediTiscosAPI.Entities;

public class PagamentoRepository : IPagamentoRepository
{
    private readonly AppDbContext _context;

    public PagamentoRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<Pagamento> CriarPagamentoAsync(CriarPagamentoRequest request)
    {
        // Validar produtos
        var produtoIds = request.Produtos.Select(p => p.Id).ToList();
        var produtos = await _context.Produtos.Where(p => produtoIds.Contains(p.Id)).ToListAsync();

        if (produtos.Count != request.Produtos.Count)
        {
            throw new Exception("Um ou mais produtos não foram encontrados.");
        }

        // Verificar estoque e calcular total
        decimal valorTotal = 0;
        foreach (var produtoRequest in request.Produtos)
        {
            var produto = produtos.FirstOrDefault(p => p.Id == produtoRequest.Id);
            if (produto == null || produto.EmStock < produtoRequest.Quantidade)
            {
                throw new Exception($"Estoque insuficiente para o produto {produto?.Nome ?? produtoRequest.Id.ToString()}.");
            }

            // Atualizar estoque e calcular total
            produto.EmStock -= produtoRequest.Quantidade;
            valorTotal += produto.Preco * produtoRequest.Quantidade;
        }

        // Criar o pedido
        var pedido = new Pedido
        {
            ClienteId = request.ClienteId,
            Data = DateTime.Now,
            Produtos = produtos
        };
        _context.Pedidos.Add(pedido);
        await _context.SaveChangesAsync();

        // Criar o pagamento
        var pagamento = new Pagamento
        {
            PedidoId = pedido.Id,
            Valor = valorTotal,
            MetodoPagamento = request.MetodoPagamento,
            Status = "Pendente",
            Data = DateTime.Now
        };

        _context.Pagamentos.Add(pagamento);
        await _context.SaveChangesAsync();

        return pagamento;
    }
    public async Task<Pagamento> ObterPagamentoPorIdAsync(int id)
    {
        return await _context.Pagamentos
            .Include(p => p.Pedido) 
            .FirstOrDefaultAsync(p => p.Id == id);
    }

}
