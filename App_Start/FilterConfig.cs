using System.Web;
using System.Web.Mvc;

namespace Carrito_Tarea_Michi
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
