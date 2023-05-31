document.addEventListener("DOMContentLoaded", function () {
  const navBtn = document.querySelector(".nav-button");
  const cuenta = document.querySelector("#nav-element-cuenta");
  let timeoutId, timeoutAmmount;

  const navBarStatus = function () {
    if (window.innerWidth <= 768) {
      this.document.querySelectorAll(".nav-item").forEach(function (el) {
        el.classList.add("hide");
      });
      this.document.querySelector(".nav-button").classList.remove("hide");
      timeoutAmmount = 0;
    } else {
      this.document.querySelectorAll(".nav-item").forEach(function (el) {
        el.classList.remove("hide");
      });
      this.document.querySelector(".nav-button").classList.add("hide");
      timeoutAmmount = 500;
    }
  };
  navBarStatus();
  window.addEventListener("resize", navBarStatus);

  navBtn.addEventListener("click", function () {
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

  cuenta.addEventListener("mouseover", () => {
    document.querySelector(".dropdown-content").classList.add("dropdown-show");
    clearTimeout(timeoutId);
  });
  cuenta.addEventListener("mouseout", () => {
    timeoutId = setTimeout(() => {
      document
        .querySelector(".dropdown-content")
        .classList.remove("dropdown-show");
    }, timeoutAmmount);
  });
  document
    .querySelector(".dropdown-content")
    .addEventListener("mouseover", () => {
      clearTimeout(timeoutId);
    });
  document
    .querySelector(".dropdown-content")
    .addEventListener("mouseout", () => {
      console.log("MOUSE OFF CUENTA");
      timeoutId = setTimeout(() => {
        document
          .querySelector(".dropdown-content")
          .classList.remove("dropdown-show");
      }, timeoutAmmount);
    });
});
