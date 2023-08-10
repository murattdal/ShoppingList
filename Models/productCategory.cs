using System.ComponentModel.DataAnnotations;

namespace ShoppingList.Models
{
    public class productCategory
    {
        [Key]

        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
    }
}
