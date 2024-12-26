using Microsoft.EntityFrameworkCore;
using PediTiscosAPI.Data;
using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Repositories
{
    public class ProdutoRepository : IProdutoRepository
    {
        private readonly AppDbContext _context;

        public ProdutoRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Produto>> ObterTodosProdutosAsync()
        {
            return await _context.Produtos.ToListAsync();
        }

        public async Task<Produto> ObterProdutoPorIdAsync(int id)
        {
            return await _context.Produtos.FindAsync(id);
        }

        public async Task AtualizarProdutoAsync(Produto produto)
        {
            _context.Entry(produto).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task RemoverProdutoAsync(int id)
        {
            var produto = await _context.Produtos.FindAsync(id);
            if (produto != null)
            {
                _context.Produtos.Remove(produto);
                await _context.SaveChangesAsync();
            }
        }

        public async Task<Produto> ToggleStatusProdutoAsync(int id)
        {
            var produto = await _context.Produtos.FindAsync(id);
            if (produto == null)
                return null;

            produto.Disponivel = !produto.Disponivel;
            _context.Entry(produto).State = EntityState.Modified;
            await _context.SaveChangesAsync();

            return produto;
        }
    }
}
