using System.ComponentModel.DataAnnotations;

namespace ShoppingList.Models
{
    public class productImage
    {
        [Key]
        public int ImageId { get; set; }
        public string ImageName { get; set; }
        public string ImageUrl { get; set; }
        public string Category { get; set; }
    }
}
