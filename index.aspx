<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Proyecto_Des_App_Web.index" %>

<!DOCTYPE html>
<html lang="es-mx">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles/main.css" />
    <script src="scripts/script.js" defer></script>
    <title>Dashboard</title>
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
      <div class="grid-container">
        <div class="item-left">
          <h3>Clientes</h3>
          <table>
            <tr>
              <th>Nombre</th>
              <th>Teléfono</th>
              <th class="center-align">Modificar</th>
              <th class="center-align">Eliminar</th>
            </tr>
            <tr>
              <td>Cliente 1</td>
              <td>+52 123-456-7890</td>
              <td class="center-align">
                <button>
                  <img src="img/edit-icon.svg" class="button-img-edit" />
                </button>
              </td>
              <td class="center-align">
                <button>
                  <img src="img/delete-icon.svg" class="button-img-delete" />
                </button>
              </td>
            </tr>
            <tr>
              <td>Cliente 2</td>
              <td>+52 123-456-7890</td>
              <td class="center-align">
                <button>
                  <img src="img/edit-icon.svg" class="button-img-edit" />
                </button>
              </td>
              <td class="center-align">
                <button>
                  <img src="img/delete-icon.svg" class="button-img-delete" />
                </button>
              </td>
            </tr>
            <tr>
              <td>Cliente 3</td>
              <td>+52 123-456-7890</td>
              <td class="center-align">
                <button>
                  <img src="img/edit-icon.svg" class="button-img-edit" />
                </button>
              </td>
              <td class="center-align">
                <button>
                  <img src="img/delete-icon.svg" class="button-img-delete" />
                </button>
              </td>
            </tr>
          </table>
          <h3>Expedientes</h3>
          <table>
            <tr>
              <th>Nombre</th>
              <th class="center-align">Modificar</th>
              <th class="center-align">Eliminar</th>
            </tr>
            <tr>
              <td>Expediente 1</td>
              <td class="center-align">
                <button>
                  <img src="img/edit-icon.svg" class="button-img-edit" />
                </button>
              </td>
              <td class="center-align">
                <button>
                  <img src="img/delete-icon.svg" class="button-img-delete" />
                </button>
              </td>
            </tr>
            <tr>
              <td>Expediente 2</td>
              <td class="center-align">
                <button>
                  <img src="img/edit-icon.svg" class="button-img-edit" />
                </button>
              </td>
              <td class="center-align">
                <button>
                  <img src="img/delete-icon.svg" class="button-img-delete" />
                </button>
              </td>
            </tr>
            <tr>
              <td>Expediente 3</td>
              <td class="center-align">
                <button>
                  <img src="img/edit-icon.svg" class="button-img-edit" />
                </button>
              </td>
              <td class="center-align">
                <button>
                  <img src="img/delete-icon.svg" class="button-img-delete" />
                </button>
              </td>
            </tr>
          </table>
        </div>
        <div class="item-right">
          <h3>Agenda</h3>
          <table>
            <tr>
              <td>Event 1</td>
            </tr>
            <tr>
              <td>Event 2</td>
            </tr>
            <tr>
              <td>Event 3</td>
            </tr>
            <tr>
              <td>Event 4</td>
            </tr>
            <tr>
              <td>Event 5</td>
            </tr>
            <tr>
              <td>Event 6</td>
            </tr>
          </table>
        </div>
      </div>
    </main>
    <footer>
      <p>Footer here</p>
    </footer>
  </body>
</html>
