using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json.Linq;
using ShoppingList.Models;
using System.Collections.Generic;
using System.Security.Claims;

namespace ShoppingList.Controllers
{
    public class ProductController : Controller
    {
        Context context = new Context();

        [HttpGet]
        public IActionResult ProductPage(int listId)
        {
            try
            {
                var result = context.products.Where(x => x.listId == listId).ToList();

                List<string> productsByCategory = context.productImages
                                                            .Select(p => p.Category)
                                                            .Distinct()
                                                            .ToList();


                ViewBag.ProductsByCategory = productsByCategory;


                //ViewBag.productsDropdownList = productsDropdownList;
                ViewBag.listIdProductPage = listId;

                // Situation durumunu alın ve ViewBag ile taşıyın
                bool situation = context.lists.Where(l => l.listId == listId).Select(l => l.situation).FirstOrDefault();
                ViewBag.Situation = situation;

                // listenin adını ViewBag'e ekler (Sayfada göstermek için)
                ViewBag.ListName = context.lists
                    .Where(e => e.listId == listId)
                    .Select(e => e.listName)
                    .FirstOrDefault();

                return View(result);
            }catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;

                return View();
            }
        }

        public IActionResult GetProductsByCategory(string category)
        {
            try
            {
                var productsInCategory = context.productImages
                .Where(p => p.Category == category)
                .ToList();

                return Json(productsInCategory);
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }

            return View();
            
        }




        [HttpPost]//ürün eklemek için gerekli method
        public IActionResult ProductPage(product _product)
        {
            try
            {
                var userIdClaim = HttpContext.User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier);
                if (userIdClaim != null && int.TryParse(userIdClaim.Value, out int userId))
                {

                    if (User.Identity.IsAuthenticated)
                    {
                        string selectedProduct = Request.Form["selectedProduct"];
                        var productList = context.lists.FirstOrDefault(pl => pl.listId == _product.listId);
                        var productUrl = context.productImages
                                                .Where(e => e.ImageName == selectedProduct)
                                                .Select(e => e.ImageUrl)
                                                .FirstOrDefault();

                        var productCategory = context.productImages
                                                .Where(e => e.ImageName == selectedProduct)
                                                .Select(e => e.Category)
                                                .FirstOrDefault();

                        int listId = productList.listId;

                        _product.productName = Request.Form["selectedProduct"];
                        _product.productDescription = Request.Form["productDescription"];
                        _product.listId = listId;
                        _product.userId = userId;
                        _product.productUrl = productUrl;
                        _product.productCategory = productCategory;
                        context.products.Add(_product);

                        context.SaveChanges();
                        return RedirectToAction("ProductPage", new { listId = listId });


                    }
                }
            }catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }

            return View();


        }

        public IActionResult ProductDelete(int id)
        {
            try
            {
                var product = context.products.Find(id);
                var listId = product.listId;
                context.products.Remove(product);
                context.SaveChanges();
                return RedirectToAction("ProductPage", new { listId = listId });
            }catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;

                return View();
            }
        }

        [HttpPost]
        public IActionResult ProductUpdate(int id)
        {
            try
            {
                var pro = context.products.Find(id);
                var listId = pro.listId;

                string productDescriptionUpdate = Request.Form["productDescriptionUpdate"];

                pro.productDescription = productDescriptionUpdate;

                context.SaveChanges();

                return RedirectToAction("ProductPage", new { listId = listId });
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;

                return View();
            }
        }

        [HttpPost]
        public IActionResult ToggleShoppingStatus(int id)
        {
            try
            {
                var pro = context.lists.Find(id);
                var listId = pro.listId;


                pro.situation = !pro.situation;

                context.SaveChanges();

                return RedirectToAction("ProductPage", new { listId = listId });
            }catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;

                return View();
            }
        }




    }
}
