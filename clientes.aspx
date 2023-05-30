<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientes.aspx.cs" Inherits="Proyecto_Des_App_Web.clientes" %>

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
          <thead>
            <tr class="table-header-row">
              <th class="left-align">Nombre</th>
              <th class="center-align">Modificar</th>
              <th class="center-align">Eliminar</th>
            </tr>
          </thead>
          <tbody class="full-table-body"></tbody>
      </table>
        <!-- Dialog box para vista de edicion de clientes -->
        <dialog id="vista-dialog" class="clientes-dialog">
            <h3 class="dialog-header" >Editar cliente</h3>
            <table class="dialog-table" >
              <tr>
                <td>Nombre:</td>
                <td>
                  <input class="edit-input required" id="dialog_nombre_editar" type="text" name="nombre" />
                </td>
              </tr>
              <tr>
                <td>Apellido Paterno:</td>
                <td>
                  <input class="edit-input required" id="dialog_apellido_paterno_editar" type="text" name="apellidoPaterno" />
                </td>
              </tr>
              <tr>
                <td>Apellido Materno:</td>
                <td>
                  <input class="edit-input" id="dialog_apellido_materno_editar" type="text" name="apellidoMaterno" />
                </td>
              </tr>
              <tr>
                <td>Teléfono:</td>
                <td>
                  <input class="edit-input required" id="dialog_telefono_editar" type="text" name="telefono"/>
                </td>
              </tr>
              <tr>
                <td>Dirección:</td>
                <td>
                  <input class="edit-input required" id="dialog_direccion_editar" type="text" name="direccion"/>
                </td>
              </tr>
              <tr>
                <td>Correo:</td>
                <td>
                  <input class="edit-input required" id="dialog_email_editar" type="text" name="email"/>
                </td>
              </tr>
              <tr>
                <td>Fecha Nacimiento:</td>
                <td>
                  <input class="edit-input fecha required" id="dialog_fecha_editar" type="date" name="fecha"/>
                </td>
              </tr>
              <tr>
                <td>No. Identificación:</td>
                <td>
                  <input class="edit-input required" id="dialog_id_editar" type="text" name="identificacion"/>
                </td>
              </tr>
              <tr>
                <td>Estado Civil:</td>
                <td>
                  <input class="edit-input" id="dialog_estado_civil_editar" type="text" name="estadoCivil"/>
                </td>
              </tr>
            </table>
            <input type="hidden" class="edit-input" id="edit_clientId" name="id"/>
            <div class="dialog-control">
                <button class="btn-dialog" id="close-edit-dialog-btn">Cancelar</button>
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
                  <input class="add-input required" id="dialog_nombre_crear" type="text" name="nombre" />
                </td>
              </tr>
              <tr>
                <td>Apellido Paterno:</td>
                <td>
                  <input class="add-input required" id="dialog_apellido_paterno_crear" type="text" name="apellidoPaterno" />
                </td>
              </tr>
              <tr>
                <td>Apellido Materno:</td>
                <td>
                  <input class="add-input" id="dialog_apellido_materno_crear" type="text" name="apellidoMaterno" />
                </td>
              </tr>
              <tr>
                <td>Teléfono:</td>
                <td>
                  <input class="add-input required" id="dialog_telefono_crear" type="text" name="telefono" />
                </td>
              </tr>
              <tr>
                <td>Dirección:</td>
                <td>
                  <input class="add-input required" id="dialog_direccion_crear" type="text" name="direccion" />
                </td>
              </tr>
              <tr>
                <td>Correo:</td>
                <td>
                  <input class="add-input required" id="dialog_email_crear" type="email" name="email" />
                </td>
              </tr>
              <tr>
                <td>Fecha Nacimiento:</td>
                <td>
                  <input class="add-input fecha required" id="dialog_fecha_crear" type="date" name="fecha" />
                </td>
              </tr>
              <tr>
                <td>No. Identificación:</td>
                <td>
                  <input class="add-input required" id="dialog_id_crear" type="text" name="identificacion" />
                </td>
              </tr>
              <tr>
                <td>Estado Civil:</td>
                <td>
                  <input class="add-input" id="dialog_estado_civil_crear" type="text" name="estadoCivil"/>
                </td>
              </tr>
            </table>
            <div class="dialog-control">
                <button class="btn-dialog" id="close-crear-dialog-btn">Cancelar</button>
                <button class="btn-dialog" id="save-crear-dialog-btn">Guardar</button>
            </div>
        </dialog>
        <!-- Dialog box para vista de borrar clientes -->
        <dialog id="borrar-dialog" class="clientes-dialog">
            <p class="borrar-dialog-message">
                &#9888 ¿Está seguro de que desea eliminar al cliente: <span id="borrar-dialog-cliente"></span>?
            </p>
            <input type="hidden" id="borrar_clientId"/>
            <div class="dialog-control">
                <button class="btn-dialog" id="close-borrar-dialog-btn">Cancelar</button>
                <button class="btn-dialog" id="borrar-borrar-dialog-btn">Borrar</button>
            </div>
        </dialog>
    </main>

    <!-- <footer>
      <p>Footer here</p>
    </footer> -->
  </body>
</html>