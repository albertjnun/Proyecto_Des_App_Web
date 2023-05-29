using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Des_App_Web
{
    public partial class clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Checar si usuario esta logeado para acceso
            if (Session["LoggedIn"] == null || !(bool)Session["LoggedIn"])
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}