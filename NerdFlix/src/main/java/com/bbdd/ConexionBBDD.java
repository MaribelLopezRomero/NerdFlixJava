package com.bbdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Titulos;

/**
 * Clase que centraliza los m�todos de acceso a BBDD
 * 
 * @author JAGD
 * @since 27/05/2021
 */

public class ConexionBBDD {

	Connection conexion; 
	int port = 3306;
	String host= "localhost";
	String db  = "nerdflix";
	String user="root";
	String password="";

	String url = String.format("jdbc:mysql://%s:%d/%s?useSSL=false", host, port, db);

	public void conectar() throws SQLException {
		conexion =  DriverManager.getConnection(url, user, password);
	}	
	 

	public void desconectar() {
		try {
			conexion.close();
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
		}
	}
	/**
	 * ejecutar consulta
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
	 * insertarJugador
	 * @param jugador
	 * @return
	 */
	
//	public int insertarJugador (Titulos titulos) {
//		int iRes =0;
//		
//		String sInsert = "Insert into jugadores (Nombre, Procedencia, Altura, Peso, Posicion, Nombre_equipo) "+ "values (?,?,?,?,?,?)";
//		
//		try {
//			System.out.println("Ejecutando " + sInsert);
//			System.out.println("Datos a insertar " + jugador);
//			
//			//Preparamos la conexion
//			
//			PreparedStatement prepStatetement = conexion.prepareStatement(sInsert);
//			
//			//Llenamos los valores ?
//			
//			prepStatetement.setString(1, jugador.getNombre());
//			prepStatetement.setString(2, jugador.getProcedencia());
//			prepStatetement.setInt(3, Integer.parseInt(jugador.getAltura()));
//			prepStatetement.setString(4, jugador.getPeso());
//			prepStatetement.setString(5, jugador.getPosicion());
//			prepStatetement.setString(6, jugador.getNombre_equipo());
//			
//			//Sentencia a ejecutar (Insert.....)
//			iRes = prepStatetement.executeUpdate();
//			
//			
//		} catch (SQLException sqlex) {
//			System.out.println("Error ***" + sqlex.getMessage() );
//			sqlex.printStackTrace();
//		}
//		
//		return iRes;
//	}

}