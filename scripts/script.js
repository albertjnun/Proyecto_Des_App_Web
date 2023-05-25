document.addEventListener("DOMContentLoaded", function () {
    //Variables para dialog CREAR
    const addBtn = document.querySelector(".btn-add");
    const dialogCrear = document.querySelector("#crear-dialog");
    const closeDialogCrear = document.querySelector("#close-crear-dialog-btn");
    const saveDialogCrear = document.querySelector("#save-crear-dialog-btn");
    const crearInputs = document.querySelectorAll(".add-input");
    const crearInputsRequired = document.querySelectorAll(".add-input.required");

    //Variables para dialog EDITAR
    const editBtn = document.querySelectorAll(".button-img-edit");
    const dialogEdit = document.querySelector("#vista-dialog");
    const editInputs = document.querySelectorAll(".edit-input");
    const editInputsRequired = document.querySelectorAll(".edit-input.required")
    const closeDialogEdit = document.querySelector("#close-edit-dialog-btn");
    const saveDialogEdit = document.querySelector("#save-edit-dialog-btn");
    const diagNombre = document.querySelector("#dialog_nombre_editar");
    const diagApellidoPaterno = document.querySelector("#dialog_apellido_paterno_editar");
    const diagApellidoMaterno = document.querySelector("#dialog_apellido_materno_editar");
    const diagTelefono = document.querySelector("#dialog_telefono_editar");
    const diagDireccion = document.querySelector("#dialog_direccion_editar");
    const diagEmail = document.querySelector("#dialog_email_editar");
    const diagFecha = document.querySelector("#dialog_fecha_editar");
    const diagIdentificacion = document.querySelector("#dialog_id_editar");
    const diagEstadoCivil = document.querySelector("#dialog_estado_civil_editar");
    const diagClientId = document.querySelector("#edit_clientId")

    //Funcionalidad para dialog CREAR
    addBtn.addEventListener("click", () => {
        dialogCrear.showModal();
    })
    closeDialogCrear.addEventListener("click", () => {
        dialogCrear.close();
    })
    saveDialogCrear.addEventListener("click", () => {
        let valid = InputValidation(crearInputsRequired);
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

    //Funcion Validar Inputs
    const InputValidation = (inputs) => {
        let valid = true;
        inputs.forEach((input) => {
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
    saveDialogEdit.addEventListener("click", () => {
        let valid = InputValidation(editInputsRequired);
        if (valid === true) {
            let editClientData = {};
            editInputs.forEach((input) => {
                editClientData[input.name] = input.value;
            })
            updateClientData(editClientData);
            dialogEdit.close();
        }
        else {
            alert("All inputs required");
        } 
    })
    editBtn.forEach((element) => {
        element.addEventListener("click", () => {
            let clientId = element.getAttribute("data-cliente-id");
            dialogEdit.showModal();
            getClientData(clientId);
        })
    })

    //Fetch para MOSTRAR dialog EDITAR
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
                diagClientId.value = clientId;

        }).catch(error => {
            console.log(error);
            alert("Error");
        })
    }

    //Fetch para GUARDAR dialog EDITAR
    const updateClientData = (bodyData) => {
        console.log(bodyData);
        fetch("editClientData.aspx", {
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
