using Microsoft.EntityFrameworkCore;
using PediTiscosAPI.Data;
using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Repositories
{
    public class CategoriaRepository : ICategoriaRepository
    {
        private readonly AppDbContext _context;

        public CategoriaRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Categoria>> ObterTodasCategoriasAsync()
        {
            return await _context.Categorias.ToListAsync();
        }

        public async Task<Categoria> ObterCategoriaPorIdAsync(int id)
        {
            return await _context.Categorias.FindAsync(id);
        }

        public async Task<Categoria> CriarCategoriaAsync(Categoria categoria)
        {
            _context.Categorias.Add(categoria);
            await _context.SaveChangesAsync();
            return categoria;
        }

        public async Task AtualizarCategoriaAsync(Categoria categoria)
        {
            _context.Entry(categoria).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task RemoverCategoriaAsync(int id)
        {
            var categoria = await _context.Categorias.FindAsync(id);
            if (categoria != null)
            {
                _context.Categorias.Remove(categoria);
                await _context.SaveChangesAsync();
            }
        }
    }
}
