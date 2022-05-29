package com.bbdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Favoritos;
import com.model.Titulos;
import com.model.Usuarios;

/**
 * @author Alejandro Barba
 * @author Belén Cao
 * @author Mª Isabel López
 * @since 30/05/2021
 */

/**
 * Clase que centraliza los métodos de acceso a BBDD
 */
public class ConexionBBDD {
	Connection conexion;
	int port = 3306;
	String host= "localhost";
	String db  = "nerdflix";
	String user="root";
	String password="";
	
	String url = String.format("jdbc:mysql://%s:%d/%s?useSSL=false", host, port, db);
	
	/**
	 * @throws SQLException
	 */
	public void conectar() throws SQLException {
	conexion =  DriverManager.getConnection(url, user, password);
	}
	

	
	/**
	 * DESCONECTAR
	 */
	public void desconectar() {
		try {
			conexion.close();
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
		}
	}
	/**
	* EJECUTARCONSULTA: ejecutamos las consultas realizadas en BBDD
	* @param sentencia
	* @return
	*/
	
	public ResultSet ejecutarConsulta(String sentencia) {
		ResultSet rsResultado = null;
		try {
			System.out.println("Ejecutando: " + sentencia);
			PreparedStatement prepStatement = conexion.prepareStatement(sentencia);
			rsResultado = prepStatement.executeQuery();
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
		}
		return rsResultado;
	}
	
	/**
	* INSERTARJUGADOR: 
	* @param jugador
	* @return
	*/
	public int insertarUsuario (Usuarios usuario) {
		int iRes =0;
		String sInsert = "Insert into usuarios (nombre, password, correo) "+ "values (?,?,?)";
		
		try {
			System.out.println("Ejecutando " + sInsert);
			System.out.println("Datos a insertar " + usuario);
		
			//Preparamos la conexion
			PreparedStatement prepStatetement = conexion.prepareStatement(sInsert);
			
			//Llenamos los valores ?
			prepStatetement.setString(1, usuario.getNombre());
			prepStatetement.setString(2, usuario.getPassword());
			prepStatetement.setString(3, usuario.getCorreo());
			
			//Sentencia a ejecutar (Insert.....)
			iRes = prepStatetement.executeUpdate();
		
		} catch (SQLException sqlex) {
			System.out.println("Error ***" + sqlex.getMessage() );
			sqlex.printStackTrace();
		}
		
		return iRes;
	}
	
	
	/**
	 * INSERTARTITULO: insertamos en BBDD un titulo@param titulo
	 * @return
	 */
	public int insertarTitulo (Titulos titulo) {
		int iRes =0;
		String sInsert = "Insert into titulos (nombre, genero, sinopsis, fecha_estreno, imagen, temporadas, tipo, link) "+ "values (?,?,?,?,?,?,?,?)";
		
		try {
			System.out.println("Ejecutando " + sInsert);
			System.out.println("Datos a insertar " + titulo);
		
			//Preparamos la conexion
			PreparedStatement prepStatetement = conexion.prepareStatement(sInsert);
			
			//Llenamos los valores ?
			prepStatetement.setString(1, titulo.getNombre());
			prepStatetement.setString(2, titulo.getGenero());
			prepStatetement.setString(3, titulo.getSinopsis());
			prepStatetement.setString(4, titulo.getFecha_estreno());
			prepStatetement.setString(5, titulo.getImagen());
			prepStatetement.setInt(6, Integer.parseInt(titulo.getTemporadas()));
			prepStatetement.setString(7, titulo.getTipo());
			prepStatetement.setString(8, titulo.getLink());
			
			//Sentencia a ejecutar (Insert.....)
			iRes = prepStatetement.executeUpdate();
		
		} catch (SQLException sqlex) {
			System.out.println("Error ***" + sqlex.getMessage() );
			sqlex.printStackTrace();
		}
		return iRes;
	}
	
	
	
	
	/**
	 * INSERTARFAVORITOS: insertamos como favorito en la BBDD
	 * @param favorito
	 * @return
	 */
	public int insertarFavoritos (Favoritos favorito) {
		int iRes =0;
		String sInsert = "Insert into favoritos (cod_usuario, cod_titulo) "+ "values (?,?)";
		
		try {
			System.out.println("Ejecutando " + sInsert);
			System.out.println("Datos a insertar " + favorito);
			
			//Preparamos la conexion
			PreparedStatement prepStatetement = conexion.prepareStatement(sInsert);
			
			//Llenamos los valores
			prepStatetement.setInt(1, Integer.parseInt(favorito.getCod_usuario()));
			prepStatetement.setInt(2, Integer.parseInt(favorito.getCod_titulo()));
			
			//Sentencia a ejecutar (Insert.....)
			iRes = prepStatetement.executeUpdate();
		
		} catch (SQLException sqlex) {
			System.out.println("Error ***" + sqlex.getMessage() );
			sqlex.printStackTrace();
		}
		return iRes;
	}
	
	
	
	/**
	 * ELIMINARFAVORITOS:eliminamos favoritos de la BBDD
	 * @param favorito
	 * @return
	 */
	public int eliminarFavoritos (Favoritos favorito) {
		int iRes =0;
		String sDelete = "Delete from favoritos where cod_usuario = ? and cod_titulo = ?";
		
		try {
		System.out.println("Ejecutando " + sDelete);
		System.out.println("Datos a eliminar " + favorito);
		
		//Preparamos la conexion
		PreparedStatement prepStatetement = conexion.prepareStatement(sDelete);
		
		//Llenamos los valores ?
		prepStatetement.setInt(1, Integer.parseInt(favorito.getCod_usuario()));
		prepStatetement.setInt(2, Integer.parseInt(favorito.getCod_titulo()));
		
		//Sentencia a ejecutar (Insert.....)
		iRes = prepStatetement.executeUpdate();
		
		} catch (SQLException sqlex) {
			System.out.println("Error ***" + sqlex.getMessage() );
			sqlex.printStackTrace();
		}
		return iRes;
	}



}
