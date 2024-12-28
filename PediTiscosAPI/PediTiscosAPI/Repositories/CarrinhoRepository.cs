using Microsoft.EntityFrameworkCore;
using PediTiscosAPI.Data;
using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Repositories
{
    public class CarrinhoRepository : ICarrinhoRepository
    {
        private readonly AppDbContext _context;

        public CarrinhoRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<bool> AdicionarItemAoCarrinhoAsync(string userId, ItemCarrinhoCompra itemCarrinhoCompra)
        {
            var produto = await _context.Produtos.FindAsync(itemCarrinhoCompra.ProdutoId);
            if (produto == null || produto.EmStock < itemCarrinhoCompra.Quantidade)
            {
                return false;  // se o produto não existir ou não houver stock
            }

            var carrinhoItem = await _context.ItensCarrinhoCompra
                           .FirstOrDefaultAsync(c => c.UserId == userId && c.ProdutoId == itemCarrinhoCompra.ProdutoId);

            if (carrinhoItem == null)
            { // o produto ainda não existia no carrinho do user

                carrinhoItem = new ItemCarrinhoCompra
                {
                    UserId = userId,
                    ProdutoId = itemCarrinhoCompra.ProdutoId,
                    Quantidade = itemCarrinhoCompra.Quantidade,
                    PrecoUnitario = itemCarrinhoCompra.PrecoUnitario,
                    ValorTotal = itemCarrinhoCompra.ValorTotal 

                };
                await _context.ItensCarrinhoCompra.AddAsync(carrinhoItem);
            }
            else
            {
                //Atualizar quantiadade se o produto já existir
                carrinhoItem.Quantidade += itemCarrinhoCompra.Quantidade;
            }

            await _context.SaveChangesAsync();
            return true;

        }

        public async Task<List<ItemCarrinhoCompra>> ObterItensCarrinhoPorClienteIdAsync(string clienteId)
        {
            return await _context.ItensCarrinhoCompra
                .Where(i => i.UserId == clienteId)
                .ToListAsync();
        }

        public async Task RemoverItemDoCarrinhoAsync(int id)
        {
            var item = await _context.ItensCarrinhoCompra.FindAsync(id);
            if (item != null)
            {
                _context.ItensCarrinhoCompra.Remove(item);
                await _context.SaveChangesAsync();
            }
        }

        public async Task LimparCarrinhoAsync(string clienteId)
        {
            var itens = _context.ItensCarrinhoCompra
                .Where(i => i.UserId == clienteId);

            _context.ItensCarrinhoCompra.RemoveRange(itens);
            await _context.SaveChangesAsync();
        }
    }
}
