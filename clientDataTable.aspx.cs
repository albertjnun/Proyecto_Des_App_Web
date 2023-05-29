using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Des_App_Web
{
    public partial class clientDataTable : System.Web.UI.Page
    {
        public List<ClientDataWithId> clientList = new List<ClientDataWithId>();
        protected void Page_Load(object sender, EventArgs e)
        {
            getClientTable();
            string jsonData = JsonConvert.SerializeObject(clientList, new JsonSerializerSettings
            {
                DateFormatString = "yyyy-MM-dd",
                Formatting = Formatting.Indented,
            });
            Response.ContentType = "application/json";
            Response.Write(jsonData);
        }
        public void getClientTable()
        {
            string sql = @"SELECT * FROM Clientes";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))

            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    ClientDataWithId client = new ClientDataWithId();

                    client.Id = dr.GetInt32(dr.GetOrdinal("cliente_id"));
                    client.Nombre = dr.GetString(dr.GetOrdinal("Nombre"));
                    client.ApellidoPaterno = dr.GetString(dr.GetOrdinal("Apellido_paterno"));
                    if (dr.IsDBNull(2))
                    {
                        client.ApellidoMaterno = "";
                    }
                    else
                    {
                        client.ApellidoMaterno = dr.GetString(dr.GetOrdinal("Apellido_materno"));
                    }
                    client.Direccion = dr.GetString(dr.GetOrdinal("Direccion"));
                    client.Telefono = dr.GetString(dr.GetOrdinal("Telefono"));
                    client.Email = dr.GetString(dr.GetOrdinal("Correo"));
                    client.Fecha = dr.GetDateTime(dr.GetOrdinal("Fecha_nacimiento"));
                    client.Identificacion = dr.GetString(dr.GetOrdinal("Identificacion"));
                    if (dr.IsDBNull(8))
                    {
                        client.EstadoCivil = "";
                    }
                    else
                    {
                        client.EstadoCivil = dr.GetString(dr.GetOrdinal("Estado_civil"));
                    }

                    clientList.Add(client);

                }

                conn.Close();
            }
        }
    }
}