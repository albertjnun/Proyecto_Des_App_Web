document.addEventListener("DOMContentLoaded", function () {
    //Declaración de variables
    let access = false;
    const message = document.querySelector(".login-message");
    const form = document.querySelector(".input-box");
    const buttonAcceder = document.querySelector("#button_acceder");
    //Asignar tecla enter al evento click del boton
    form.addEventListener("submit", function (event) {
        event.preventDefault();
        buttonAcceder.click();
    })
    //Evento click del boton
    buttonAcceder.addEventListener("click", function (event) {
            userVal = document.querySelector("#login_email").value;
            passwordVal = document.querySelector("#login_pass").value;
            if (userVal === "" || passwordVal === "") {
                message.textContent = "Se requieren todos los campos";
            }
            else {
                sendRequest(userVal, passwordVal);
            }
        });
    const sendRequest = function(user, password) {
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
                window.location.href = "index.aspx";
            }
            else if (responseArray[0] === "False") {
                document.querySelector("#login_email").value = "";
                message.textContent = "Usuario no existe";
            }
            else {
                document.querySelector("#login_pass").value = "";
                message.textContent = "Contraseña incorrecta";
            }
        }).catch(error => {
            console.log(error);
            alert("Error");
        })
    }
});