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
        public DbSet<ModoEntrega> ModosEntrega { get; set; } // Certifique-se de que a classe ModoEntrega exista

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
                new Produto
                {
                    Id = 1,
                    Nome = "Bolinho de Bacalhau",
                    Preco = 5.00m,
                    Detalhe = "Bolinho frito de bacalhau",
                    EmStock = 100,
                    CategoriaId = 1,
                    Disponivel = true,
                    UrlImagem = "https://exemplo.com/imagem1.jpg",
                    Promocao = false,
                    MaisVendido = true
                },
                new Produto
                {
                    Id = 2,
                    Nome = "Bife à Portuguesa",
                    Preco = 15.50m,
                    Detalhe = "Bife grelhado com batatas",
                    EmStock = 50,
                    CategoriaId = 2,
                    Disponivel = true,
                    UrlImagem = "https://exemplo.com/imagem2.jpg",
                    Promocao = true,
                    MaisVendido = false
                },
                new Produto
                {
                    Id = 3,
                    Nome = "Pastel de Nata",
                    Preco = 2.50m,
                    Detalhe = "Doce tradicional português",
                    EmStock = 200,
                    CategoriaId = 3,
                    Disponivel = true,
                    UrlImagem = "https://exemplo.com/imagem3.jpg",
                    Promocao = false,
                    MaisVendido = true
                }
            );

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
        }
    }
}
