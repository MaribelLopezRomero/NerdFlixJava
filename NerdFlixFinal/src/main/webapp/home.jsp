<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="com.model.Titulos"%>
        <%@ page import="com.model.Usuarios"%>
<%@ page import="com.ies.baroja.Controller"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
  

<body style="background-color:rgb(52, 58, 64);">
  <style>
  .dropdown-menu{
    background-color: rgb(33, 37, 41);
  }
/* 
  body {
  margin: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 100vh;
  background-color: #000;
} */

#wrapper {

  width: 95%;
  position: relative;
  margin-left: 50px;
  margin-top: 50px;
}

.carousel {
  overflow: auto;
  scroll-behavior: smooth;
  scrollbar-width: none;
}

.carousel::-webkit-scrollbar {
  height: 0;
}

.prev,
.next {
  display: flex;
  justify-content: center;
  align-content: center;
  background: white;
  border: none;
  padding: 8px;
  border-radius: 50%;
  outline: 0;
  cursor: pointer;
  position: absolute;
}

.prev {
  top: 50%;
  left: 0;
  transform: translate(50%, -50%);
  display: none;
}

.next {
  top: 50%;
  right: 0;
  transform: translate(-50%, -50%);
}

.content {
  display: grid;
  grid-gap: 16px;
  grid-auto-flow: column;
  margin: auto;
  box-sizing: border-box;
}

.item {
  width: 200px;
  height: 300px;
  margin-right: 30px;
  background: green;
}
.imagen{
 width: 200px;
 height: 300px;
}

  </style>

	<header>
	<!-- MENÚ SUPERIOR - NAVBAR -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark d-flex justify-content-between">
			<div class="ps-5">
				<a href="home.jsp"><img src="images\logo.png" alt="" width="200" height="" /></a>
			</div>
			
			<!-- MENÚ-->
			<ul class="navbar-nav">
				<li class="nav-item"><a href="" class="nav-link active">Home</a>
				</li>
				<li class="nav-item"><a href="peliculas.jsp" class="nav-link">Películas</a>
				</li>
				<li class="nav-item"><a href="series.jsp" class="nav-link ">Series</a>
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
				<button type="submit" class="nav-link btn btn-outline-light" width="70" height="" style="margin-right: 5px">
      					Bienvenido ${sessionScope.objUsuario.getNombre()}
      					<img src="images\PerfilSF.png" alt="" width="25" height="" />
      				</button>
      				</form>
				
			<!-- CÓDIGO JAVA - Solo para administrador -->	
			<%
			if(miUsu.getNombre().equals("administrador")){
				out.println("<a href='formulario_administrador.html' class='nav-link btn btn-outline-light' width='70' style='margin-right: 5px'>Administrador</a>");
			}			

			%>		
					
					
					<form action="ServletForm" method="POST">
					<button name = "cerrarSesion" type="submit" class="nav-link btn btn-outline-light" width="70" height="" style="margin-right: 5px">
      					Cerrar Sesión
      				</button>
      				</form>
      				</div>
      			
			
		</nav>
	</header>
  <main>
  
  <!--   CODIGO JAVA  -->
  
  
     <%
     
     int javascript=0;

     //Creo un objeto listaGenero con los generos que tengo en mi bbdd, el metodo getGenero me devuelve un linkedList
     
     LinkedList<Titulos> listaGeneros = Controller.getGeneros();	//Aqui quedan guardadas todas las generos que me traigo con el select
     
     //Creo un objeto listaSeries con las series de mi base de datos (las que me he traido con la sentencia select nombre, genero). el metodo get Serie me devuleve un LinkedList
     
     LinkedList<Titulos> listaTitulos = Controller.getTitulos();	//Aqui quedan guardadas todas las series que me traigo con el select
      
     //HAGO POR CADA GENERO
     for  (int i=0; i<listaGeneros.size(); i++){
    	 
    	 out.println("<p class='text-white ms-5 mt-5'>" + listaGeneros.get(i).getGenero().toUpperCase() + "</p>");
    	 out.println(" <div id='wrapper'>");
    		 out.println(" <div class ='carousel'  id='carousel"+i+"'>");
    			 out.println(" <div class ='content'  id='content"+i+"'>");
    	 
	 		 				//Recorro la lista de las series para ir sacandolas segun su genero y en los slides
	 		 			     
	 		 			     for (int j=0; j<listaTitulos.size(); j++){
	 		 			    	 
	 		 			    	 String genero =  listaTitulos.get(j).getGenero(); //sacamos el genero de cada serie
	 		 			    	
	 		 			    	 
	 		 			    	 if (genero.equals(listaGeneros.get(i).getGenero())) {
	 		 			    		 
	 		 			    	 out.println ("<div class='item'>");
	 		 			    	out.println("<a href = 'playTitulos.jsp?param="+listaTitulos.get(j).getCod_titulo()+"&param2=titulo'> <img class='imagen' src='"+ listaTitulos.get(j).getImagen() +"'/> </a>");

	 		 					  
	 		 					 out.println ("</div>");
	 		 			     }
	 		 
	 		 			     }
	 		 				
	 		 		 out.println("</div>");	 	     
	 		 	out.println(" </div>");
	 		 			 	 

	 		 	out.println("<button class ='prev'  id='prev"+i+"'>");    
	 	 	     out.println("<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'>");  
	 		 	   out.println("<path fill='none' d='M0 0h24v24H0V0z' />"); 
	 		 	   out.println(" <path d='M15.61 7.41L14.2 6l-6 6 6 6 1.41-1.41L11.03 12l4.58-4.59z' />");
	 		 	   out.println("</svg>");
	 		 	   
	 		     out.println(" </button>");
	 		 	    out.println("<button class ='next' id='next"+i+"'>");
	 		 	out.println(" <svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'>"); 
	 		   		out.println("<path fill='none' d='M0 0h24v24H0V0z' />");
	 		 		out.println("<path d='M10.02 6L8.61 7.41 13.19 12l-4.58 4.59L10.02 18l6-6-6-6z' />");
	 		 	    out.println("</svg>");
	 		 	  out.println("</button>");
	 	 	 out.println("</div>");
	 		 	     

	 	 
	 		 			 
     }
     

    
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

