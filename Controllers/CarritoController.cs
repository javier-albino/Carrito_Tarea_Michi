using Carrito_Tarea_Michi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Carrito_Tarea_Michi.Controllers
{
    public class CarritoController : Controller
    {
        // GET: Carrito
        private CarritoBDEntities db = new CarritoBDEntities();
        public ActionResult AgregaCarrito(int id)
        {
            if (Session["carrito"] == null)
            {
                List<CarritoItem> compras = new List<CarritoItem>();
                compras.Add(new CarritoItem(db.Producto.Find(id),1));
                Session["carrito"] = compras;
            }
            else
            {
                List<CarritoItem> compras = (List<CarritoItem>)Session["carrito"];
                int IndexExistente = getIndex(id); //nueva linea
                if (IndexExistente == -1)            //nueva linea
                    compras.Add(new CarritoItem(db.Producto.Find(id), 1));

                else    //nueva linea
                    compras[IndexExistente].Cantidad++; //nuevalinea
                Session["carrito"] = compras;
            }




            return View();
        }
        [HttpPost]
        public ActionResult AgregaCarrito()
        {
            return View();
        }

        public ActionResult Delete(int id)
        {
            List<CarritoItem> compras = (List<CarritoItem>)Session["carrito"];
            compras.RemoveAt(getIndex(id));
            return View("AgregaCarrito");
        }
        public ActionResult FinalizaCompra()
        {
            List<CarritoItem> compras = (List<CarritoItem>)Session["carrito"];
            if (compras != null && compras.Count > 0)
            {
                Venta nuevaVenta = new Venta();
                nuevaVenta.DiaVenta = DateTime.Now;
                nuevaVenta.Subtotal = compras.Sum(x => x.Producto.Precio * x.Cantidad);
                nuevaVenta.Iva = nuevaVenta.Subtotal * 0.16;
                nuevaVenta.Total = nuevaVenta.Subtotal + nuevaVenta.Iva;

                nuevaVenta.ListaVenta = (from producto in compras
                                         select new ListaVenta
                                         {
                                             ProductoId = producto.Producto.Id,
                                             Cantidad = producto.Cantidad,
                                             Total = producto.Cantidad * producto.Producto.Precio
                                         }).ToList();
                db.Venta.Add(nuevaVenta);
                db.SaveChanges();
                Session["carrito"] = new List<CarritoItem>();
            }
            return View();
        }


        private int getIndex(int id)
        {
            List<CarritoItem> compras = (List<CarritoItem>)Session["carrito"];
            for (int i = 0; i < compras.Count; i++)
            {
                if (compras[i].Producto.Id == id)
                    return i;
            }
            return -1;

        }
    }
}