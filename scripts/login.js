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