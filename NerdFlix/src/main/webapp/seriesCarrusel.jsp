<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="com.model.Titulos"%>
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

#carousel {
  overflow: auto;
  scroll-behavior: smooth;
  scrollbar-width: none;
}

#carousel::-webkit-scrollbar {
  height: 0;
}

#prev,
#next {
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

#prev {
  top: 50%;
  left: 0;
  transform: translate(50%, -50%);
  display: none;
}

#next {
  top: 50%;
  right: 0;
  transform: translate(-50%, -50%);
}

#content {
  display: grid;
  grid-gap: 16px;
  grid-auto-flow: column;
  margin: auto;
  box-sizing: border-box;
}

.item {
  width: 180px;
  height: 180px;
  background: green;
}

  </style>

  <header>
    <!-- <li class="nav-item">
          <a href="" class="nav-link active"> </a> <img src="image 1.png" alt="">
        </li> -->
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark d-flex justify-content-between">
      <div class="ps-5">
        <img src="image 1.png" alt="" width="200" height="" />
      </div>

      <ul class="navbar-nav">
        <li class="nav-item">
          <a href="" class="nav-link active">Home</a>
        </li>
        <li class="nav-item">
          <a href="Peliculas.html" class="nav-link">Peliculas</a>
        </li>
        <li class="nav-item">
          <a href="Series.html" class="nav-link">Series</a>
        </li>
        <li class="nav-item">
          <a href="#"><i class="fas fa-search sub-nav-logo"></i></a>
        </li>
        <div class="dropdown">
          <button class="btn btn-dark" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
            Favoritos
          </button>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
            <li><a class="dropdown-item" href="#">Series</a></li>
            <li><a class="dropdown-item" href="#">Películas</a></li>   
          </ul>
        </div>
        
        <div class="dropdown">
          <button class="btn btn-dark" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
            En reproducción
          </button>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
            <li><a class="dropdown-item" href="#">Series</a></li>
            <li><a class="dropdown-item" href="#">Películas</a></li>   
          </ul>
        </div>
      </ul>
      <div>
        <a href="Perfil.html"><img class="nav-link btn btn-outline-light btn-floating m-1" src="PerfilSF.png" alt="" width="60" height="" /></a>
      </div>
    </nav>
  </header>
  <main>
  
  <!--   CODIGO JAVA  -->
  
  
     <%

     //Creo un objeto listaGenero con los generos que tengo en mi bbdd, el metodo getGenero me devuelve un linkedList
     
     LinkedList<Titulos> listaGeneros = Controller.getGeneros();	//Aqui quedan guardadas todas las generos que me traigo con el select
     
     //Creo un objeto listaSeries con las series de mi base de datos (las que me he traido con la sentencia select nombre, genero). el metodo get Serie me devuleve un LinkedList
     
     LinkedList<Titulos> listaSeries = Controller.getSeries();	//Aqui quedan guardadas todas las series que me traigo con el select
      
     //HAGO POR CADA GENERO
     for  (int i=0; i<listaGeneros.size(); i++){
    	 
    	 out.println("<p class='text-white ms-5 mt-5'>" + listaGeneros.get(i).getGenero() + "</p>");
    	 out.println(" <div id='wrapper'>");
    		 out.println(" <div id='carousel'>");
    			 out.println(" <div id='content'>");
    	 
	 		 				//Recorro la lista de las series para ir sacandolas segun su genero y en los slides
	 		 			     
	 		 			     for (int j=0; j<listaSeries.size(); j++){
	 		 			    	 
	 		 			    	 String genero =  listaSeries.get(j).getGenero(); //sacamos el genero de cada serie
	 		 			    	
	 		 			    	 
	 		 			    	 if (genero.equals(listaGeneros.get(i).getGenero())) {
	 		 			    
	 		 					 	out.println("<p class='item text-white'>" + listaSeries.get(j).getNombre() + "</li>");
	 		 					 
	 		 			     }
	 		 			     }
	 		 				
	 		 		 out.println("</div>");	 	     
	 		 	out.println(" </div>");
	 		 			 	 

	 		 	out.println("<button id='prev'>");    
	 	 	/*     out.println(" <svg
	 		 	           xmlns='http://www.w3.org/2000/svg'
	 		 	           width='24'
	 		 	           height='24'
	 		 	           viewBox='0 0 24 24'
	 		 	         >");  */
	 		 	   out.println("<path fill='none' d='M0 0h24v24H0V0z' />"); 
	 		 	   out.println(" <path d='M15.61 7.41L14.2 6l-6 6 6 6 1.41-1.41L11.03 12l4.58-4.59z' />");
	 		 	   out.println("</svg>");
	 		 	   
	 		     out.println(" </button>");
	 		 	    out.println("<button id='next'>");
	 		 	/*  out.println(" <svg
	 		 	         xmlns='http://www.w3.org/2000/svg'
	 		 	         width='24'
	 		 	         height='24'
	 		 	         viewBox='0 0 24 24'
	 		 	       >"); */
	 		   		out.println("<path fill='none' d='M0 0h24v24H0V0z' />");
	 		 		out.println("<path d='M10.02 6L8.61 7.41 13.19 12l-4.58 4.59L10.02 18l6-6-6-6z' />");
	 		 	    out.println("</svg>");
	 		 	  out.println("</button>");
	 	 	 out.println("</div>");
	 		 	     

	 	 
	 		 			 
     }
     

    
    %>
    


    <!-- Footer -->
    <footer class="bg-dark text-center text-white">
      <!-- Container -->
      <div class="container p-4">
        <!-- Section: Redes Sociales -->
        <section class="mb-4">
          <!-- Google -->
          <img class="btn btn-outline-light btn-floating m-1" src="/Google.png" width="60" role="button"><i
            class="fab fa-facebook-f"></i></img>

          <!-- Facebook -->
          <img class="btn btn-outline-light btn-floating m-1" src="/Facebook.png" width="60" role="button"><i
            class="fab fa-twitter"></i></img>

          <!-- Twitter -->
          <img class="btn btn-outline-light btn-floating m-1" src="/Twitter.png" width="60" role="button"><i
            class="fab fa-google"></i></img>

          <!-- Instagram -->
          <img class="btn btn-outline-light btn-floating m-1" src="/Instagram.png" width="60" role="button"><i
            class="fab fa-instagram"></i></img>

          <!-- Linkedin -->
          <img class="btn btn-outline-light btn-floating m-1" src="/LinkedIn.png" width="60" role="button"><i
            class="fab fa-linkedin-in"></i></img>

          <!-- Github -->
          <img class="btn btn-outline-light btn-floating m-1" src="/GitHub.png" width="60" role="button"><i
            class="fab fa-github"></i></img>
        </section>
        <!-- Section: Redes Sociales -->
        <!-- Section: Text -->
        <section class="mb-4">
          <p>
            Por si quieres saber algo más de nosotros o informarte sobre los términos de uso o de privacidad
          </p>
        </section>
        <!-- Section: Text -->

        <!-- Section: Links -->
        <section class="">
          <!--Grid row-->
          <div class="row">
            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">

              <ul class="list-unstyled mb-0">
                <li>
                  <a href="#!" class="text-white">Acerca nuestra</a>
                </li>
              </ul>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
              <h5 class="text-uppercase">Links</h5>

              <ul class="list-unstyled mb-0">
                <li>
                  <a href="#!" class="text-white">Privacidad</a>
                </li>
              </ul>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">

              <ul class="list-unstyled mb-0">
                <li>
                  <a href="#!" class="text-white">Contáctanos</a>
                </li>
              </ul>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">

              <ul class="list-unstyled mb-0">
                <li>
                  <a href="#!" class="text-white">Términos de Uso</a>
                </li>
              </ul>
            </div>
            <!--Grid column-->
          </div>
          <!--Grid row-->
        </section>
        <!-- Section: Links -->
      </div>
      <!-- Grid container -->

      <!-- Copyright -->
      <div class="text-center p-3" style="background-color: rgba(0, 153, 117, 0.5);">
        © 2022: Alejandro Barba, Belén Cao, Maribel López

      </div>
      <!-- Copyright -->
    </footer>
    <!-- Footer -->
  </main>
</body>

<script>

//PARA QUE FUNCIONEN LOS BOTONES EN CADA CARRUSEL HAY QUE METER UNA VARIABLE CONTADOR Y PONERSELA A CADA VARIABLE DE JS PARA QUE ASI SEA UNICAS PARA CADA CARRUSEL

const gap = 16;

const carousel = document.getElementById("carousel"),
  content = document.getElementById("content"),
  next = document.getElementById("next"),
  prev = document.getElementById("prev");

next.addEventListener("click", e => {
  carousel.scrollBy(width + gap, 0);
  if (carousel.scrollWidth !== 0) {
    prev.style.display = "flex";
  }
  if (content.scrollWidth - width - gap <= carousel.scrollLeft + width) {
    next.style.display = "none";
  }
});
prev.addEventListener("click", e => {
  carousel.scrollBy(-(width + gap), 0);
  if (carousel.scrollLeft - width - gap <= 0) {
    prev.style.display = "none";
  }
  if (!content.scrollWidth - width - gap <= carousel.scrollLeft + width) {
    next.style.display = "flex";
  }
});

let width = carousel.offsetWidth;
window.addEventListener("resize", e => (width = carousel.offsetWidth));

</script>

</html>



