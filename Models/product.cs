using System.ComponentModel.DataAnnotations;

namespace ShoppingList.Models
{
    public class product
    {
        [Key]
        public int productId { get; set; }
        public string productName { get; set; }
        public string productUrl { get; set; }

        public string productDescription { get; set; }
        public string productCategory { get; set; }

        public int listId { get; set; }
        public int userId { get; set; }

    }
}
