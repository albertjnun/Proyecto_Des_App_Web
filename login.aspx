<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs"
Inherits="Proyecto_Des_App_Web.login" %>

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
      <form class="input_box" method="post">
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
        <button type="button" id="button_acceder" class="btn">Acceder</button>
        <p class="olvido">
          Olvidó su contraseña?
          <a href="login_change.html" class="cambiar"
            ><b>Cambiar contraseña</b></a
          >
        </p>
      </form>
    </main>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        document
          .querySelector("#button_acceder")
          .addEventListener("click", function () {
            window.location.href = "index.html";
          });
      });
    </script>
  </body>
</html>
