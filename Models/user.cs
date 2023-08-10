using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingList.Models
{
    public class user
    {
        [Key]
        public int userId { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string email { get; set; }
        public string password { get; set; }

        public bool isAdmin { get; set; }
    }
}
