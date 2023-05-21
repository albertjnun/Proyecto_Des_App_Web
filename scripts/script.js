document.addEventListener("DOMContentLoaded", function () {
    const editBtn = document.querySelectorAll(".button-img-edit");
    const dialog = document.querySelector("#vista-dialog");
    const closeDialogButton = document.querySelector("#close-dialog-btn");
    const diagNombre = document.querySelector("#dialog_nombre");
    const diagTelefono = document.querySelector("#dialog_telefono");
    const diagDireccion = document.querySelector("#dialog_direccion");
    const diagEmail = document.querySelector("#dialog_email");
    const diagFecha = document.querySelector("#dialog_fecha");
    const diagIdentificacion = document.querySelector("#dialog_id");
    const diagEstadoCivil = document.querySelector("#dialog_estado_civil");

    closeDialogButton.addEventListener("click", function () {
        dialog.close();
    });
    editBtn.forEach(function (element) {
        element.addEventListener("click", function () {
            let clientId = element.getAttribute("data-cliente-id");
            dialog.showModal();
            sendRequest(clientId)
        })
    })
    const sendRequest = function (clientId) {
        const bodyData = { clientId };
        fetch("getClientData.aspx", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(bodyData)
        })
            .then(response => response.json())
            .then(responseData => {
                console.log(responseData);
                diagNombre.value = responseData.Nombre;
                diagTelefono.value = responseData.Telefono;
                diagDireccion.value = responseData.Direccion;
                diagEmail.value = responseData.Email;
                diagFecha.value = responseData.Fecha;
                diagIdentificacion.value = responseData.Identificacion;
                diagEstadoCivil.value = responseData.EstadoCivil;
                

        }).catch(error => {
            console.log(error);
            alert("Error");
        })
    }
});
