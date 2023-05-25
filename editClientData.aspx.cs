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
    public class ClientDataWithId
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Email { get; set; }
        public DateTime Fecha { get; set; }
        public string Identificacion { get; set; }
        public string EstadoCivil { get; set; }
    }
    public partial class editClientData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string requestBody = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            ClientDataWithId data = serializer.Deserialize<ClientDataWithId>(requestBody);
            EditClientData(data);
        }
        public void EditClientData(ClientDataWithId data)
        {
            string formattedDate = data.Fecha.ToString("yyyy-MM-dd");

            string sql = @"UPDATE Clientes
                            SET Nombre = @Nombre,
                                Apellido_paterno = @Apellido_paterno,
                                Apellido_materno = @Apellido_materno,
                                Direccion = @Direccion,
                                Telefono = @Telefono,
                                Correo = @Correo,
                                Fecha_nacimiento = @Fecha_nacimiento,
                                Identificacion = @Identificacion,
                                Estado_civil = @Estado_civil
                            WHERE cliente_id = @cliente_id";
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
                if (data.EstadoCivil == "")
                {
                    cmd.Parameters.AddWithValue("@Estado_civil", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Estado_civil", data.EstadoCivil);
                }
                cmd.Parameters.AddWithValue("@cliente_id", data.Id);

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