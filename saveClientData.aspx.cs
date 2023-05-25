using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Des_App_Web
{
    
    public partial class saveClientData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string requestBody = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            ClientData data = serializer.Deserialize<ClientData>(requestBody);
            SaveClientData(data);
            

        }
        public void SaveClientData(ClientData data) {
            string formattedDate = data.Fecha.ToString("yyyy-MM-dd");

            string sql = @"INSERT INTO Clientes            
                                        ([Nombre]
                                       ,[Apellido_paterno]
                                       ,[Apellido_materno]
                                       ,[Direccion]
                                       ,[Telefono]
                                       ,[Correo]
                                       ,[Fecha_nacimiento]
                                       ,[Identificacion]
                                       ,[Estado_civil])
                               VALUES (
                                        @Nombre, 
                                        @Apellido_paterno, 
                                        @Apellido_materno, 
                                        @Direccion, 
                                        @Telefono, 
                                        @Correo, 
                                        @Fecha_nacimiento, 
                                        @Identificacion,
                                        @Estado_civil)";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@Nombre", data.Nombre);
                cmd.Parameters.AddWithValue("@Apellido_paterno", data.ApellidoPaterno);
                if (data.ApellidoMaterno == "")
                {
                    cmd.Parameters.AddWithValue("@Apellido_materno", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Apellido_materno", data.ApellidoMaterno);
                }
                cmd.Parameters.AddWithValue("@Direccion", data.Direccion);
                cmd.Parameters.AddWithValue("@Telefono", data.Telefono);
                cmd.Parameters.AddWithValue("@Correo", data.Email);
                cmd.Parameters.AddWithValue("@Fecha_nacimiento", formattedDate);
                cmd.Parameters.AddWithValue("@Identificacion", data.Identificacion);
                if(data.EstadoCivil == "")
                {
                    cmd.Parameters.AddWithValue("@Estado_civil", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Estado_civil", data.EstadoCivil);
                }

                try
                {
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.StatusCode = 500;
                    conn.Close();       
                }
                
            }
        } 
    }
}