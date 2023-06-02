<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="casos.aspx.cs" Inherits="Proyecto_Des_App_Web.casos" %>

<!DOCTYPE html>
<html lang="es-mx">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles/main.css" />
    <script src="scripts/navbar.js" defer></script>
    <script src="scripts/casos.js"defer></script>
    <title>Casos</title>
  </head>
  <body class="">
    <header>
      <nav class="nav-horizontal">
        <ul>
          <li class="dashboard">
            <a href="index.aspx">Dashboard</a>
          </li>
          <li class="nav-item hide"><a href="clientes.aspx">Clientes</a></li>
          <li class="nav-item hide"><a href="casos.aspx">Casos</a></li>
          <li class="nav-item nav-right hide" ><a id="nav-element-cuenta">Cuenta</a></li>
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
          <div class="dropdown-content">
            <a href="logout.aspx">Cerrar sesión</a>
        </div>
      </nav>
    </header>
    <main>
      <h1 class="main-head">Casos</h1>
        <button class="btn-add" >Agregar cliente</button>
      <table class="full-table">
          <thead>
            <tr class="table-header-row">
              <th class="left-align" colspan="3">Clientes</th>
            </tr>
          </thead>
          <tbody class="full-table-body">
              <tr><td colspan="3">Cliente 1</td></tr>
              <tr><td>Caso 1</td><td><img src="img/edit-icon.svg" /></td><td><img src="img/delete-icon.svg" /></td></tr>
          </tbody>
      </table>

    </main>

    <!-- <footer>
      <p>Footer here</p>
    </footer> -->
  </body>
</html>
