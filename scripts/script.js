document.addEventListener("DOMContentLoaded", function () {
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
});
