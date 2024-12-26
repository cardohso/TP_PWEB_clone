using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PediTiscosAPI.Migrations
{
    /// <inheritdoc />
    public partial class First : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Pedidos",
                keyColumn: "Id",
                keyValue: 1,
                column: "Data",
                value: new DateTime(2024, 12, 26, 22, 3, 33, 258, DateTimeKind.Local).AddTicks(9204));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Pedidos",
                keyColumn: "Id",
                keyValue: 1,
                column: "Data",
                value: new DateTime(2024, 12, 26, 22, 2, 29, 218, DateTimeKind.Local).AddTicks(1012));
        }
    }
}
