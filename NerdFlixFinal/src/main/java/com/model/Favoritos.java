package com.model;

public class Favoritos {
	
	/**ATRIBUTOS*/
	private String cod_usuario;
	private String cod_titulo;
	
	/**CONTRUCTOR**/
	public Favoritos(String cod_usuario, String cod_titulo) {
		super();
		this.cod_usuario = cod_usuario;
		this.cod_titulo = cod_titulo;
	}

	/**METODOS GETTER Y SETTER*/
	public String getCod_usuario() {
		return cod_usuario;
	}

	public void setCod_usuario(String cod_usuario) {
		this.cod_usuario = cod_usuario;
	}

	public String getCod_titulo() {
		return cod_titulo;
	}

	public void setCod_titulo(String cod_titulo) {
		this.cod_titulo = cod_titulo;
	}	

}