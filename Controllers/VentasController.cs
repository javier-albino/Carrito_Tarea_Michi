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
    public class VentasController : Controller
    {
       
        
            //
            // GET: /Venta/
            private CarritoBDEntities ce = new CarritoBDEntities();

            public ActionResult Index()
            {
                return View(ce.Venta.ToList().OrderBy(x => x.DiaVenta));
            }

            public ActionResult Detalles(int Id)
            {
                return View(ce.Venta.Find(Id));
            }

        }
    }
