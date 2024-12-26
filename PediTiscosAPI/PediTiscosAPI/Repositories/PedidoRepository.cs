using Microsoft.EntityFrameworkCore;
using PediTiscosAPI.Data;
using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Repositories
{
    public class PedidoRepository : IPedidoRepository
    {
        private readonly AppDbContext _context;

        public PedidoRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<Pedido> ObterPedidoPorIdAsync(int id)
        {
            return await _context.Pedidos
                .Include(p => p.Produtos)
                .FirstOrDefaultAsync(p => p.Id == id);
        }

        public async Task<List<Pedido>> ObterTodosOsPedidosAsync()
        {
            return await _context.Pedidos.Include(p => p.Produtos).ToListAsync();
        }

        public async Task<Pedido> CriarPedidoAsync(Pedido pedido)
        {
            _context.Pedidos.Add(pedido);
            await _context.SaveChangesAsync();
            return pedido;
        }
    }
}
