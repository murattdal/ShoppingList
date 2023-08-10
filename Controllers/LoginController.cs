using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShoppingList.Models;
using System.Security.Claims;

namespace ShoppingList.Controllers
{
    public class LoginController : Controller
    {
        Context _context = new Context();

        [HttpGet]
        public async Task<IActionResult> LoginPage(user _user)
        {
            try
            {
                var userFromDb = _context.users.FirstOrDefault(x => x.email == _user.email && x.password == _user.password);

                if (userFromDb != null)
                {
                    if (userFromDb.isAdmin)
                    {
                        var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Email, userFromDb.email),
                        new Claim(ClaimTypes.Name, $"{userFromDb.firstName} {userFromDb.lastName}"),
                        new Claim(ClaimTypes.NameIdentifier, userFromDb.userId.ToString()),
                        new Claim(ClaimTypes.Role, "Admin") // Admin rolü eklendi
                    };

                        var userIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                        var userPrincipal = new ClaimsPrincipal(userIdentity);

                        await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, userPrincipal);

                        return RedirectToAction("AdminHomePage", "Admin"); // Admin paneline yönlendirir
                    }
                    else
                    {
                        // Diğer kullanıcı girişi işlemi
                        var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Email, userFromDb.email),
                        new Claim(ClaimTypes.Name, $"{userFromDb.firstName} {userFromDb.lastName}"),
                        new Claim(ClaimTypes.NameIdentifier, userFromDb.userId.ToString())
                    };

                        var userIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                        var userPrincipal = new ClaimsPrincipal(userIdentity);

                        await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, userPrincipal);

                        return RedirectToAction("HomePage", "Home"); // Kullanıcı paneline yönlendirir
                    }
                }

                
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;

                

            }

            return View();

        }

        [HttpGet]
        public async Task<IActionResult> LogOut()
        {
            try
            {
                await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
                
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }
            return RedirectToAction("LoginPage", "Login");
        }

        [HttpPost]
        public IActionResult CreateLogin()
        {
            try
            {
                user model = new user();
                model.firstName = Request.Form["firstName"];
                model.lastName = Request.Form["lastName"];
                model.email = Request.Form["email"];
                model.password = Request.Form["password"];
                model.isAdmin = false;

                _context.users.Add(model);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }
            return RedirectToAction("LoginPage", "Login");
        }
    }
}