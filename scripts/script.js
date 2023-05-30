document.addEventListener("DOMContentLoaded", function () {
  //Variables globales
  const tableClientes = document.querySelector(".full-table-body");
  const clientsData = [];

  //Variables para dialog CREAR
  const addBtn = document.querySelector(".btn-add");
  const dialogCrear = document.querySelector("#crear-dialog");
  const closeDialogCrear = document.querySelector("#close-crear-dialog-btn");
  const saveDialogCrear = document.querySelector("#save-crear-dialog-btn");
  const crearInputs = document.querySelectorAll(".add-input");
  const crearInputsRequired = document.querySelectorAll(".add-input.required");

  //Variables para dialog EDITAR
  const dialogEdit = document.querySelector("#vista-dialog");
  const editInputs = document.querySelectorAll(".edit-input");
  const editInputsRequired = document.querySelectorAll(".edit-input.required");
  const closeDialogEdit = document.querySelector("#close-edit-dialog-btn");
  const saveDialogEdit = document.querySelector("#save-edit-dialog-btn");
  const diagNombre = document.querySelector("#dialog_nombre_editar");
  const diagApellidoPaterno = document.querySelector(
    "#dialog_apellido_paterno_editar"
  );
  const diagApellidoMaterno = document.querySelector(
    "#dialog_apellido_materno_editar"
  );
  const diagTelefono = document.querySelector("#dialog_telefono_editar");
  const diagDireccion = document.querySelector("#dialog_direccion_editar");
  const diagEmail = document.querySelector("#dialog_email_editar");
  const diagFecha = document.querySelector("#dialog_fecha_editar");
  const diagIdentificacion = document.querySelector("#dialog_id_editar");
  const diagEstadoCivil = document.querySelector("#dialog_estado_civil_editar");
  const diagClientId = document.querySelector("#edit_clientId");

  //Variables para dialog BORRAR
  const dialogBorrar = document.querySelector("#borrar-dialog");
  const closeDialogBorrar = document.querySelector("#close-borrar-dialog-btn");
  const borrarDialogBorrar = document.querySelector(
    "#borrar-borrar-dialog-btn"
  );
  const clienteBorrar = document.querySelector("#borrar-dialog-cliente");
  const borrarDialogClientId = document.querySelector("#borrar_clientId");

  const createClientTable = async () => {
    tableClientes.innerHTML = "";
    try {
      const response = await fetch("clientDataTable.aspx", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      });
      if (!response.ok) {
        throw new Error("Request failed with status: " + response.status);
      }
      const data = await response.json();

      data.forEach((client) => {
        clientsData.push(client);

        const clientRow = document.createElement("tr");
        clientRow.setAttribute("data-cliente-id", client.Id);

        const nameTd = document.createElement("td");
        nameTd.classList.add("table-row-element", "left-align");
        nameTd.textContent =
          client.Nombre +
          ", " +
          client.ApellidoPaterno +
          " " +
          client.ApellidoMaterno;

        const editButtonTd = document.createElement("td");
        editButtonTd.classList.add("center-align");
        editButtonTd.innerHTML = `<button><img src="img/edit-icon.svg" data-cliente-id=${client.Id} class="button-img-edit"/></button>`;

        const deleteButtonTd = document.createElement("td");
        deleteButtonTd.classList.add("center-align");
        deleteButtonTd.innerHTML = `<button><img src="img/delete-icon.svg" data-cliente-id=${client.Id} class="button-img-delete" /></button>`;

        clientRow.append(nameTd, editButtonTd, deleteButtonTd);
        tableClientes.append(clientRow);
      });
    } catch (error) {
      console.error("Error:", error);
      alert("Error:", error);
    }
  };
  createClientTable();

  //Funcionalidad para dialog CREAR
  addBtn.addEventListener("click", () => {
    dialogCrear.showModal();
  });
  closeDialogCrear.addEventListener("click", () => {
    dialogCrear.close();
  });
  saveDialogCrear.addEventListener("click", async () => {
    let valid = InputValidation(crearInputsRequired);
    if (valid === true) {
      let crearClienteData = {};
      crearInputs.forEach((input) => {
        crearClienteData[input.name] = input.value;
      });
      try {
        await sendClientData(crearClienteData);
        await createClientTable();
        dialogCrear.close();
      } catch (error) {
        console.error("Error:", error);
        alert("Error:", error);
      }
    } else {
      alert("All inputs required");
    }
  });

  //Funcion Validar Inputs
  const InputValidation = (inputs) => {
    let valid = true;
    inputs.forEach((input) => {
      if (input.value === "" || input.value === undefined) {
        valid = false;
      }
    });
    return valid;
  };

  //Funcionalidad para dialog EDITAR
  //Botones
  closeDialogEdit.addEventListener("click", () => {
    dialogEdit.close();
  });
  saveDialogEdit.addEventListener("click", async () => {
    let valid = InputValidation(editInputsRequired);
    if (valid === true) {
      let editClientData = {};
      editInputs.forEach((input) => {
        editClientData[input.name] = input.value;
      });
      try {
        await updateClientData(editClientData);
        await createClientTable();
        dialogEdit.close();
      } catch (error) {
        console.error("Error:", error);
        alert("Error:", error);
      }
    } else {
      alert("All inputs required");
    }
  });

  tableClientes.addEventListener("click", (event) => {
    if (event.target.matches(".button-img-edit")) {
      let clientId = event.target.getAttribute("data-cliente-id");
      dialogEdit.showModal();
      showClientDataEdit(clientId);
    }
    if (event.target.matches(".button-img-delete")) {
      let clientId = event.target.getAttribute("data-cliente-id");
      let client = clientsData.find((client) => client.Id == clientId);
      clienteBorrar.textContent =
        client.Nombre +
        " " +
        client.ApellidoPaterno +
        " " +
        client.ApellidoMaterno;
      borrarDialogClientId.value = clientId;
      createClientTable();
      dialogBorrar.showModal();
    }
  });

  //Funcionalidad para dialog BORRAR
  closeDialogBorrar.addEventListener("click", () => {
    dialogBorrar.close();
  });
  borrarDialogBorrar.addEventListener("click", async () => {
    try {
      await borrarClientData(borrarDialogClientId.value);
      await createClientTable();
      dialogBorrar.close();
    } catch (error) {
      console.error("Error:", error);
      alert("Error:", error);
    }
  });

  //Funcion para MOSTRAR dialog EDITAR
  const showClientDataEdit = (Id) => {
    let client = clientsData.find((client) => client.Id == Id);
    diagNombre.value = client.Nombre;
    diagApellidoPaterno.value = client.ApellidoPaterno;
    diagApellidoMaterno.value = client.ApellidoMaterno;
    diagTelefono.value = client.Telefono;
    diagDireccion.value = client.Direccion;
    diagEmail.value = client.Email;
    diagFecha.value = client.Fecha;
    diagIdentificacion.value = client.Identificacion;
    diagEstadoCivil.value = client.EstadoCivil;
    diagClientId.value = client.Id;
  };

  //Fetch para GUARDAR dialog EDITAR
  const updateClientData = (bodyData) => {
    fetch("editClientData.aspx", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(bodyData),
    })
      .then((response) => {
        if (!response.ok) {
          alert("Error al guardar los datos");
        }
      })
      .catch((error) => {
        console.log(error);
        alert("Error");
      });
  };

  //Fetch para CREAR dialog CREAR
  const sendClientData = (bodyData) => {
    fetch("saveClientData.aspx", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(bodyData),
    })
      .then((response) => {
        if (!response.ok) {
          alert("Error al guardar los datos");
        }
      })
      .catch((error) => {
        console.log(error);
        alert("Error");
      });
  };

  //Fetch para BORRAR dialog BORRAR
  const borrarClientData = (clientId) => {
    fetch("deleteClientData.aspx", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ ClientId: clientId }),
    })
      .then((response) => {
        if (!response.ok) {
          alert("Error al borrar los datos");
        }
      })
      .catch((error) => {
        console.log(error);
        alert("Error");
      });
  };
});
