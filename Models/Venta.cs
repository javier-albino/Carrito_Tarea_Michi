//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Carrito_Tarea_Michi.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Venta
    {
        public Venta()
        {
            this.ListaVenta = new HashSet<ListaVenta>();
        }
    
        public int Id { get; set; }
        public Nullable<System.DateTime> DiaVenta { get; set; }
        public Nullable<double> Subtotal { get; set; }
        public Nullable<double> Iva { get; set; }
        public Nullable<double> Total { get; set; }
    
        public virtual ICollection<ListaVenta> ListaVenta { get; set; }
    }
}
