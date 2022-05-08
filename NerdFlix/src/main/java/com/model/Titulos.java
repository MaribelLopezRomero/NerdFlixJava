package com.model;

public class Titulos {
	
	//Atributos
	
	private String cod_titulo;
	private String nombre;
	private String sinopsis;
	private String fecha_estreno;
	private String imagen;
	private String temporadas;
	private String tipo;
	private String genero;

	//Contructor
	
	public Titulos(String cod_titulo, String nombre, String sinopsis, String fecha_estreno, String imagen,
			String temporadas, String tipo) {
		this.cod_titulo = cod_titulo;
		this.nombre = nombre;
		this.sinopsis = sinopsis;
		this.fecha_estreno = fecha_estreno;
		this.imagen = imagen;
		this.temporadas = temporadas;
		this.tipo = tipo;
	}
	
	//Constructor solo de nombre y genero para listar las series segun genero
	
	public Titulos (String nombre, String genero) {
		this.nombre= nombre;
		this.genero=genero;
	}
	
	//Constructor solo para los generos
	public Titulos (String genero) {
		this.genero=genero;
	}
	
	

	//Metodos get y set

	public String getCod_titulo() {
		return cod_titulo;
	}

	public void setCod_titulo(String cod_titulo) {
		this.cod_titulo = cod_titulo;
	}

	public String getNombre() {
		return nombre;
	}
		


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getSinopsis() {
		return sinopsis;
	}

	public void setSinopsis(String sinopsis) {
		this.sinopsis = sinopsis;
	}

	public String getFecha_estreno() {
		return fecha_estreno;
	}

	public void setFecha_estreno(String fecha_estreno) {
		this.fecha_estreno = fecha_estreno;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getTemporadas() {
		return temporadas;
	}

	public void setTemporadas(String temporadas) {
		this.temporadas = temporadas;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	
	public String toString (){
		StringBuffer sbResultado = new StringBuffer();
		sbResultado.append(nombre);
		sbResultado.append(",");
		sbResultado.append(genero);
		sbResultado.append(",");
		sbResultado.append(sinopsis);
		sbResultado.append(",");
		sbResultado.append(imagen);
		sbResultado.append(",");
		sbResultado.append(temporadas);
		sbResultado.append(",");
		sbResultado.append(sinopsis);
		sbResultado.append(",");
		sbResultado.append(fecha_estreno);
		
//		String sResultado= this.nombre + ", " + this.nombre_equipo;
//		return sResultado;
		
		return sbResultado.toString();
	}
	
	
	
	
	
	
	
	

}
