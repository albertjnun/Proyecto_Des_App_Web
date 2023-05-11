<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="Proyecto_Des_App_Web.registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="styles/login.css" />
  </head>
  <body>
    <header>
      <h1 class="header_main">Despacho Jurídico César Pérez Hernández</h1>
    </header>
    <main>
      <form class="input_box" method="post" action="guardarUsuario.aspx">
        <input
          type="text"
          class="correo"
          id="login_email"
          name="login_email"
          placeholder="Correo"
        />
        <input
          type="password"
          id="login_pass"
          name="login_pass"
          placeholder="Contraseña"
        />
        <button type="submit" id="button_registrar" class="btn">Registrar</button>
        <button type="button" id="button_cancelar" class="btn">Cancelar</button>
      </form>
    </main>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
          let btnCancelar = document.querySelector("#button_cancelar");
          btnCancelar.addEventListener("click", function (event) {
              event.preventDefault();
              window.location.href = "login.aspx";
          })
      });
    </script>
  </body>
</html>