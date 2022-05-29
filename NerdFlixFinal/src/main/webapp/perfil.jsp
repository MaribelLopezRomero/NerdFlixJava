<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
       <%@ page import="com.model.Titulos"%>
        <%@ page import="com.model.Usuarios"%>
<%@ page import="com.ies.baroja.Controller"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Perfil</title>
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
rel="stylesheet" />
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="ISO-8859-1">
<title>Perfil usuario</title>
</head>
<body style="background-color: rgb(52, 58, 64)">

<style>
.dropdown-menu {
background-color: rgb(33, 37, 41);
}
</style>
<header>
<!-- MENÚ SUPERIOR - NAVBAR -->
<nav
class="navbar navbar-expand-sm navbar-dark d-flex justify-content-between">
<div class="ps-5">
				<a href="home.jsp"><img src="images\logo.png" alt="" width="200" height="" /></a>
			</div>

<!-- MENÚ-->
<ul class="navbar-nav">
<li class="nav-item"><a href="" class="nav-link">Home</a></li>
<li class="nav-item"><a href="peliculas.jsp" class="nav-link">Películas</a>
</li>
<li class="nav-item"><a href="series.jsp" class="nav-link ">Series</a>
</li>
</li>
<li class="nav-item"><a href="favoritos.jsp" class="nav-link">Favoritos</a>
</li>
</li>
<li class="nav-item"><a href="#" class="nav-link">En
reproducción</a></li>
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
<%

out.println("<div class='container p-5 my-5 border bg-white text-dark'>");
	out.println("<div class='container'>");
		out.println("<div class='row'>");
			out.println("<div class='col'>");
		
				out.println("<h1 class='text-dark'>Perfil</h1>");
				out.println("<img src='images/PerfilSF.png' width='150'>");
			out.println("</div>");
			out.println("<div class='col'>");
				out.println("<h4 class='p-2'>Usuario : </h4>");
				out.println("<h4 class='p-2'>Contraseña: </h4>");
				out.println("<h4 class='p-2'>Correo Electrónico : </h4>");
			out.println("</div>");
			out.println("<div class='col'>");
				out.println("<h4 class='p-2'>" + miUsu.getNombre() + "</h4>");
				out.println("<h4 class='p-2'>*********</h4>");
				out.println("<h4 class='p-2'>" + miUsu.getCorreo() + "</h4>");
			out.println("</div>");
			out.println("</div>");
		out.println("</div>");
	out.println("</div>");
out.println("</div>");

%>
</body>

<!-- FOOTER-->
<footer class=" text-center text-white">
<div class="container p-4">

<!-- REDES SOCIALES-->
<section class="mb-4">

<!-- Google -->
<img class="btn btn-outline-light btn-floating m-1"
src="images/Google.png" width="60" role="button"> <i
class="fab fa-facebook-f"></i> </img>

<!-- Facebook -->
<img class="btn btn-outline-light btn-floating m-1"
src="images/Facebook.png" width="60" role="button"> <i
class="fab fa-twitter"></i> </img>

<!-- Twitter -->
<img class="btn btn-outline-light btn-floating m-1"
src="images/Twitter.png" width="60" role="button"> <i
class="fab fa-google"></i> </img>

<!-- Instagram -->
<img class="btn btn-outline-light btn-floating m-1"
src="images/Instagram.png" width="60" role="button"> <i
class="fab fa-instagram"></i> </img>

<!-- Linkedin -->
<button type="button" name="button" class="btn "
data-bs-toggle="dropdown">
<img class="btn btn-outline-light btn-floating"
src="images\LinkedIn.png" width="60" role="button"> <i
class="fab fa-instagram"></i> </img>
</button>
<ul class="dropdown-menu text-white">
<li><a href="https://www.linkedin.com/in/abarbag/"
class="text-white dropdown-item" target="_blank">Alejandro
Barba</a></li>
<li><a href="https://www.linkedin.com/in/belen-caocamino"
class=" text-white dropdown-item" target="_blank">Belén Cao</a></li>
<li><a href="https://www.linkedin.com/in/maribellopezromero"
class="text-white dropdown-item" target="_blank">Mª. Isabel
López</a></li>
</ul>

<!-- Github -->
<a href="https://github.com/MaribelLopezRomero/NerdFlixJava.git"
target="_blank"> <img
class="btn btn-outline-light btn-floating m-1"
src="images/GitHub.png" width="60" role="button"> <i
class="fab fa-github"></i> </img>
</a>
</section>

<!-- TEXTO FOOTER -->
<section class="mb-4">
<p>Por si quieres saber algo más de nosotros o informarte sobre
los términos de uso o de privacidad</p>
</section>
<section class="">
<div class="row">
<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
<ul class="list-unstyled mb-0">
<li><a href="enConstruccion.jsp" class="text-white">Acerca
nuestra</a></li>
</ul>
</div>
<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
<ul class="list-unstyled mb-0">
<li><a href="enConstruccion.jsp" class="text-white">Privacidad</a></li>
</ul>
</div>
<div class="col-lg-3 col-md-6 mb-4 mb-md-0">

<ul class="list-unstyled mb-0">
<li><a href="enConstruccion.jsp" class="text-white">Contáctanos</a></li>
</ul>
</div>
<div class="col-lg-3 col-md-6 mb-4 mb-md-0">

<ul class="list-unstyled mb-0">
<li><a href="enConstruccion.jsp" class="text-white">Términos
de Uso</a></li>
</ul>
</div>
</div>
</section>
</div>

<!-- Copyright -->
<div class="text-center p-3"
style="background-color: rgba(0, 153, 117, 0.5);">© 2022:
Alejandro Barba, Belén Cao, Maribel López</div>
</footer>
</body>
</html>