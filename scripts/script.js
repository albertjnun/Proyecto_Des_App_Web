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

  window.addEventListener("resize", function () {
    if (window.innerWidth < 768) {
      this.document.querySelectorAll(".nav-item").forEach(function (el) {
        el.classList.add("hide");
      });
      this.document.querySelector(".nav-button").classList.remove("hide");
    } else {
      this.document.querySelectorAll(".nav-item").forEach(function (el) {
        el.classList.remove("hide");
      });
      this.document.querySelector(".nav-button").classList.add("hide");
    }
  });
  document.querySelector(".nav-button").addEventListener("click", function () {
    document.querySelectorAll(".nav-item").forEach(function (el) {
      el.classList.toggle("hide");
    });
    let menuIcon = document.querySelector(".burger-button-img");
    if (
      !menuIcon.classList.contains("menu-inactive") &&
      !menuIcon.classList.contains("menu-active")
    ) {
      menuIcon.classList.add("menu-active");
    } else if (menuIcon.classList.contains("menu-inactive")) {
      menuIcon.classList.remove("menu-inactive");
      menuIcon.classList.add("menu-active");
    } else {
      menuIcon.classList.remove("menu-active");
      menuIcon.classList.add("menu-inactive");
    }
  });
    closeDialogButton.addEventListener("click", function () {
        dialog.close();
    });
    editBtn.forEach(function (element) {
        element.addEventListener("click", function () {
            let clientId = element.getAttribute("data-cliente-id");
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
                dialog.show();

        }).catch(error => {
            console.log(error);
            alert("Error");
        })
    }
});
