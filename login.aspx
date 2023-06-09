﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs"
Inherits="Proyecto_Des_App_Web.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es-mx">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <script src="scripts/login.js" defer></script>
    <%-- BOOTSTRAP --%>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="login.css" />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
      integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
      integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <main>
    <section class="vh-100">
      <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-md-9 col-lg-6 col-xl-5">
            <img
              src="img/logo.jpg"
              class="img-fluid"
              alt="Sample image"
            />
          </div>
          <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
            <form id="input-form">
              <div
                class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start"
              >
                <p id="alert-message" class="d-none alert alert-danger"></p>
              </div>

              <div class="divider d-flex align-items-center my-4"></div>
              <!-- Email input -->
              <div class="form-outline mb-4">
                <input
                  type="email"
                  id="login_email"
                  class="form-control form-control-lg"
                  placeholder="Introduzca su correo"
                />
                <label class="form-label" for="form3Example3">Correo</label>
              </div>

              <!-- Password input -->
              <div class="form-outline mb-3">
                <input
                  type="password"
                  id="login_pass"
                  class="form-control form-control-lg"
                  placeholder="Introduzca contraseña"
                />
                <label class="form-label" for="form3Example4">Contraseña</label>
              </div>

              <div class="d-flex justify-content-between align-items-center">
                <a href="#" id="olvido-pass" class="trigger-btn">Olvido contraseña?</a>
              </div>

              <div class="text-center text-lg-start mt-4 pt-2">
                <button
                  type="button"
                  class="btn btn-primary btn-lg"
                  id="button_acceder"
                  style="padding-left: 2.5rem; padding-right: 2.5rem"
                >
                  Iniciar sesión
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div
        class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary"
      >
        <!-- Copyright -->
        <div class="text-white mb-3 mb-md-0">
          Copyright © 2020. All rights reserved.
        </div>
        <!-- Copyright -->

        <!-- Right -->
        <div>
          <a href="#!" class="text-white me-4">
            <i class="fab fa-facebook-f"></i>
          </a>
          <a href="#!" class="text-white me-4">
            <i class="fab fa-twitter"></i>
          </a>
          <a href="#!" class="text-white me-4">
            <i class="fab fa-google"></i>
          </a>
          <a href="#!" class="text-white">
            <i class="fab fa-linkedin-in"></i>
          </a>
        </div>
        <!-- Right -->
      </div>
    </section>
    <!-- Modal HTML -->
    <div id="myModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons">&#xE5CD;</i>
				</div>				
				<h4 class="modal-title w-100">Sorry!</h4>	
			</div>
			<div class="modal-body">
				<p class="text-center">Your transaction has failed. Please go back and try again.</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-danger btn-block" data-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
   </div>    
</div> 
    </main>
  </body>
</html>
