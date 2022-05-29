<!-- PAGINA DE "EN CONTRUCCION" -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
       <%@ page import="com.model.Titulos"%>
        <%@ page import="com.model.Usuarios"%>
<%@ page import="com.ies.baroja.Controller"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="en"></html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<title>NerdFlix</title>
<style>
.dropdown-menu {
	background-color: rgb(33, 37, 41);
}
#alinear{
align:center;
margin:auto;
border-radius: 15px;
}
</style>
</head>
<body style="background-color:rgb(52, 58, 64);">
<header>
	<!-- MENÚ SUPERIOR - NAVBAR -->
		<nav class="navbar navbar-expand-sm navbar-dark d-flex justify-content-between">
			<div class="ps-5">
				<a href="home.jsp"><img src="images\logo.png" alt="" width="200" height="" /></a>
			</div>
			
			<!-- MENÚ-->
			<ul class="navbar-nav">
				<li class="nav-item"><a href="home.jsp" class="nav-link ">Home</a>
				</li>
				<li class="nav-item"><a href="peliculas.jsp" class="nav-link">Películas</a>
				</li>
				<li class="nav-item"><a href="series.jsp" class="nav-link">Series</a>
				</li>
				</li>
				<li class="nav-item"><a href="favoritos.jsp" class="nav-link">Favoritos</a>
				</li>
				</li>
				<li class="nav-item"><a href="#" class="nav-link">En reproducción</a></li>
			</ul>
			<!-- CÓDIGO JAVA - Que se vea el usuario con sesion -->

 <%  
 HttpSession sesion = request.getSession();
 Usuarios miUsu = null;
 if (sesion.getAttribute("objUsuario" ) != null) {
miUsu = (Usuarios) sesion.getAttribute("objUsuario" );
 }

 %>
<div class="d-flex justify-content-between">       		
				<form action="perfil.jsp" method="POST">
				<button type="submit" class="text-white nav-link btn btn-outline-light" width="70" height="" style="margin-right: 5px">
      					Bienvenido ${sessionScope.objUsuario.getNombre()}
      					<img src="images\PerfilSF.png" alt="" width="25" height="" />
      				</button>
      				</form>
			<%
			if(miUsu.getNombre().equals("administrador")){
				out.println("<a href='formulario_administrador.html' class='text-white nav-link btn btn-outline-light' width='70' style='margin-right: 5px'>Administrador</a>");
			}			

			%>						<form action="ServletForm" method="POST">
					<button name = "cerrarSesion" type="submit" class="text-white nav-link btn btn-outline-light" width="70" height="" style="margin-right: 5px">
      					Cerrar Sesión
      				</button>
      				</form>
      				</div>

		</nav>
	</header>
	<div class="col-auto p-5 text-center">
		<div>
			<img src="images/logo.png" class="center" width="700" height="130" />
		</div>
		<br>
		<div class="row">
		<div id="alinear" class="text-dark col-lg-4 col-md-3 col-md-3 pb-3 bg-white">
			<br>
			<h4>Página en contrucción</h4>
			<br>
			<svg xmlns="http://www.w3.org/2000/svg" id="tick" width="70" height="70" fill="currentColor" class="bi bi-tools" viewBox="0 0 16 16">
				<path d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.356 3.356a1 1 0 0 0 1.414 0l1.586-1.586a1 1 0 0 0 0-1.414l-3.356-3.356a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0zm9.646 10.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708zM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11z" />
			</svg>
			<br>
		</div>
		<br>
	</div>
    <!-- FOOTER-->
	<footer class=" text-center text-white">
		<div class="container p-4">
			
		<!-- REDES SOCIALES-->
		<section class="mb-4">
		
			<!-- Google -->
			<img class="btn btn-outline-light btn-floating m-1" src="images/Google.png" width="60" role="button">
				<i class="fab fa-facebook-f"></i>
			</img>

			<!-- Facebook -->
			<img class="btn btn-outline-light btn-floating m-1" src="images/Facebook.png" width="60" role="button">
				<i class="fab fa-twitter"></i>
			</img>

			<!-- Twitter -->
			<img class="btn btn-outline-light btn-floating m-1" src="images/Twitter.png" width="60" role="button">
				<i class="fab fa-google"></i>
			</img>

			<!-- Instagram -->
			<img class="btn btn-outline-light btn-floating m-1" src="images/Instagram.png" width="60" role="button">
				<i class="fab fa-instagram"></i>
			</img>

			<!-- Linkedin -->
			<button type="button" name="button" class="btn " data-bs-toggle="dropdown">
				<img class="btn btn-outline-light btn-floating" src="images\LinkedIn.png" width="60" role="button">
					<i class="fab fa-instagram"></i>
				</img>
			</button>
			<ul class="dropdown-menu text-white">
				<li>
					<a href="https://www.linkedin.com/in/abarbag/" class="text-white dropdown-item" target="_blank">Alejandro Barba</a>
				</li>
				<li>
					<a href="www.linkedin.com/in/belen-caocamino" class=" text-white dropdown-item" target="_blank">Belén Cao</a>
				</li>
				<li>
					<a href="#" class="text-white dropdown-item" target="_blank">Mª. Isabel López</a>
				</li>
			</ul>
		
			<!-- Github -->
			<a href="https://github.com/MaribelLopezRomero/NerdFlixJava.git" target="_blank">
				<img class="btn btn-outline-light btn-floating m-1" src="images/GitHub.png" width="60" role="button">
					<i class="fab fa-github"></i>
				</img>
			</a>
		</section>

		<!-- TEXTO FOOTER -->
		<section class="mb-4">
			<p>Por si quieres saber algo más de nosotros o informarte sobre los términos de uso o de privacidad</p>
		</section>
		<section class="">
			<div class="row">
				<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
					<ul class="list-unstyled mb-0">
						<li><a href="#!" class="text-white">Acerca nuestra</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
					<ul class="list-unstyled mb-0">
						<li><a href="#!" class="text-white">Privacidad</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6 mb-4 mb-md-0">

					<ul class="list-unstyled mb-0">
						<li><a href="#!" class="text-white">Contáctanos</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6 mb-4 mb-md-0">

					<ul class="list-unstyled mb-0">
						<li><a href="#!" class="text-white">Términos de Uso</a></li>
					</ul>
				</div>
			</div>
		</section>
		</div>
		
		<!-- Copyright -->
		<div class="text-center p-3" style="background-color: rgba(0, 153, 117, 0.5);">© 2022: Alejandro Barba, Belén Cao, Maribel López</div>
	</footer>
	</body>
</html>