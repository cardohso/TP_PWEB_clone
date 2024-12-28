using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PediTiscosAPI.Migrations
{
    /// <inheritdoc />
    public partial class pedro : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CarrinhosCompra");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "CarrinhosCompra",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    // Outros campos
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CarrinhosCompra", x => x.Id);
                });
        }
    }
}

