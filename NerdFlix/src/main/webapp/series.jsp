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
  </style>
  
  <header>
    <!-- <li class="nav-item">
          <a href="" class="nav-link active"> </a> <img src="image 1.png" alt="">
        </li> -->
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark d-flex justify-content-between">
      <div class="ps-5">
        <img src="images/logo.png" alt="" width="200" height="" />
      </div>

      <ul class="navbar-nav">
        <li class="nav-item">
          <a href="Home.html" class="nav-link">Home</a>
        </li>
        <li class="nav-item">
          <a href="Peliculas.html" class="nav-link">Peliculas</a>
        </li>
        <li class="nav-item">
          <a href="" class="nav-link active">Series</a>
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
        <a href="Perfil.html"><img class="nav-link btn btn-outline-light btn-floating m-1" src="images/PerfilSF.png" alt="" width="60" height="" /></a>
      </div>
    </nav>
  </header>
  <main>
    <!--CARROUSEL POR GENEROS-->
    <div id="carousel" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item">
          <div class="row">
            <div class="col">
              <div>
                <div class="bg-secondary py-5 text-white text-center">6</div>
              </div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">7</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">8</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">9</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">10</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!--GENERO-->
    <br>
    
    
     <!--   CODIGO JAVA  -->
     
     <%
     
     //Creo un objeto listaGenero con los generos que tengo en mi bbdd, el metodo getGenero me devuelve un linkedList
     
     LinkedList<Titulos> listaGeneros = Controller.getGeneros();	//Aqui quedan guardadas todas las generos que me traigo con el select
     
     
     
     //Creo un objeto listaSeries con las series de mi base de datos (las que me he traido con la sentencia select nombre, genero). el metodo get Serie me devuleve un LinkedList
     
     LinkedList<Titulos> listaSeries = Controller.getSeries();	//Aqui quedan guardadas todas las series que me traigo con el select
      
     //HAGO POR CADA GENERO
     for  (int i=0; i<listaGeneros.size(); i++){
    	 
		 out.println("<h4 style='color:white' class='ps-5 pe-5'>" + listaGeneros.get(i).getGenero()+ "</h4>");
		 out.println("<div id='carousel' class='carousel slide ps-5 pe-5' data-ride='carousel'>");
			 out.println("<div class='carousel-inner '>");
			 

				 out.println("<div class='carousel-item active'>"); //solo seria esta linea lo de tener active o no tenerlo ?¿hacer un for?¿
	 	 			out.println("<div class='row'>");
	 					out.println("<div class='col'>");
	 		 				out.println("<div>");
	 		 				
	 		 				//Recorro la lista de las series para ir sacandolas segun su genero y en los slides
	 		 			     
	 		 			     for (int j=0; j<listaSeries.size(); j++){
	 		 			    	 
	 		 			    	 String genero =  listaSeries.get(j).getGenero(); //sacamos el genero de cada serie
	 		 			    	 
	 		 			    	 if (genero.equals(listaGeneros.get(i).getGenero()) ) {
	 		 			    		 
	 		 			    		/*  out.println("<h4 style='color:white' class='ps-5 pe-5'>Aventura</h4>");
	 		 			    		 out.println("<div id='carousel' class='carousel slide ps-5 pe-5' data-ride='carousel'>");
	 		 			    			 out.println("<div class='carousel-inner '>");
	 		 			    			 
	 		 			    
	 		 			    				 out.println("<div class='carousel-item active'>"); //solo seria esta linea lo de tener active o no tenerlo ?¿hacer un for?¿
	 		 					 	 			out.println("<div class='row'>");
	 		 					 					out.println("<div class='col'>");
	 		 					 		 				out.println("<div>"); */
	 		 					 		 					out.println("<div class='bg-secondary py-5 text-white text-center'>" + listaSeries.get(j).getNombre() + "</div>");
	 		 			/* 		 		 				out.println("</div>");
	 		 					 		 			out.println("</div>");
	 		 					 				out.println("</div>");
	 		 					 			out.println("</div>"); 
	 		 					 			
	 		 					 		 out.println("</div>");
	 		 					 		 
	 		 					 		 out.println("<a class='carousel-control-prev' href='#carousel' role='button' data-slide='prev'>");
	 		 					 			 out.println("<span class='carousel-control-prev-icon' aria-hidden='true'></span>");
	 		 					 			 out.println(" <span class='sr-only'>Previous</span>");
	 		 					 		 out.println("</a>");
	 		 					 		 
	 		 					 		
	 		 					 		 out.println(" <a class='carousel-control-next' href='#carousel' role='button' data-slide='next'>");
	 		 					 			 out.println("<span class='carousel-control-next-icon' aria-hidden='true'></span>");
	 		 					 			 out.println("<span class='sr-only'>Next</span>");
	 		 					 		 out.println("out.println('</div>''); ");
	 		 					 		
	 		 					 	out.println("</div>");  */
	 		 			    			 
	 		 			    			
	 		 			    	 
	 		 			     }
	 		 			     }
	 		 				
	 		 				out.println("</div>");
	 		 			out.println("</div>");
	 				out.println("</div>");
	 			out.println("</div>"); 
	 			
	 		 out.println("</div>");
	 		 
	 		 out.println("<a class='carousel-control-prev' href='#carousel' role='button' data-slide='prev'>");
	 			 out.println("<span class='carousel-control-prev-icon' aria-hidden='true'></span>");
	 			 out.println(" <span class='sr-only'>Previous</span>");
	 		 out.println("</a>");
	 		 
	 		
	 		 out.println(" <a class='carousel-control-next' href='#carousel' role='button' data-slide='next'>");
	 			 out.println("<span class='carousel-control-next-icon' aria-hidden='true'></span>");
	 			 out.println("<span class='sr-only'>Next</span>");
	 		 out.println("out.println('</div>''); ");
	 		
	 	out.println("</div>"); 
    	 
    	 
     }
     

    
    %>
    
    
    
  <!--   <h4 style="color:white" class="ps-5 pe-5">Aventura</h4>
    <div id="carousel" class="carousel slide ps-5 pe-5" data-ride="carousel">
      <div class="carousel-inner ">
      
   
        <div class="carousel-item active">
          <div class="row">
          
          
            <div class="col">
              <div>
                <div class="bg-secondary py-5 text-white text-center">1</div>
              </div>
            </div>
          
          </div>
        </div>
        
        
        <div class="carousel-item">
          <div class="row">
            <div class="col">
              <div>
                <div class="bg-secondary py-5 text-white text-center">6</div>
              </div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">7</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">8</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">9</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">10</div>
            </div>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    Terror
    <br>
    <h4 style="color:white" class="ps-5 pe-5">Terror</h4>
    <div id="carousel" class="carousel slide ps-5 pe-5" data-ride="carousel">
      <div class="carousel-inner ">
        <div class="carousel-item active">
          <div class="row">
            <div class="col">
              <div>
                <div class="bg-secondary py-5 text-white text-center">1</div>
              </div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">2</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">3</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">4</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">5</div>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="row">
            <div class="col">
              <div>
                <div class="bg-secondary py-5 text-white text-center">6</div>
              </div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">7</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">8</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">9</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">10</div>
            </div>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    Comedia
    <br>
    <h4 style="color:white" class="ps-5 pe-5">Comedia</h4>
    <div id="carousel" class="carousel slide ps-5 pe-5" data-ride="carousel">
      <div class="carousel-inner ">
        <div class="carousel-item active">
          <div class="row">
            <div class="col">
              <div>
                <div class="bg-secondary py-5 text-white text-center">1</div>
              </div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">2</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">3</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">4</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">5</div>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="row">
            <div class="col">
              <div>
                <div class="bg-secondary py-5 text-white text-center">6</div>
              </div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">7</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">8</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">9</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">10</div>
            </div>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    Thriller
    <br>
    <h4 style="color:white" class="ps-5 pe-5">Thriller</h4>
    <div id="carousel" class="carousel slide ps-5 pe-5" data-ride="carousel">
      <div class="carousel-inner ">
        <div class="carousel-item active">
          <div class="row">
            <div class="col">
              <div>
                <div class="bg-secondary py-5 text-white text-center">1</div>
              </div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">2</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">3</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">4</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">5</div>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="row">
            <div class="col">
              <div>
                <div class="bg-secondary py-5 text-white text-center">6</div>
              </div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">7</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">8</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">9</div>
            </div>
            <div class="col">
              <div class="bg-secondary py-5 text-white text-center">10</div>
            </div>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
 -->
    <!-- Footer -->
    <footer class="bg-dark text-center text-white">
      <!-- Container -->
      <div class="container p-4">
        <!-- Section: Redes Sociales -->
        <section class="mb-4">
          <!-- Google -->
          <img class="btn btn-outline-light btn-floating m-1" src="images/Google.png" width="60" role="button"><i
            class="fab fa-facebook-f"></i></img>

          <!-- Facebook -->
          <img class="btn btn-outline-light btn-floating m-1" src="images/Facebook.png" width="60" role="button"><i
            class="fab fa-twitter"></i></img>

          <!-- Twitter -->
          <img class="btn btn-outline-light btn-floating m-1" src="images/Twitter.png" width="60" role="button"><i
            class="fab fa-google"></i></img>

          <!-- Instagram -->
          <img class="btn btn-outline-light btn-floating m-1" src="images/Instagram.png" width="60" role="button"><i
            class="fab fa-instagram"></i></img>

          <!-- Linkedin -->
          <img class="btn btn-outline-light btn-floating m-1" src="images/LinkedIn.png" width="60" role="button"><i
            class="fab fa-linkedin-in"></i></img>

          <!-- Github -->
          <img class="btn btn-outline-light btn-floating m-1" src="images/GitHub.png" width="60" role="button"><i
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

</html>