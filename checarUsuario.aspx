<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checarUsuario.aspx.cs" Inherits="Proyecto_Des_App_Web.checarUsuario" %>
<%@ import namespace = "System" %>
<%@ import namespace = "System.Data.SqlClient" %>
<%@ import namespace = "System.Configuration" %>

<%	//Archivo:  checarUsuario.aspx
	string user = Request.Form["user"];
	string password = Request.Form["password"];
	bool userIsCorrect = false;
	bool passwordIsCorrect = false;

	string sql = @"SELECT password_hash, password_salt FROM dbo.Usuarios WHERE usuario = @user" ;

	using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))

	{
		conn.Open();

		SqlCommand cmd = new SqlCommand(sql,conn);

		cmd.Parameters.AddWithValue("@user", user);

		SqlDataReader passwordInfo = cmd.ExecuteReader();

		if(passwordInfo.Read())
		{
			userIsCorrect = true;
			string passwordHashCheck = passwordInfo[0].ToString();
			string passwordSaltCheck = passwordInfo[1].ToString();
			passwordIsCorrect = Proyecto_Des_App_Web.guardarUsuario.VerifyPassword(password, passwordSaltCheck, passwordHashCheck);
			if (passwordIsCorrect)
			{
				Session["LoggedIn"] = true;
			}
		}
		conn.Close();
		Response.Write($"{userIsCorrect},{passwordIsCorrect}");
	}


%>
