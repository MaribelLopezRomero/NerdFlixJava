package com.ies.baroja;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.bbdd.ConexionBBDD;
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

public class Controller {

	private static String sConsultaSeries = "select * from titulos where tipo ='s';";
	private static String sConsultaTitulos = "select * from titulos;";
	private static String sConsultaPeliculas = "select * from titulos where tipo ='p';";
	private static String sConsultaFavoritos = "select * from favoritos;";
	private static String sConsultaGenero = "select genero from titulos group by genero;";
	private static String sConsultaUsuario = "select * from usuarios;";
	
	

	/**
	 * MÉTODO getSeries(): trae de la BBDD las series 
	 * @return
	 */
	public static LinkedList<Titulos> getSeries() {
	
		// Objeto con la lista de los titulos que sean series
		LinkedList<Titulos> listaSeries = new LinkedList<Titulos>();
		
		// Objeto conexion
		ConexionBBDD miConn = new ConexionBBDD();
		
			try {
				miConn.conectar();
				
				//Lanzamos la consulta a BBDD y la guardamos
				ResultSet rsResultado = miConn.ejecutarConsulta(sConsultaSeries);
				
				if (rsResultado != null) {
					while (rsResultado.next()) {
					
					// getString (campos de la tabla)
					Titulos serie = new Titulos(rsResultado.getString("cod_titulo"), rsResultado.getString("nombre"),
					rsResultado.getString("genero"), rsResultado.getString("sinopsis"),
					rsResultado.getString("fecha_estreno"), rsResultado.getString("imagen"),
					rsResultado.getString("temporadas"), rsResultado.getString("tipo"),
					rsResultado.getString("link"));
					
					listaSeries.add(serie);
					}
				
				} else {
					System.out.println("Error... no hay datos");
				}
				
				miConn.desconectar();
			
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			} finally {
				miConn.desconectar();
			}
		return listaSeries;
	}

	
	
	/**
	 * MÉTODO getTitulos(): trae de la BBDD los titulos 
	 * @return
	 */
	public static LinkedList<Titulos> getTitulos() {
		// Objeto con la lista de los titulos que sean series
		LinkedList<Titulos> listaTitulos = new LinkedList<Titulos>();
		
		// Objeto conexion
		ConexionBBDD miConn = new ConexionBBDD();
		
		try {
			miConn.conectar();
			
			// Lanzamos la consulta a BBDD y la guardamos
			ResultSet rsResultado = miConn.ejecutarConsulta(sConsultaTitulos);
			
			if (rsResultado != null) {
				while (rsResultado.next()) {
				// getString (campos de la tabla)
				Titulos serie = new Titulos(rsResultado.getString("cod_titulo"), rsResultado.getString("nombre"),
				rsResultado.getString("genero"), rsResultado.getString("sinopsis"),
				rsResultado.getString("fecha_estreno"), rsResultado.getString("imagen"),
				rsResultado.getString("temporadas"), rsResultado.getString("tipo"),
				rsResultado.getString("link"));
				
				listaTitulos.add(serie);
				}
			
			} else {
				System.out.println("Error... no hay datos");
			}
			
			miConn.desconectar();
		
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		} finally {
			miConn.desconectar();
		}
		return listaTitulos;
	
	}

	public static LinkedList<Titulos> getPeliculas() {
	
	// Objeto con la lista de los titulos que sean series
	
	LinkedList<Titulos> listaPeliculas = new LinkedList<Titulos>();
	
	// Objeto conexion
	ConexionBBDD miConn = new ConexionBBDD();
	
	try {
	miConn.conectar();
	
	// Lanzamos la consulta a BBDD y la guardamos
	ResultSet rsResultado = miConn.ejecutarConsulta(sConsultaPeliculas);
	
	if (rsResultado != null) {
	while (rsResultado.next()) {
	
	// getString (campos de la tabla)
	
	Titulos serie = new Titulos(rsResultado.getString("cod_titulo"), rsResultado.getString("nombre"),
	rsResultado.getString("genero"), rsResultado.getString("sinopsis"),
	rsResultado.getString("fecha_estreno"), rsResultado.getString("imagen"),
	rsResultado.getString("temporadas"), rsResultado.getString("tipo"),
	rsResultado.getString("link"));
	
	listaPeliculas.add(serie);
	}
	
	} else {
	System.out.println("Error... no hay datos");
	}
	
	miConn.desconectar();
	
	} catch (SQLException sqlex) {
	// TODO: handle exception
	sqlex.printStackTrace();
	} finally {
	miConn.desconectar();
	}
	
	return listaPeliculas;
	
	}

