package com.ies.baroja;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Favoritos;
import com.model.Titulos;
import com.model.Usuarios;

/**
 * NerdFlix
 * @author Alejandro Barba
 * @author Belén Cao
 * @author Mª Isabel López
 * @since 30/05/2021
 */

@WebServlet("/ServletForm")

public class ServletForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ServletForm() {
		super();
	}

	
	/**
	 * MÉTODO DOGET: recoger un parametro de la URL que construimos en home, series, peliculas y favorito cuyo valor es el cod_titulo y nos
	 * lleva a una pagina con la información de ese titulo
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			//DECLARAR VARIABLES
			String param = request.getParameter("param");
			String param2 = request.getParameter("param2"); //para cuando añadimos el titulo a fav se nos recargue la página
	}

	
	/**
	 * MÉTODO DOPOST: Recogera los datos que se envian por el formulario reistro sesion ,
	 *      inicio sesion, alta peliculas (administrado), alta favoritos y cerrar
	 *      sesión

	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TRY..CATCH - Para que si no se no nos manda a la pagina especificada nos muestre un mensaje y nos lleve a MÉTODO mostrarError
		try {
			if (request.getParameter("emailInicio") != null) {
				loginUsuario(request, response);
			} else if (request.getParameter("usuarioAlta") != null) {
				altaUsuario(request, response);
			} else if (request.getParameter("nombreTitulo") != null) {
				altaTitulo(request, response);
			} else if (request.getParameter("favoritos") != null) {
				String param2 = request.getParameter("param2");
				System.out.println("nombre del parametro /&/(&/:"+param2);
				gestionarFavoritos(request, response);
			} else if (request.getParameter("cerrarSesion") != null) {
				cerrarSesion(request, response);
			}

		} catch (Exception ex) {
			System.out.println("Error en servlet");
			ex.printStackTrace();
			mostrarError(response);
		}
	}


	

	/**
	 * MÉTODO GESTIONARFAVORITOS: Manda al metodo AltaFavorito o BajaFavorito
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void gestionarFavoritos(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//DECLARAMOS LAS VARIABLES
		String codUsu= null;
		String codFav = null;
		int i=0;
		
		//RECOGEMOS LOS DATOS
		String favoritoTitulo = request.getParameter("favoritos");

		//VEMOS SI LO QUE TIENE QUE DAR DE ALTA O NO EN FUNCION DE SI ESTA O NO EN LA BBDD
		LinkedList<Favoritos> listaFavoritos = Controller.getFavoritos();

		//RECUPERO LA SESION
		HttpSession sesion = request.getSession();
		Usuarios miUsu = (Usuarios) sesion.getAttribute("objUsuario");

		//ALTA FAVORITO
		Favoritos miFav = new Favoritos (miUsu.getCod_usuario(), favoritoTitulo);

		//BUCLE IF - Si listaFavortios no contiene el código, lo añade
		if (listaFavoritos.contains(miFav)==false) {
			String UsuFav= miFav.getCod_usuario();
			String TitFav=miFav.getCod_titulo();
			altaFavoritos(UsuFav, TitFav, request, response);

		}
	
		if((listaFavoritos.get(0).getCod_usuario().equalsIgnoreCase(miUsu.getCod_usuario())) && (listaFavoritos.get(0).getCod_titulo().equalsIgnoreCase(favoritoTitulo))){ 
			codUsu = listaFavoritos.get(0).getCod_usuario();
			codFav = listaFavoritos.get(0).getCod_titulo();
			bajaFavoritos(codUsu, codFav, request, response);
			
		}
		
		//BUCLE WHILE - Comprueba que el cod_titulo y el cod_usuario están en la listFavoritos
		while (!((listaFavoritos.get(i).getCod_usuario().equalsIgnoreCase(miUsu.getCod_usuario())) && (listaFavoritos.get(i).getCod_titulo().equalsIgnoreCase(favoritoTitulo)))){
			codUsu = listaFavoritos.get(i+1).getCod_usuario();
			codFav = listaFavoritos.get(i+1).getCod_titulo();
			i++;
		}
		
		//BUCLE IF - Si listaFavortios contiene el código, lo borramos
		if ((codUsu.equalsIgnoreCase(miUsu.getCod_usuario()))&& codFav.equalsIgnoreCase(favoritoTitulo)) {
			bajaFavoritos(codUsu, codFav, request, response);
		}
		
		}
	
	/**
	 * MÉTODO ALTAFAVORITOS: Da de alta como favorito una serie o una pelicula
	 * @param UsuFav
	 * @param TitFav
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void altaFavoritos(String UsuFav, String TitFav, HttpServletRequest request, HttpServletResponse response) throws Exception {

		/**1- recogida de datos**/
		String favoritoTitulo = request.getParameter("favoritos");
		Favoritos favoritos = new Favoritos(UsuFav, TitFav);

		/**2- Insertar favorito en la base de datos**/
		boolean bRes = Controller.insertarFavoritos(favoritos);

		/**3- Mostrar resultado por pantalla**/
		if (bRes) {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

				// Redirige al home
				String param2 = request.getParameter("param2");
				String param = request.getParameter("param");
				
				if (param2.equals("serie")) {
					response.sendRedirect("playSeries.jsp?param=" + favoritoTitulo + "&param2=serie");
				}else if (param2.equals("pelicula")) {
					response.sendRedirect("playPeliculas.jsp?param=" + favoritoTitulo + "&param2=pelicula");
				}else if (param2.equals("titulo")) {
					response.sendRedirect("playTitulos.jsp?param=" + favoritoTitulo +"&param2=titulo");
				}else if (param2.equals("favorito")) {
					response.sendRedirect("favoritos.jsp");
				}
			out.close();

		} else {
			// Mostramos que se ha producido un error
			mostrarError(response);
		}
	}
	
	

	/**
	 * MÉTODO BAJAFAVORITOS: Da de baja como favorito una serie o una pelicula
	 * @param codUsu
	 * @param codFav
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void bajaFavoritos(String codUsu, String codFav, HttpServletRequest request, HttpServletResponse response) throws Exception {

		/**1- recogida de datos**/
		String favoritoTitulo = request.getParameter("favoritos");
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		Favoritos favoritos = new Favoritos(codUsu, codFav);

		/**2-Dar de baja favorito en la base de datos**/
		boolean bRes = Controller.eliminarFavoritos(favoritos);
		
		/**3- Mostrar resultado por pantalla**/
		if (bRes) {
			//Redirige al home
			String param2 = request.getParameter("param2");
			String param = request.getParameter("param");
			
			if (param2.equals("serie")) {
				response.sendRedirect("playSeries.jsp?param=" + favoritoTitulo + "&param2=serie");
			}else if (param2.equals("pelicula")) {
				response.sendRedirect("playPeliculas.jsp?param=" + favoritoTitulo + "&param2=pelicula");
			}else if (param2.equals("titulo")) {
				response.sendRedirect("playTitulos.jsp?param=" + favoritoTitulo +"&param2=titulo");
			}else if (param2.equals("favorito")) {
				response.sendRedirect("favoritos.jsp");
			}
		} else {
			// Mostramos que se ha producido un error
			mostrarError(response);
		}

		out.close();

	}

	
	/**
	  MÉTODO ALTAUSUARIO: Da de alta al usuario en la BBDD cuando se registra
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void altaUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {

		/** 1- recogida de datos **/
		String emailIntroducido = request.getParameter("emailAlta");
		String usuarioIntroducido = request.getParameter("usuarioAlta");
		String password1 = request.getParameter("passwordAlta");
		String password2 = request.getParameter("passwordAlta2");
		
		LinkedList<Usuarios> listaUsuarios = Controller.getUsuarios();
		
		Boolean correo=true;
		Boolean password=true;

		//BUCLE FOR - Recorre listaUsuario
		for (int i = 0; i < listaUsuarios.size(); i++) {

			//BUCLE IF- Comprueba que no existe el usuario en la BBDD Controller.getUsuario() si está nos lleva a correoDuplicado.html
			if (listaUsuarios.get(i).getCorreo().equals(emailIntroducido)) {
				PrintWriter out = response.getWriter();
				response.sendRedirect("correoDuplicado.html");
				correo = false;
				out.close();
				i = listaUsuarios.size() + 1;

				} else if (!(password1.equals(password2))) {
				PrintWriter out = response.getWriter();
				response.sendRedirect("torpe.html");
				password = false;
				out.close();
				i = listaUsuarios.size() + 1;

				} else {

				PrintWriter out = response.getWriter();

				response.sendRedirect("formulario_inicioSesion.html");
				out.close();
				i = listaUsuarios.size() + 1;
				}
			
		}

		//OBJETO USUARIOS A INSERTAR EN LA BBDD
		if (correo==true && password==true) {
			
		
		Usuarios usuario = new Usuarios(request.getParameter("usuarioAlta"), request.getParameter("passwordAlta"),
				request.getParameter("emailAlta"));

		/** 2- Insertar usuario en la base de datos */
		boolean bRes = Controller.insertarUsuario(usuario);

		/** 3- Nos lleva a la pagina de home **/
		if (bRes) {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			response.sendRedirect("home.jsp");
			out.close();
		} else {
			mostrarError(response);
		}
		}
	}

	
	 /**
	 * MÉTODO LOGINUSUARIO: Permite iniciar sesion a los usuarios contenidos en la BBDD
	 * @param request
	 * @param response
	 * @throws Exception
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void loginUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession sesion = request.getSession();

		boolean correcto = false;
		boolean correo = false;
		boolean paswword = false;

		//Recogemos los datos introducidos por el usuario
		String sEmail = request.getParameter("emailInicio");
		String sPwd = request.getParameter("passwordInicio");
		PrintWriter out = response.getWriter();

		//Llamamos al metodo getUsuario y guardamos la lista que nos retorna
		LinkedList<Usuarios> listaUsuarios = Controller.getUsuarios();

		int i = 0;
		//BUCLE WHILE - Recorremos la lista y buscamos si el usuario existe y Comprobamos que la contraseña introducida correspone al usuario
		while ((!correcto) && (i < listaUsuarios.size())) {
			correo = false;
			paswword = false;
			
			//BUCLE IF - Si coincide email y password y además no hay sesión iniciada
			if ((listaUsuarios.get(i).getCorreo().equals(sEmail)) && (listaUsuarios.get(i).getPassword().equals(sPwd)) && (sesion.getAttribute("emailInicio") == null)) {
				correcto = true;

				//Creamos el objeto usuario con los datos de la BBDD del usuario que ha iniciado la sesion
				Usuarios objUsuario = listaUsuarios.get(i);

				//Le asignamos la sesion
				sesion.setAttribute("objUsuario", objUsuario);

				//Le redirigimos a home
				response.sendRedirect("home.jsp");

			} else if (!(listaUsuarios.get(i).getCorreo().equals(sEmail))) {
				correo = true;
			} else if (!(listaUsuarios.get(i).getPassword().equals(sPwd))) {
				paswword = true;
			}
			i++;
		}

		//BUCLE IF - Si el correo o la contraseña no son correctas le redirigimos a IndexError
		if (correo == true || paswword == true) {
			response.sendRedirect("indexError.html");
		}
		out.close();
	}

	

	/**
	 * MÉTODO CERRARSESION: Cierra la sesion del usuario que esta iniciado cuando le damos al boton de cerrar sesion
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void cerrarSesion(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession sesion = request.getSession();

		sesion.removeAttribute("emailInicio");
		response.sendRedirect("index.html");

	}



	/**
	 * MÉTODO ALTATITULO: (administrador)
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void altaTitulo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** 1- recogida de datos */
		String tituloIntroducido = request.getParameter("nombreTitulo");
		String fecha_estrenoIntroducido = request.getParameter("fecha_estrenoTitulo");
		String generoIntroducido = request.getParameter("generoTitulo");
		String temporadasIntroducido = request.getParameter("temporadasTitulo");
		String sinopsisIntroducido = request.getParameter("sinopsisTitulo");
		String tipoIntroducido = request.getParameter("tipoTitulo");
		String imagenIntroducido = request.getParameter("imagenTitulo");
		String linkIntroducido = request.getParameter("linkTitulo");

		Titulos titulo = new Titulos(tituloIntroducido, generoIntroducido, sinopsisIntroducido,
				fecha_estrenoIntroducido, imagenIntroducido, temporadasIntroducido, tipoIntroducido, linkIntroducido);

		/** 2- Insertar titulo en la base de datos */
		boolean bRes = Controller.insertarTitulo(titulo);

		/** 3- Redirigir a la pagina de home */
		if (bRes) {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			response.sendRedirect("home.jsp");
			out.close();

		} else {
			mostrarError(response);
		}
	}


	/**
	 * MÉTODO MOSTRAR ERROR: Nos avisa de que en alguno de los metodos algo ha ido mal
	 * @param response
	 * @throws IOException
	 */
	private static void mostrarError(HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<HTML>\n" + "<HEAD><TITLE>Página de JAGD</TITLE>" + "  <meta charset=\"utf-8\">\r\n"
				+ "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n"
				+ "  <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n"
				+ "  <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n"
				+ "</HEAD>\n" + "<BODY>\n" + "<div class=\"container mt-3\">\n"
				+ "<h1 class=\"text-danger\">Error interno<h1>\n"
				+ "<img src=\"img/error.jpg\" class=\"rounded\" alt=\"error interno\">" + "</div></BODY></HTML>");
		out.close();
	}
}
