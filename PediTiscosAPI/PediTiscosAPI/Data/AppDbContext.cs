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
        public DbSet<Pagamento> Pagamentos { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Populando Categorias (deve ser inserido primeiro)
            modelBuilder.Entity<Categoria>().HasData(
                new Categoria { Id = 1, Nome = "Entradas" },
                new Categoria { Id = 2, Nome = "Pratos Principais" },
                new Categoria { Id = 3, Nome = "Sobremesas" }
            );

            // Populando Produtos (depois das categorias)
            modelBuilder.Entity<Produto>().HasData(
                new Produto { Id = 1, Nome = "Bolinho de Bacalhau", Preco = 5.00m, Descricao = "Bolinho frito de bacalhau", Estoque = 100, CategoriaId = 1, Ativo = true },
                new Produto { Id = 2, Nome = "Bife à Portuguesa", Preco = 15.50m, Descricao = "Bife grelhado com batatas", Estoque = 50, CategoriaId = 2, Ativo = true },
                new Produto { Id = 3, Nome = "Pastel de Nata", Preco = 2.50m, Descricao = "Doce tradicional português", Estoque = 200, CategoriaId = 3, Ativo = true }
            );

            // Populando Pedidos (opcional)
            modelBuilder.Entity<Pedido>().HasData(
                new Pedido { Id = 1, Data = DateTime.Now, ClienteId = "cliente_1" }
            );
            modelBuilder.Entity<Pagamento>()
            .HasOne(p => p.Pedido)
            .WithMany()
            .HasForeignKey(p => p.PedidoId);

            // Populando dados iniciais, se necessário
            modelBuilder.Entity<Pagamento>().HasData(
                new Pagamento
                {
                    Id = 1,
                    PedidoId = 1,
                    Valor = 25.00m,
                    MetodoPagamento = "Cartão",
                    Status = "Pendente",
                    Data = DateTime.Now
                }
            );
        }


    }
}
