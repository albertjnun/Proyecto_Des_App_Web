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
        public List<string> nameList = new List<string>();
        public List<string> phoneList = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Checar si usuario esta logeado para acceso
            if (Session["LoggedIn"] == null || !(bool)Session["LoggedIn"])
            {
                Response.Redirect("login.aspx");
            }

            string Nombre, Telefono;

            string sql = @"SELECT Nombre, Telefono FROM Clientes ";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))

            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {

                    Nombre = dr[0].ToString();
                    nameList.Add(Nombre);
                    Telefono = dr[1].ToString();
                    phoneList.Add(Telefono);


                }

                conn.Close();

            }
        }
        public string CreateClientesTable(int index)
        {
            StringBuilder tablaClientes = new StringBuilder();
            int maxIndex = index + 20;
            while (index < nameList.Count)
            {
                if (index == maxIndex) break;
                tablaClientes.Append($"<tr><td>{nameList[index]}</td><td>{phoneList[index]}</td>");
                tablaClientes.Append($"<td class=\"center-align\">\r\n<button>\r\n<img src=\"img/edit-icon.svg\" class=\"button-img-edit\"/>\r\n</button>\r\n</td>\r\n<td class=\"center-align\">\r\n<button>\r\n<img src=\"img/delete-icon.svg\" class=\"button-img-delete\" />\r\n</button>\r\n</td></tr>");
                index ++;
            }
            return tablaClientes.ToString();
        }
    }
}