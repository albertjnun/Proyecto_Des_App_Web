document.addEventListener("DOMContentLoaded", function () {
    //Variables para dialog CREAR
    const addBtn = document.querySelector(".btn-add");
    const dialogCrear = document.querySelector("#crear-dialog");
    const closeDialogCrear = document.querySelector("#close-crear-dialog-btn");

    //Variables para dialog EDITAR
    const editBtn = document.querySelectorAll(".button-img-edit");
    const dialogEdit = document.querySelector("#vista-dialog");
    const closeDialogEdit = document.querySelector("#close-edit-dialog-btn");
    const diagNombre = document.querySelector("#dialog_nombre");
    const diagTelefono = document.querySelector("#dialog_telefono");
    const diagDireccion = document.querySelector("#dialog_direccion");
    const diagEmail = document.querySelector("#dialog_email");
    const diagFecha = document.querySelector("#dialog_fecha");
    const diagIdentificacion = document.querySelector("#dialog_id");
    const diagEstadoCivil = document.querySelector("#dialog_estado_civil");

    //Funcionalidad para dialog CREAR
    addBtn.addEventListener("click", () => {
        dialogCrear.showModal();
    })
    closeDialogCrear.addEventListener("click", () => {
        dialogCrear.close();
    })

    //Funcionalidad para dialog EDITAR
    closeDialogEdit.addEventListener("click", function () {
        dialogEdit.close();
    });
    editBtn.forEach(function (element) {
        element.addEventListener("click", function () {
            let clientId = element.getAttribute("data-cliente-id");
            dialogEdit.showModal();
            sendRequest(clientId)
        })
    })
    //Fetch para dialog EDITAR
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
