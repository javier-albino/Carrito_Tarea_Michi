using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Carrito_Tarea_Michi.Models
{
    public class CarritoItem
    {
        private Producto _producto;
        private int _Cantidad;

       public CarritoItem()
        {

        }
        public CarritoItem(Producto producto , int cantidad)
        {
            this.Producto = producto;
            this.Cantidad = cantidad;
        }

        public Producto Producto { get => _producto; set => _producto = value; }
        public int Cantidad { get => _Cantidad; set => _Cantidad = value; }
    }
}