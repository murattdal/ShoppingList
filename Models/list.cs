using System.ComponentModel.DataAnnotations;

namespace ShoppingList.Models
{
    public class list
    {
        [Key]
        public int listId { get; set; }
        public string listName { get; set; }

        public int userId { get; set; }
        public bool situation { get; set; }


    }
}
