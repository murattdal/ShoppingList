using Microsoft.EntityFrameworkCore;

namespace ShoppingList.Models
{
    public class Context : DbContext
    {

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

            optionsBuilder.UseSqlServer("server=DESKTOP-FGF16P7\\SQLEXPRESS; " +
                                 "database=DbShoppingList; integrated security=true; TrustServerCertificate=true;");

        }
        public DbSet<list> lists { get; set; }

        public DbSet<product> products { get; set; }

        public DbSet<user> users { get; set; }

        public DbSet<productImage> productImages { get; set; }

        public DbSet<productCategory> productCategorys { get; set; }




    }
}