<script>

//PARA QUE FUNCIONEN LOS BOTONES EN CADA CARRUSEL HAY QUE METER UNA VARIABLE CONTADOR Y PONERSELA A CADA VARIABLE DE JS PARA QUE ASI SEA UNICAS PARA CADA CARRUSEL

	const gap0 = 16;

	const carousel0 = document.getElementById("carousel0"),
	  content0 = document.getElementById("content0"),
	  next0 = document.getElementById("next0"),
	  prev0 = document.getElementById("prev0");

	next0.addEventListener("click", e => {
	  carousel0.scrollBy(width0 + gap0, 0);
	  if (carousel0.scrollWidth !== 0) {
	    prev0.style.display = "flex";
	  }
	  if (content0.scrollWidth - width0 - gap0 <= carousel0.scrollLeft + width0) {
	    next0.style.display = "none";
	  }
	});
	prev0.addEventListener("click", e => {
	  carousel0.scrollBy(-(width0 + gap0), 0);
	  if (carousel0.scrollLeft - width0 - gap0 <= 0) {
	    prev0.style.display = "none";
	  }
	  if (!content0.scrollWidth - width0 - gap0 <= carousel.scrollLeft + width0) {
	    next0.style.display = "flex";
	  }
	});

	let width0 = carousel0.offsetWidth;
	window.addEventListener("resize", e => (width0 = carousel0.offsetWidth));
	
	// //SEGUNDO CARRUSEL

	const gap1 = 16;

	 const carousel1 = document.getElementById("carousel1"),
		content1 = document.getElementById("content1"),
		next1 = document.getElementById("next1"),
		prev1 = document.getElementById("prev1");

	 next1.addEventListener("click", e => {
	 carousel1.scrollBy(width1 + gap1, 0);
	 if (carousel1.scrollWidth1 !== 0) {
	    prev1.style.display = "flex";
	   }
	 if (content1.scrollWidth - width1 - gap1 <= carousel.scrollLeft + width1) {
     next1.style.display = "none";
	 }
	 });
	 prev1.addEventListener("click", e => {
	 carousel1.scrollBy(-(width1 + gap1), 0);
	  if (carousel1.scrollLeft - width1 - gap1 <= 0) {
    prev1.style.display = "none";
  	}
	  if (!content1.scrollWidth - width1 - gap1 <= carousel1.scrollLeft + width) {
	    next1.style.display = "flex";
	 }
	 });

	let width1 = carousel1.offsetWidth;
	window.addEventListener("resize", e => (width1 = carousel1.offsetWidth)); 

	//TERCER CARRUSEL
	const gap2 = 16;

	const carousel2 = document.getElementById("carousel2"),
	  content2 = document.getElementById("content2"),
	  next2 = document.getElementById("next2"),
	  prev2 = document.getElementById("prev2");

	next2.addEventListener("click", e => {
	  carousel2.scrollBy(width2 + gap2, 0);
	  if (carousel2.scrollWidth !== 0) {
	    prev2.style.display = "flex";
	  }
	  if (content2.scrollWidth - width2 - gap2 <= carousel2.scrollLeft + width2) {
	    next2.style.display = "none";
	  }
	});
	prev2.addEventListener("click", e => {
	  carousel2.scrollBy(-(width2 + gap2), 0);
	  if (carousel2.scrollLeft - width2 - gap2 <= 0) {
	    prev2.style.display = "none";
	  }
	  if (!content2.scrollWidth - width2 - gap2 <= carousel.scrollLeft + width2) {
	    next2.style.display = "flex";
	  }
	});

	let width2 = carousel2.offsetWidth;
	window.addEventListener("resize", e => (width2 = carousel2.offsetWidth));
	
	//CUARTO CARRUSEL
	const gap3 = 16;

	const carousel3 = document.getElementById("carousel3"),
	  content3 = document.getElementById("content3"),
	  next3 = document.getElementById("next3"),
	  prev3 = document.getElementById("prev3");

	next3.addEventListener("click", e => {
	  carousel3.scrollBy(width3 + gap3, 0);
	  if (carousel3.scrollWidth !== 0) {
	    prev3.style.display = "flex";
	  }
	  if (content3.scrollWidth - width3 - gap3 <= carousel3.scrollLeft + width3) {
	    next3.style.display = "none";
	  }
	});
	prev3.addEventListener("click", e => {
	  carousel3.scrollBy(-(width3 + gap3), 0);
	  if (carousel3.scrollLeft - width3 - gap3 <= 0) {
	    prev3.style.display = "none";
	  }
	  if (!content3.scrollWidth - width3 - gap3 <= carousel.scrollLeft + width3) {
	    next3.style.display = "flex";
	  }
	});

	let width3 = carousel3.offsetWidth;
	window.addEventListener("resize", e => (width3 = carousel3.offsetWidth));

</script>

</html>



