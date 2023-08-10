using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using ShoppingList.Models;
using System.Diagnostics;
using System.Security.Claims;
using System.Security.Cryptography.X509Certificates;

namespace ShoppingList.Controllers
{
    public class HomeController : Controller
    {
        Context context = new Context();


        [Authorize]
        [HttpGet]
        public IActionResult HomePage()
        {

            try
            {
                var userIdClaim = HttpContext.User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier);
                int? userId = int.TryParse(userIdClaim?.Value, out int parsedUserId) ? parsedUserId : (int?)null;


                List<list> listDetail = context.lists
                                                .Where(u => u.userId == userId)
                                                .ToList();


                return View(listDetail);

            }
            catch (Exception ex)
            {

                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;

                return View();
            }

        }


        [HttpPost]//liste eklemek için gerekli method
        public IActionResult HomePage(list _list)
        {
            try
            {
                var userIdClaim = HttpContext.User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier);
                if (userIdClaim != null && int.TryParse(userIdClaim.Value, out int userId))
                {

                    if (User.Identity.IsAuthenticated)
                    {
                        _list.listName = Request.Form["listName"];
                        _list.userId = userId;
                        context.lists.Add(_list);

                        context.SaveChanges();
                        return RedirectToAction("HomePage");


                    }
                }
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }

            return View();


        }

        public IActionResult ListDelete(int id)
        {
            try
            {
                var list = context.lists.Find(id);
                context.lists.Remove(list);
                context.SaveChanges();
            }
            catch (Exception ex) 
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }
            return RedirectToAction("HomePage");
        }

    }
}