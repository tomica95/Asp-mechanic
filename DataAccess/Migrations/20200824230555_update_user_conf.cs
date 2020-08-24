using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.Migrations
{
    public partial class update_user_conf : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CarUser_Users_UserId",
                table: "CarUser");

            migrationBuilder.AddForeignKey(
                name: "FK_CarUser_Users_UserId",
                table: "CarUser",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CarUser_Users_UserId",
                table: "CarUser");

            migrationBuilder.AddForeignKey(
                name: "FK_CarUser_Users_UserId",
                table: "CarUser",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
