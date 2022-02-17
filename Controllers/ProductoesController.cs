using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Carrito_Tarea_Michi.Models;

namespace Carrito_Tarea_Michi.Controllers
{
    public class ProductoesController : Controller
    {
        private CarritoBDEntities db = new CarritoBDEntities();

        // GET: Productoes
        public ActionResult Index()
        {
            
            return View(db.Producto.ToList().OrderBy(x=>x.Nombre));
        }

        }
    }
