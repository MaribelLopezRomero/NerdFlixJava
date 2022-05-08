package com.test;

import java.util.Iterator;
import java.util.LinkedList;

import com.ies.baroja.Controller;
import com.model.Titulos;

public class TestController {

	public static void main(String[] args) {
		System.out.println("Inicio Test .... ");
		LinkedList<Titulos> listaSeries = Controller.getSeries();
		
		System.out.println("titulos= " + listaSeries);
		
		LinkedList<Titulos> listaGeneros= Controller.getGeneros();
		
		System.out.println("generos= " + listaGeneros);
		
		
		//probar que leo bien el genero 
		for (int j = 0; j < listaSeries.size(); j++) {
			
			String genero; 
			
			System.out.println(genero =  listaSeries.get(j).getGenero());
			System.out.println(genero =  listaSeries.get(j).getNombre());
			
			
		}
		
		
		//probar que leo bien el genero de la lista de genros (tiene que haber 4)
	for (int i = 0; i < listaGeneros.size(); i++) {
			
			String genero; 
			
			System.out.println(genero =  listaGeneros.get(i).getGenero());
			
			
		}
		
		 
	}

}