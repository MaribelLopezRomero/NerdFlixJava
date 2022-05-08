package com.ies.baroja;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.bbdd.ConexionBBDD;
import com.model.Titulos;

public class Controller {
	
	private static String sConsulta= "select nombre, genero from titulos;";
	private static String sConsultaGenero= "select genero from titulos group by genero;";
	
	/** getSeries
	 * @return
	 * @author maribel
	 */
	public static LinkedList <Titulos> getSeries() {
		
		//Objeto con la lista de los titulos que sean series
		
		LinkedList <Titulos> listaSeries = new LinkedList<Titulos>();
		
		//Objeto conexion
		ConexionBBDD miConn = new ConexionBBDD();
		
		try {
			miConn.conectar();
			
			//Lanzamos la consulta a BBDD y la guardamos
			ResultSet rsResultado = miConn.ejecutarConsulta(sConsulta);
			
			if (rsResultado !=null) {
				while (rsResultado.next()) {
					
					//getString (campos de la tabla)
					
					Titulos serie = new Titulos(rsResultado.getString("nombre"), rsResultado.getString("genero"));
					
					listaSeries.add(serie);
				}
				
			}else {
				System.out.println("Error... no hay datos");
			}
			
			miConn.desconectar();
			
			
		} catch (SQLException sqlex) {
			// TODO: handle exception
			sqlex.printStackTrace();
		}
		finally {
			miConn.desconectar();
		}
		
		return listaSeries;
		
	}
	
	public static LinkedList <Titulos> getGeneros() {
		
		//Objeto con la lista de los titulos que sean series
		
		LinkedList <Titulos> listaGeneros = new LinkedList<Titulos>();
		
		//Objeto conexion
		ConexionBBDD miConn = new ConexionBBDD();
		
		try {
			miConn.conectar();
			
			//Lanzamos la consulta a BBDD y la guardamos
			ResultSet rsResultado = miConn.ejecutarConsulta(sConsultaGenero);
			
			if (rsResultado !=null) {
				while (rsResultado.next()) {
					
					//getString (campos de la tabla)
					
					Titulos genero = new Titulos(rsResultado.getString("genero"));
					
					listaGeneros.add(genero);
				}
				
			}else {
				System.out.println("Error... no hay datos");
			}
			
			miConn.desconectar();
			
			
		} catch (SQLException sqlex) {
			// TODO: handle exception
			sqlex.printStackTrace();
		}
		finally {
			miConn.desconectar();
		}
		
		return listaGeneros;
		
	}
	
//	public static boolean insertarJugador (Jugadores jugador) {
//		
//		boolean bRes = true;
//		
//		/**1.Conectamos a la base de datos**/
//		
//		//Objeto conexion
//		ConexionBBDD miConn = new ConexionBBDD();
//		
//		try {
//			
//			/**2Obtener conexion**/	
//			miConn.conectar();
//			//Insertar jugador
//			int iRes = miConn.insertarJugador(jugador);
//			System.out.println("Resultado de intertar jugador= "+ iRes);
//	
//		} catch (SQLException sqlex) {
//			System.out.println("Error: " + sqlex.getMessage());
//			sqlex.printStackTrace();
//		}finally {
//			miConn.desconectar();
//		}	
//		return bRes;
//		
//	}

}