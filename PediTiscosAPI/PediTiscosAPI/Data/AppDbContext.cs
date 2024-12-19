using System.Collections.Generic;


using Microsoft.EntityFrameworkCore;
using PediTiscosAPI.Entities;

namespace PediTiscosAPI.Data

{

    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<Produto> Produtos { get; set; }
        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Pedido> Pedidos { get; set; }
    }
}
