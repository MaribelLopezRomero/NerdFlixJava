<!-- PÁGINA VISALIZAR DATOS DE SERIES -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Titulos"%>
<%@ page import="com.model.Usuarios"%>
<%@ page import="com.ies.baroja.Controller"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>PlaySeries - NerdFlix</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

  <!-- CÓDIGO JAVA - Mantiene inicio sesión -->
  <%
  HttpSession sesion = request.getSession();
  Usuarios miUsu=null;
  if (sesion.getAttribute("objUsuario" ) != null) {
  miUsu = (Usuarios) sesion.getAttribute("objUsuario" );
 } else if  ( sesion.getAttribute("emailInicio") == null) {

response.sendRedirect("index.html");
}
  %> <!-- FIN CÓDIGO JAVA -->


<body style="background-color: rgb(52, 58, 64)">
<style>
.dropdown-menu {
	background-color: rgb(33, 37, 41);
}

.colum {
	text-align: center;
	vertical-align: top;
}

.parrafo {
	text-align: justify;
}

.dropdown dropend {
	float: right;
}
</style>
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
				<li class="nav-item"><a href="series.jsp" class="nav-link active">Series</a>
				</li>
				</li>
				<li class="nav-item"><a href="favoritos.jsp" class="nav-link">Favoritos</a>
				</li>
				</li>
				<li class="nav-item"><a href="#" class="nav-link">En reproducción</a></li>
			</ul>
			
			  <!-- CÓDIGO JAVA - Que se vea el usuario con sesion -->
			  <%
        		/*   <h1>Bienvenido ${session.Scope.emailInicio} </h1> */
     			/*    out.println("<h1>Bienvenido  ${session.Scope.emailInicio} </h1>"); */
				/*   out.println("<h1>Bienvenido " + objUsuario.getNombre()+ " </h1>");  */
         		HttpSession misesion = request.getSession();
				String email = (String) misesion.getAttribute("emailInicio");
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
				out.println("<a href='formulario_administrador.html' class='nav-link btn btn-outline-light' width='70' style='margin-right: 5px'>Administrador</a>");
			}			

			%>					<form action="ServletForm" method="POST">
					<button name = "cerrarSesion" type="submit" class="text-white nav-link btn btn-outline-light" width="70" height="" style="margin-right: 5px">
      					Cerrar Sesión
      				</button>
      				</form>
      				</div>
		</nav>
	</header>
	
	<!-- CÓDIGO JAVASCRIPT -->
	<%
 	//DECLARACIONES
	String param = request.getParameter("param");
	      
	//lista con todas las series
	LinkedList<Titulos> listaSeries = Controller.getSeries();
	
	
	//BUCLE FOR - para encontrar que serie hemos pinchado y se muestre en la página
	for(int i=0; i< listaSeries.size(); i++){
	
		//BUCLE IF - con el que igualamos le cod_titulo con el parametro generado para visualizar los datos de la serie
		if (listaSeries.get(i).getCod_titulo().equals(param)){
		
			out.println(" <div class='container p-5 my-5 border bg-white text-dark'>");
				out.println("<h2 class='text-dark'>"+ listaSeries.get(i).getNombre() +"</h2>");
				out.println("<div class='dropdown btn-group mb-3' style='text-align: right;'>");
				
				//BOTON DESPLEGABLE TEMPORADAS
				out.println("  <button type='button' name='button' class='btn btn-success dropdown-toggle' data-bs-toggle='dropdown'>Temporada</button>");
					out.println(" <ul class='dropdown-menu text-white'>");
					
						//Obtenemos el numero de temporadas que tiene de la BBDD
						String n_temporadas = listaSeries.get(i).getTemporadas();
						
						//Cast a int
						int temporadas = Integer.parseInt(n_temporadas);
						
						//Imprimimos tantas temporadas haya
						for(int j=1; j<=temporadas; j++){
							out.println(" <li>Temporada " + j + "</li>");
						}
					
					out.println("</ul>");
					
					//BOTON FAVORITOS
					out.println("<form action='ServletForm' method='POST'>");
						out.println("<button type='submit' name='favoritos' value='"+listaSeries.get(i).getCod_titulo()+"' class='btn btn-danger'><img src='images/corazon.png' width='20' height='20'></button>");
							out.println("<input  type='hidden' id='param2' name='param2' value='serie' />");
						out.println("</form>");
				out.println(" </div>");
				
				//TABLA desde la que damos forma a la visualizacion de los datos de la serie
				out.println("<table>");
					out.println("<tr>");
						out.println("<td rowspan='4' border='1' width='25%' height='50px' style='vertical-align:middle; text-align='left'>");
							out.println("<img width='300' height='400' align='center' src= " + listaSeries.get(i).getImagen()  +">");
						out.println("</td>");
						out.println("<td class='column'width='17%' height='50px' align=''> Fecha de estreno </td>");
						out.println("<td>");
						out.println(listaSeries.get(i).getFecha_estreno());
						out.println("</td>");
					out.println(" </tr>");
				
					out.println(" <tr>");
						out.println("<td class='column'width='17%' height='50px' align=''>Género</td>");
						out.println("<td class='column'width='17%' height='50px' align=''>"+ listaSeries.get(i).getGenero().toUpperCase() + "</td>");
				    out.println(" </tr>");
			 
				  	out.println(" <tr>");
						out.println("<td class='column'width='17%' height='50px' align=''>Sinopsis:</td>");
						out.println(" <td> <p class='parrafo'>"+ listaSeries.get(i).getSinopsis()+"</p></td>");
					out.println(" </tr>");
			 
				 	out.println(" <tr>");
					 	out.println(" <div class='dropdown dropend' style='text-align: center'>");
							out.println("<td align='center'>");
								out.println(" <a href="+listaSeries.get(i).getLink() + " class='btn btn-success btn-lg btn-block w-50' target='_blank'>Ver trailer</a>");
							out.println(" </td>");
							out.println("<td align='center'>");
								out.println(" <a href='enConstruccion.jsp' class='btn btn-success btn-lg btn-block w-50' target='_blank'>Ver serie</a>");
							out.println(" </td>");
						out.println(" </div>");
				 	out.println(" </tr>");
			
				out.println("</table>");//fin tabla de visualizacion de datos
			out.println(" </div>");
		} //fin bucle if
	} //fin bucle for
	
 	%>


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
					<a href="https://www.linkedin.com/in/belen-caocamino" class=" text-white dropdown-item" target="_blank">Belén Cao</a>
				</li>
				<li>
					<a href="https://www.linkedin.com/in/maribellopezromero" class="text-white dropdown-item" target="_blank">Mª. Isabel López</a>
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
						<li><a href="enConstruccion.jsp" class="text-white">Acerca nuestra</a></li>
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
						<li><a href="enConstruccion.jsp" class="text-white">Términos de Uso</a></li>
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
