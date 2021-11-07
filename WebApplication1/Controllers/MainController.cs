using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Controllers
{
    public class MainController : Controller
    {
        
        // GET: Main
        public ActionResult Index()
        {
            Models.CRUDclass handle = new Models.CRUDclass();
            ModelState.Clear();
            return View(handle.Select());
        }

        // GET: Main/Details/5
        public ActionResult Details(int id)
        {
            Models.CRUDclass handle = new Models.CRUDclass();
            return View(handle.Select().Find(model => model.ID==id ));
        }

        // GET: Main/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Main/Create
        [HttpPost]
        public ActionResult Create(Models.Dete model)
        {

            try
            {
                if (ModelState.IsValid)
                {
                    Models.CRUDclass handle = new Models.CRUDclass();
                    if (handle.Insert(model))
                    {
                        ModelState.Clear();
                    }
                }
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Main/Edit/5
        public ActionResult Edit(int id)
        {
            Models.CRUDclass handle = new Models.CRUDclass();
            return View(handle.Select().Find(model => model.ID==id));
        }

        // POST: Main/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Models.Dete model)
        {
            try
            {
                Models.CRUDclass handle = new Models.CRUDclass();
                if (handle.Update(model))
                {

                }               
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                
                return View();
            }
        }

        // GET: Main/Delete/5
        public ActionResult Delete(int id)
        {
            Models.CRUDclass handle = new Models.CRUDclass();
            return View(handle.Select().Find(model => model.ID==id));
        }

        // POST: Main/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Models.Dete model)
        {
            try
            {
                Models.CRUDclass handle = new Models.CRUDclass();
                if (handle.Delete(id))
                {
                   
                }
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
