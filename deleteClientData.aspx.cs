using Newtonsoft.Json;
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
    public partial class deleteClientData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string requestBody = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            FetchRequestClientId data = serializer.Deserialize<FetchRequestClientId>(requestBody);
            DeleteClientData(data.ClientId);

        }
        public void DeleteClientData(int clientId)
        {
            string sql = @"DELETE FROM Clientes WHERE cliente_id = @cliente_id";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql,conn);

                cmd.Parameters.AddWithValue("@cliente_id", clientId);

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