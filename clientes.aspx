﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientes.aspx.cs" Inherits="Proyecto_Des_App_Web.clientes" %>

<!DOCTYPE html>
<html lang="es-mx">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles/main.css" />
    <script src="scripts/navbar.js" defer></script>
    <script src="scripts/script.js" defer></script>
    <title>Clientes</title>
  </head>
  <body class="">
    <header>
      <nav class="nav-horizontal">
        <ul>
          <li class="dashboard">
            <a href="index.aspx">Dashboard</a>
          </li>
          <li class="nav-item hide"><a href="clientes.aspx">Clientes</a></li>
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
        <button class="btn-add" >Agregar cliente</button>
      <table class="full-table">
        <tr class="table-header-row">
          <th>Nombre</th>
          <th>Teléfono</th>
          <th class="center-align">Modificar</th>
          <th class="center-align">Eliminar</th>
        </tr>
        <%= CreateClientesTable(0) %>
      </table>
        <!-- Dialog box para vista de edicion de clientes -->
        <dialog id="vista-dialog" class="clientes-dialog">
            <h3 class="dialog-header" >Vista cliente</h3>
            <table class="dialog-table" >
              <tr>
                <td>Nombre:</td>
                <td>
                  <input id="dialog_nombre" type="text"  readonly/>
                </td>
              </tr>
              <tr>
                <td>Teléfono:</td>
                <td>
                  <input id="dialog_telefono" type="text" readonly/>
                </td>
              </tr>
              <tr>
                <td>Dirección:</td>
                <td>
                  <input id="dialog_direccion" type="text" readonly/>
                </td>
              </tr>
              <tr>
                <td>Correo:</td>
                <td>
                  <input id="dialog_email" type="text" readonly/>
                </td>
              </tr>
              <tr>
                <td>Fecha Nacimiento:</td>
                <td>
                  <input id="dialog_fecha" type="text" readonly/>
                </td>
              </tr>
              <tr>
                <td>No. Identificación:</td>
                <td>
                  <input id="dialog_id" type="text" readonly/>
                </td>
              </tr>
              <tr>
                <td>Estado Civil:</td>
                <td>
                  <input id="dialog_estado_civil" type="text" readonly/>
                </td>
              </tr>
            </table>
            <div class="dialog-control">
                <button class="btn-dialog" id="close-edit-dialog-btn">Cerrar</button>
                <button class="btn-dialog" id="save-edit-dialog-btn">Guardar</button>
            </div>
        </dialog>
            <!-- Dialog box para vista de creacion de clientes -->
        <dialog id="crear-dialog" class="clientes-dialog">
            <h3 class="dialog-header" >Crear cliente</h3>
            <table class="dialog-table" >
              <tr>
                <td>Nombre:</td>
                <td>
                  <input id="dialog_nombre_crear" type="text"  />
                </td>
              </tr>
              <tr>
                <td>Teléfono:</td>
                <td>
                  <input id="dialog_telefono_crear" type="text" />
                </td>
              </tr>
              <tr>
                <td>Dirección:</td>
                <td>
                  <input id="dialog_direccion_crear" type="text" />
                </td>
              </tr>
              <tr>
                <td>Correo:</td>
                <td>
                  <input id="dialog_email_crear" type="email" />
                </td>
              </tr>
              <tr>
                <td>Fecha Nacimiento:</td>
                <td>
                  <input id="dialog_fecha_crear" type="date" />
                </td>
              </tr>
              <tr>
                <td>No. Identificación:</td>
                <td>
                  <input id="dialog_id_crear" type="text" />
                </td>
              </tr>
              <tr>
                <td>Estado Civil:</td>
                <td>
                  <input id="dialog_estado_civil_crear" type="text" />
                </td>
              </tr>
            </table>
            <div class="dialog-control">
                <button class="btn-dialog" id="close-crear-dialog-btn">Cerrar</button>
                <button class="btn-dialog" id="save-crear-dialog-btn">Guardar</button>
            </div>
        </dialog>
    </main>

    <!-- <footer>
      <p>Footer here</p>
    </footer> -->
  </body>
</html>