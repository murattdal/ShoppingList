using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ShoppingList.Models;

namespace ShoppingList.Controllers
{
    public class AdminController : Controller
    {
        Context _context = new Context();

        [Authorize]
        [HttpGet]
        public IActionResult AdminHomePage()
        {
            try
            {

                List<productImage> productDetail = _context.productImages.ToList();

                return View(productDetail);

            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;

                return View();

            }
        }

        [HttpGet]
        public IActionResult ProductsAddPage()
        {
            try
            {
                List<string> productCategory = _context.productCategorys
                                                       .Select(p => p.CategoryName)
                                                       .ToList();


                ViewBag.ProductCategory = productCategory;
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }

            return View();
        }


        [HttpPost]
        public IActionResult ProductsAddPage(productImage productImage) 
        {

            try
            {
                productImage.ImageName = Request.Form["productName"];
                productImage.Category = Request.Form["productCategory"];
                productImage.ImageUrl = Request.Form["productImage"];

                _context.productImages.Add(productImage);

                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }
            return RedirectToAction("AdminHomePage");
        }

        [HttpPost]
        public IActionResult ProductUpdate(int id)
        {
            try
            {

                var pro = _context.productImages.Find(id);


                pro.Category = Request.Form["productUpdateCategory"];
                pro.ImageName = Request.Form["productUpdateName"];
                pro.ImageUrl = Request.Form["productUpdateImage"];

                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }

            return RedirectToAction("AdminHomePage");
        }

        public IActionResult ProductDelete(int id)
        {
            try
            {
                var product = _context.productImages.Find(id);
                _context.productImages.Remove(product);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }
            return RedirectToAction("AdminHomePage");
        }


        [HttpGet]
        public IActionResult CategoryAddPage()
        {

            try
            {
                List<productCategory> category = _context.productCategorys
                                                        .ToList();


                return View(category);
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;

                return View();
            }

            
        }

        [HttpPost]
        public IActionResult CategoryAddPage(productCategory _productCategory)
        {

            try
            {
                _productCategory.CategoryName = Request.Form["category"];


                _context.productCategorys.Add(_productCategory);

                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }
            return RedirectToAction("CategoryAddPage");
        }

        [HttpPost]
        public IActionResult CategoryUpdate(int id)
        {
            try 
            {
                var pro = _context.productCategorys.Find(id);


                pro.CategoryName = Request.Form["UpdateCategory"];

                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }

            return RedirectToAction("CategoryAddPage");
        }

        public IActionResult CategoryDelete(int id)
        {
            try
            {
                var productCategory = _context.productCategorys.Find(id);
                _context.productCategorys.Remove(productCategory);
                _context.SaveChanges();

            }catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Bir hata oluştu: " + ex.Message;
            }
            return RedirectToAction("CategoryAddPage");
        }
    }
}
