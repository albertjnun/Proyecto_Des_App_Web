﻿using System;
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
        private List<string> nameList = new List<string>();
        private List<string> phoneList = new List<string>();
        private List<int> idList = new List<int>();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Checar si usuario esta logeado para acceso
            if (Session["LoggedIn"] == null || !(bool)Session["LoggedIn"])
            {
                Response.Redirect("login.aspx");
            }

            string sql = @"SELECT Nombre, Telefono, cliente_id FROM Clientes ";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))

            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {

                    nameList.Add(dr.GetString(0));
                    phoneList.Add(dr.GetString(1));
                    idList.Add(dr.GetInt32(2));

                }

                conn.Close();

            }
        }
        public string CreateClientesTable(int index)
        {
            if(nameList.Count == 0)
            {
                return "<p>No hay clientes que mostrar</p>";
            }
            StringBuilder tablaClientes = new StringBuilder();
            int maxIndex = index + 20;
            while (index < nameList.Count)
            {
                if (index == maxIndex) break;
                tablaClientes.Append($"<tr data-cliente-id=\"{idList[index]}\"><td class=\"table-row-element\">{nameList[index]}</td><td class=\"table-row-element\">{phoneList[index]}</td>");
                tablaClientes.Append($"<td class=\"center-align\">\r\n<button>\r\n<img src=\"img/edit-icon.svg\" data-cliente-id=\"{idList[index]}\" class=\"button-img-edit\"/>\r\n</button>\r\n</td>\r\n<td class=\"center-align\">\r\n<button>\r\n<img src=\"img/delete-icon.svg\" class=\"button-img-delete\" />\r\n</button>\r\n</td></tr>");
                index ++;
            }
            return tablaClientes.ToString();
        }

    }
}