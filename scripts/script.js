document.addEventListener("DOMContentLoaded", function () {
    //Variables para dialog CREAR
    const addBtn = document.querySelector(".btn-add");
    const dialogCrear = document.querySelector("#crear-dialog");
    const closeDialogCrear = document.querySelector("#close-crear-dialog-btn");
    const saveDialogCrear = document.querySelector("#save-crear-dialog-btn");
    const crearInputs = document.querySelectorAll(".add-input");
    const crearInputsRequired = document.querySelectorAll(".required");

    //Variables para dialog EDITAR
    const editBtn = document.querySelectorAll(".button-img-edit");
    const dialogEdit = document.querySelector("#vista-dialog");
    const closeDialogEdit = document.querySelector("#close-edit-dialog-btn");
    const diagNombre = document.querySelector("#dialog_nombre");
    const diagApellidoPaterno = document.querySelector("#dialog_apellido_paterno_editar");
    const diagApellidoMaterno = document.querySelector("#dialog_apellido_materno_editar");
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
    saveDialogCrear.addEventListener("click", () => {
        let valid = crearInputValidation();
        if (valid === true) {
            let crearClienteData = {};
            crearInputs.forEach((input) => {
                crearClienteData[input.name] = input.value;
            });
            sendClientData(crearClienteData);
            dialogCrear.close();
        }
        else {
            alert("All inputs required");
        }
    })
    const crearInputValidation = () => {
        let valid = true;
        crearInputsRequired.forEach((input) => {
            if (input.value === "" || input.value === undefined) {
                valid = false;
            }
        })
        return valid;
    }

    //Funcionalidad para dialog EDITAR
    closeDialogEdit.addEventListener("click", () => {
        dialogEdit.close();
    });
    editBtn.forEach((element) => {
        element.addEventListener("click", () => {
            let clientId = element.getAttribute("data-cliente-id");
            dialogEdit.showModal();
            getClientData(clientId);
        })
    })
    //Fetch para dialog EDITAR
    const getClientData = (clientId) => {
        let bodyData = { clientId };
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
                diagApellidoPaterno.value = responseData.ApellidoPaterno;
                diagApellidoMaterno.value = responseData.ApellidoMaterno;
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
    //Fetch para dialog CREAR
    const sendClientData = (bodyData) => {
        console.log(bodyData);
        fetch("saveClientData.aspx", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(bodyData)
        }).then(response => {
            if (response.ok) {
                alert("Datos guardados correctamente");
            }
            else {
                alert("Error al guardar los datos");
            }
        }).catch(error => {
            console.log(error);
            alert("Error");
        })
    }
});
