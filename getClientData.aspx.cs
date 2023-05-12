using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Proyecto_Des_App_Web
{
    public class ClientData
    {
        public string Nombre { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Email { get; set; }
        public DateTime Fecha { get; set; }
        public string Identificacion { get; set; }
        public string EstadoCivil { get; set; }
    }
    public class FetchRequestClientId
    {
        public int ClientId { get; set; }
    }
    //diagDireccion = responseData.nombre;
    //            diagEmail = responseData.nombre;
    //            diagFecha = responseData.nombre;
    //            diagIdentificacion = responseData.nombre;
    //            diagEstadoCivil = responseData.nombre;
    public partial class getClientData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string requestBody = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            FetchRequestClientId data = serializer.Deserialize<FetchRequestClientId>(requestBody);
            ClientData sendClient = RetrieveFullClientData( data.ClientId);
            string jsonData = JsonConvert.SerializeObject(sendClient);
            
            Response.ContentType = "application/json";
            Response.Write(jsonData);

        }
        public ClientData RetrieveFullClientData(int cliente_id)
        {
            ClientData data = new ClientData();
            string sqlFull = @"SELECT Nombre, Direccion, Telefono, Correo, Fecha_nacimiento, Identificacion, Estado_civil FROM Clientes WHERE cliente_id = @cliente_id";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sqlFull, conn);
                cmd.Parameters.AddWithValue("@cliente_id", cliente_id);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    data.Nombre=dr.GetString(0);
                    data.Direccion=dr.GetString(1);
                    data.Telefono=dr.GetString(2);
                    data.Email=dr.GetString(3);
                    data.Fecha=dr.GetDateTime(4);
                    data.Identificacion=dr.GetString(5);
                    if (dr.IsDBNull(6))
                    {
                        data.EstadoCivil = "";
                    }
                    else
                    {
                        data.EstadoCivil = dr.GetString(6);
                    }
                    
                }

            }
            return data;
        }
    }
}