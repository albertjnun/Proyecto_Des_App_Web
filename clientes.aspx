<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientes.aspx.cs" Inherits="Proyecto_Des_App_Web.clientes" %>

<!DOCTYPE html>
<html lang="es-mx">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles/main.css" />
    <script src="scripts/script.js" defer></script>
    <title>Clientes</title>
  </head>
  <body class="">
    <header>
      <nav class="nav-horizontal">
        <ul>
          <li class="dashboard">
            <a href="#">Dashboard</a>
          </li>
          <li class="nav-item hide"><a href="clientes_2.html">Clientes</a></li>
          <li class="nav-item hide"><a href="#">Expedientes</a></li>
          <li class="nav-item nav-right hide"><a href="#">Cuenta</a></li>
          <li class="nav-button">
            <button class="burger-button">
              <img
                src="img/burger_menu_icon.png"
                class="burger-button-img"
              />
            </button>
          </li>
          <!-- <li class="icon"><img src="img/login_pic.png" width="10" /></li> -->
        </ul>
      </nav>
    </header>
    <main>
      <h1 class="main-head">Clientes</h1>
      <table class="full-table">
        <tr>
          <th>Nombre</th>
          <th>Teléfono</th>
          <th class="center-align">Modificar</th>
          <th class="center-align">Eliminar</th>
        </tr>
        <%= CreateClientesTable(0) %>
      </table>
    </main>

    <!-- <footer>
      <p>Footer here</p>
    </footer> -->
  </body>
</html>