	public static LinkedList<Favoritos> getFavoritos() {
	// Objeto con la lista de los titulos que sean favoritos
	LinkedList<Favoritos> listaFavoritos = new LinkedList<Favoritos>();
	
	// Objeto conexion
	ConexionBBDD miConn = new ConexionBBDD();
	
	try {
		miConn.conectar();
	
		// Lanzamos la consulta a BBDD y la guardamos
		ResultSet rsResultado = miConn.ejecutarConsulta(sConsultaFavoritos);
		
		if (rsResultado != null) {
			while (rsResultado.next()) {
			
			// getString (campos de la tabla)
			
			Favoritos favorito = new Favoritos(rsResultado.getString("cod_usuario"), rsResultado.getString("cod_titulo"));
			
			listaFavoritos.add(favorito);
			}
		
		} else {
			System.out.println("Error... no hay datos");
		}
		
		miConn.desconectar();
	
	} catch (SQLException sqlex) {
		sqlex.printStackTrace();
	} finally {
		miConn.desconectar();
	}
	
	return listaFavoritos;
	
	}

	/**
	 * MÉTODO getFavoritosVer(): trae de la BBDD las favoritos 
	 * @return
	 */
	public static LinkedList<Titulos> getFavoritosVer(String codUsu) {
	
		// Objeto con la lista de los titulos que sean favoritos
		LinkedList<Titulos> listaFavoritos = new LinkedList<Titulos>();
		
		// Objeto conexion
		ConexionBBDD miConn = new ConexionBBDD();
		
		try {
			miConn.conectar();
			
			// Lanzamos la consulta a BBDD y la guardamos
			String sConsultarFavoritosVer = "select t.cod_titulo, nombre, genero, sinopsis, fecha_estreno, imagen, temporadas, tipo,  link from titulos t, favoritos f WHERE f.cod_titulo = t.cod_titulo and cod_usuario="+codUsu+";";
			ResultSet rsResultado = miConn.ejecutarConsulta(sConsultarFavoritosVer);
			
			if (rsResultado != null) {
				while (rsResultado.next()) {
				// getString (campos de la tabla)
				Titulos favorito = new Titulos(rsResultado.getString("cod_titulo"), rsResultado.getString("nombre"),
				rsResultado.getString("genero"), rsResultado.getString("sinopsis"),
				rsResultado.getString("fecha_estreno"), rsResultado.getString("imagen"),
				rsResultado.getString("temporadas"), rsResultado.getString("tipo"),
				rsResultado.getString("link"));
				
				listaFavoritos.add(favorito);
				}
			
			} else {
				System.out.println("Error... no hay datos");
			}
			miConn.desconectar();
			
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		} finally {
			miConn.desconectar();
		}
		return listaFavoritos;
	}




