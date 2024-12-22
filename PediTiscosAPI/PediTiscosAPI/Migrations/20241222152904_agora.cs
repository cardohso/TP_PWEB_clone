using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace PediTiscosAPI.Migrations
{
    /// <inheritdoc />
    public partial class agora : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Categorias",
                columns: new[] { "Id", "Nome" },
                values: new object[,]
                {
                    { 1, "Entradas" },
                    { 2, "Pratos Principais" },
                    { 3, "Sobremesas" }
                });

            migrationBuilder.InsertData(
                table: "Pedidos",
                columns: new[] { "Id", "ClienteId", "Data" },
                values: new object[] { 1, "cliente_1", new DateTime(2024, 12, 22, 15, 29, 4, 281, DateTimeKind.Local).AddTicks(5709) });

            migrationBuilder.InsertData(
                table: "Produtos",
                columns: new[] { "Id", "Ativo", "CategoriaId", "Descricao", "Estoque", "Nome", "PedidoId", "Preco" },
                values: new object[,]
                {
                    { 1, true, 1, "Bolinho frito de bacalhau", 100, "Bolinho de Bacalhau", null, 5.00m },
                    { 2, true, 2, "Bife grelhado com batatas", 50, "Bife à Portuguesa", null, 15.50m },
                    { 3, true, 3, "Doce tradicional português", 200, "Pastel de Nata", null, 2.50m }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Pedidos",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Produtos",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Produtos",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Produtos",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Categorias",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Categorias",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Categorias",
                keyColumn: "Id",
                keyValue: 3);
        }
    }
}
