using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Des_App_Web
{
    public class ClientDataWithCasos
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public List<Casos> Casos { get; set; } = new List<Casos>();
    }
    public class Casos
    {
        public int Id { get; set; }
        public string Numero_expediente { get; set; }
        public string Descripcion { get; set; }
        public DateTime Fecha_inicio { get; set; }
        public string Juzgado_inicial { get; set; }
        public string Juzgado_actual { get; set; }
        public string Estado { get; set; }
        public string Tipo { get; set; }
    }
        public partial class casosDataTable : System.Web.UI.Page
    {
        List<ClientDataWithCasos> clientesList = new List<ClientDataWithCasos>();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetClientNamesAndIds();
            GetClientCasos();
            string jsonData = JsonConvert.SerializeObject(clientesList, new JsonSerializerSettings
            {
                DateFormatString = "yyyy-MM-dd",
                Formatting = Formatting.Indented,
            });
            Response.ContentType = "application/json";
            Response.Write(jsonData);
        }
        public void GetClientNamesAndIds()
        {
            string sql = @"SELECT Nombre, cliente_id FROM Clientes";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    ClientDataWithCasos client = new ClientDataWithCasos();

                    client.Id = dr.GetInt32(dr.GetOrdinal("cliente_id"));
                    client.Nombre = dr.GetString(dr.GetOrdinal("Nombre"));

                    clientesList.Add(client);
                }
                conn.Close();
            }
        }
        public void GetClientCasos()
        {
            clientesList.ForEach(client =>
            {
                string sql = "SELECT * FROM Casos WHERE cliente_id = @cliente_id";
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
                    cmd.Parameters.AddWithValue("@cliente_id", client.Id);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        Casos caso = new Casos();
                        caso.Id = dr.GetInt32(dr.GetOrdinal("casos_id"));
                        caso.Numero_expediente = dr.GetString(dr.GetOrdinal("Numero_expediente"));
                        caso.Descripcion = dr.GetString(dr.GetOrdinal("Descripcion"));
                        caso.Fecha_inicio = dr.GetDateTime(dr.GetOrdinal("Fecha_inicio"));
                        caso.Juzgado_inicial = dr.GetString(dr.GetOrdinal("Juzgado_inicial"));
                        caso.Juzgado_actual = dr.GetString(dr.GetOrdinal("Juzgado_actual"));
                        caso.Estado = dr.GetString(dr.GetOrdinal("Estado"));
                        caso.Tipo = dr.GetString(dr.GetOrdinal("Tipo"));

                        client.Casos.Add(caso);
                        
                    }
                }
            });
        }
    }
}