using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ShoppingList.Migrations
{
    /// <inheritdoc />
    public partial class DbShoppingListMigration_1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "productCategory",
                table: "products",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "productCategory",
                table: "products");
        }
    }
}
