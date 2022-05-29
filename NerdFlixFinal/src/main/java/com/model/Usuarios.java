package com.model;

public class Usuarios {
	/**ATRIBUTOS*/
	protected String cod_usuario;
	protected String nombre;
	protected String password;
	protected String correo;
	protected String telefono;
	
	/**CONTRUCTOR**/
	public Usuarios(String cod_usuario, String nombre, String password, String correo) {
		super();
		this.cod_usuario = cod_usuario;
		this.nombre = nombre;
		this.password = password;
		this.correo = correo;
	}
	
	/**CONTRUCTOR**/
	public Usuarios(String nombre, String password, String correo) {
		super();
		this.nombre = nombre;
		this.password = password;
		this.correo = correo;
	}
	
	/**METODOS GETTER Y SETTER*/
	public String getCod_usuario() {
		return cod_usuario;
	}

	public void setCod_usuario(String cod_usuario) {
		this.cod_usuario = cod_usuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

}