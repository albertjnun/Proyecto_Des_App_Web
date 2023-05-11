<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="guardarUsuario.aspx.cs"%>
<%@ import namespace = "System" %>
<%@ import namespace = "System.Data.SqlClient" %>
<%@ import namespace = "System.Configuration" %>


<%	//Archivo:  guardarUsuario.aspx
	string user   = Request.Form["login_email"];
	string password = Request.Form["login_pass"];

	//Salt generation
	byte[] salt = new byte[16];
	using (var rng = new System.Security.Cryptography.RNGCryptoServiceProvider())
	{
		rng.GetBytes(salt);
	}
	string saltString = Convert.ToBase64String(salt);
	
	//Hashed password generation
	string hashedPassword = Proyecto_Des_App_Web.guardarUsuario.HashPassword(password, saltString);

	string sql = @"INSERT dbo.Usuarios VALUES (@user, @password_hash, @salt)" ;

	using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))

	{
		conn.Open();

		SqlCommand cmd = new SqlCommand(sql,conn);

		cmd.Parameters.AddWithValue("@user", user);
		cmd.Parameters.AddWithValue("@password_hash", hashedPassword);
		cmd.Parameters.AddWithValue("@salt", saltString);

		try
		{
			cmd.ExecuteNonQuery();
			conn.Close();
			Response.Redirect("login.aspx");
		}
		catch(Exception e)
		{
			Response.Write("Excepcion:" + e);
			conn.Close();
			Response.Write("Error al guardar los datos<br>");

		}

	}
    %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>

</body>
</html>