	/**
	 * MÉTODO getGeneros(): trae de la BBDD los géneros
	 * @return
	 */
	public static LinkedList<Titulos> getGeneros() {
		
		// Objeto con la lista de los titulos que sean series
		LinkedList<Titulos> listaGeneros = new LinkedList<Titulos>();
		
		// Objeto conexion
		ConexionBBDD miConn = new ConexionBBDD();
		
		try {
			miConn.conectar();
			
			// Lanzamos la consulta a BBDD y la guardamos
			ResultSet rsResultado = miConn.ejecutarConsulta(sConsultaGenero);
			
			if (rsResultado != null) {
				while (rsResultado.next()) {
				// getString (campos de la tabla)
				Titulos genero = new Titulos(rsResultado.getString("genero"));
				
				listaGeneros.add(genero);
				}
			
			} else {
				System.out.println("Error... no hay datos");
			}
			
			miConn.desconectar();
			
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		} finally {
			miConn.desconectar();
		}
		
		return listaGeneros;
	
	}

	
	/**
	 * MÉTODO getUsuarios(): trae de la BBDD los usuarios
	 * @return
	 */
	public static LinkedList<Usuarios> getUsuarios() {
		// Objeto con la lista de los titulos que sean series
		LinkedList<Usuarios> listaUsuarios = new LinkedList<Usuarios>();
		
		// Objeto conexion
		ConexionBBDD miConn = new ConexionBBDD();
		
		try {
			miConn.conectar();
			
			// Lanzamos la consulta a BBDD y la guardamos
			ResultSet rsResultado = miConn.ejecutarConsulta(sConsultaUsuario);
			
			if (rsResultado != null) {
				while (rsResultado.next()) {
				// getString (campos de la tabla)
				Usuarios usuario = new Usuarios(rsResultado.getString("cod_usuario"),rsResultado.getString("nombre"), rsResultado.getString("password"), rsResultado.getString("correo"));
				
				listaUsuarios.add(usuario);
				}
			
			} else {
			System.out.println("Error... no hay datos");
			}
			
			miConn.desconectar();
		
		} catch (SQLException sqlex) {
				sqlex.printStackTrace();
		} finally {
			miConn.desconectar();
		}
		return listaUsuarios;
	}

	/**
	 * MÉTODO INSERTARUSUARIO: insertar usuario en la BBDD
	 * @param usuario
	 * @return
	 */
	public static boolean insertarUsuario(Usuarios usuario) {
	
	boolean bRes = true;
	
	/** 1.Conectamos a la base de datos **/
	ConexionBBDD miConn = new ConexionBBDD();
	
	try {
		/** 2.-Obtener conexion **/
		miConn.conectar();
		// Insertar jugador
		int iRes = miConn.insertarUsuario(usuario);
		System.out.println("Resultado de intertar usuario= " + iRes);
	
	} catch (SQLException sqlex) {
		System.out.println("Error: " + sqlex.getMessage());
		sqlex.printStackTrace();
	} finally {
		miConn.desconectar();
	}
	return bRes;
	
	}

	
	/**
	 * MÉTODO INSERTARTITULOS: insertar titulo en la BBDD
	 * @param titulo
	 * @return
	 */
	public static boolean insertarTitulo(Titulos titulo) {
		boolean bRes = true;
		/** 1.Conectamos a la base de datos **/
		ConexionBBDD miConn = new ConexionBBDD();
		
		try {
			/** 2.-Obtener conexion **/
			miConn.conectar();
			
			// Insertar titulo
			int iRes = miConn.insertarTitulo(titulo);
			System.out.println("Resultado de intertar titulo= " + iRes);
		
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConn.desconectar();
		}
		return bRes;
	}

	
	
	/**
	 * MÉTODO INSERTARFAVORITOS: insertar favoritos en la BBDD
	 * @param favoritos
	 * @return
	 */
	public static boolean insertarFavoritos(Favoritos favoritos) {
		boolean bRes = true;
		/** 1.Conectamos a la base de datos **/
		ConexionBBDD miConn = new ConexionBBDD();
		
		try {
			/** 2.-Obtener conexion **/
			miConn.conectar();
			
			// Insertar titulo
			int iRes = miConn.insertarFavoritos(favoritos);
			System.out.println("Resultado de intertar favorito= " + iRes);
		
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		
		} finally {
			miConn.desconectar();
		}
		return bRes;
	}


	/**
	 * MÉTODO ELIMINARFAVORITOS: borra favoritos en la BBDD
	 * @param favoritos
	 * @return
	 */
	public static boolean eliminarFavoritos(Favoritos favoritos) {
		boolean bRes = true;
		/** 1.Conectamos a la base de datos **/
		// Objeto conexion
		ConexionBBDD miConn = new ConexionBBDD();
		
		try {
		/** 2.-Obtener conexion **/
		miConn.conectar();
		
		// Insertar titulo
		int iRes = miConn.eliminarFavoritos(favoritos);
		System.out.println("Resultado de eliminar favorito= " + iRes);
		
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		
		} finally {
			miConn.desconectar();
		}
		return bRes;
	}

}