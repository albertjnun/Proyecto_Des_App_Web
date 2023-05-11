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
         <p class="login-message"></p>
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
          <a href="registro.aspx" class="cambiar"
            ><b>Cambiar contraseña</b></a
          >
        </p>
      </form>
    </main>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let access = false;
            document
                .querySelector("#button_acceder")
                .addEventListener("click", function () {
                    userVal = document.querySelector("#login_email").value;
                    passwordVal = document.querySelector("#login_pass").value;
                    sendRequest(userVal, passwordVal);
                });
            function sendRequest(user, password) {
                let message = document.querySelector(".login-message");
                fetch("checarUsuario.aspx", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded",
                    },
                    body: "user=" + encodeURIComponent(user) + "&password=" + encodeURIComponent(password)
                }).then(response => response.text()).then(response => {
                    console.log(response);
                    responseArray = response.split(',');
                    console.log(responseArray);
                    if (responseArray[0] === "True" && responseArray[1] === "True") {
                        window.location.href = "clientes.aspx";
                    }
                    else if (responseArray[0] === "False") {
                        message.textContent = "User does not exist";
                    }
                    else {
                        document.querySelector("#login_pass").value = "";
                        message.textContent = "Incorrect password";
                    }
                }).catch(error => {
                    console.log(error);
                    alert("Error");
                })
            }
        });
    </script>
  </body>
</html>
