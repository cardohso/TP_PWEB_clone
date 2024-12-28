using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using PediTiscosAPI.Entities;
using Microsoft.AspNetCore.Identity;

namespace PediTiscosAPI.Data
{
    public class AppDbContext : IdentityDbContext<ApplicationUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        // Definições dos DbSet para as entidades
        public DbSet<Produto> Produtos { get; set; }
        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Pedido> Pedidos { get; set; }
        public DbSet<Pagamento> Pagamentos { get; set; }
        public DbSet<ModoEntrega> ModosEntrega { get; set; }
        public DbSet<ItemCarrinhoCompra> ItensCarrinhoCompra { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Relacionamento entre Produto e ModoEntrega
            modelBuilder.Entity<Produto>()
                .HasOne(p => p.modoentrega)
                .WithMany() // Supondo que ModoEntrega tem uma lista de Produtos
                .HasForeignKey(p => p.ModoEntregaId);

            // Relacionamento entre Produto e Categoria
            modelBuilder.Entity<Produto>()
                .HasOne(p => p.categoria)
                .WithMany() // Supondo que Categoria tem uma lista de Produtos
                .HasForeignKey(p => p.CategoriaId);

            // Populando Pedidos (opcional)
            modelBuilder.Entity<Pedido>().HasData(
                new Pedido { Id = 1, Data = DateTime.Now, ClienteId = "cliente_1" }
            );

            // Configuração do relacionamento entre Pagamento e Pedido
            modelBuilder.Entity<Pagamento>()
                .HasOne(p => p.Pedido)
                .WithMany()
                .HasForeignKey(p => p.PedidoId);
            modelBuilder.Entity<ItemCarrinhoCompra>()
    .Property(i => i.PrecoUnitario)
    .HasColumnType("decimal(18,2)");

            modelBuilder.Entity<ItemCarrinhoCompra>()
                .Property(i => i.ValorTotal)
                .HasColumnType("decimal(18,2)");

        }

    }
}
