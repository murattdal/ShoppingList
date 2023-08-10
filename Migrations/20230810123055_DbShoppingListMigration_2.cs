using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ShoppingList.Migrations
{
    /// <inheritdoc />
    public partial class DbShoppingListMigration_2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "isAdmin",
                table: "users",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "isAdmin",
                table: "users");
        }
    }
}
