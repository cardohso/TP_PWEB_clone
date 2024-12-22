using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PediTiscosAPI.Migrations
{
    /// <inheritdoc />
    public partial class Pagamentos : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Pagamentos",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PedidoId = table.Column<int>(type: "int", nullable: false),
                    Valor = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    MetodoPagamento = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Data = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Pagamentos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Pagamentos_Pedidos_PedidoId",
                        column: x => x.PedidoId,
                        principalTable: "Pedidos",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Pagamentos",
                columns: new[] { "Id", "Data", "MetodoPagamento", "PedidoId", "Status", "Valor" },
                values: new object[] { 1, new DateTime(2024, 12, 22, 20, 6, 41, 161, DateTimeKind.Local).AddTicks(1487), "Cartão", 1, "Pendente", 25.00m });

            migrationBuilder.UpdateData(
                table: "Pedidos",
                keyColumn: "Id",
                keyValue: 1,
                column: "Data",
                value: new DateTime(2024, 12, 22, 20, 6, 41, 160, DateTimeKind.Local).AddTicks(9021));

            migrationBuilder.CreateIndex(
                name: "IX_Pagamentos_PedidoId",
                table: "Pagamentos",
                column: "PedidoId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Pagamentos");

            migrationBuilder.UpdateData(
                table: "Pedidos",
                keyColumn: "Id",
                keyValue: 1,
                column: "Data",
                value: new DateTime(2024, 12, 22, 15, 29, 4, 281, DateTimeKind.Local).AddTicks(5709));
        }
    }
}
