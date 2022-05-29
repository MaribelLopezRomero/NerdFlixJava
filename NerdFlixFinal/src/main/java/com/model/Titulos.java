package com.model;

public class Titulos {
	/**ATRIBUTOS*/
	private String cod_titulo;
	private String nombre;
	private String genero;
	private String sinopsis;
	private String fecha_estreno;
	private String imagen;
	private String temporadas;
	private String tipo;
	private String link;

	/**CONTRUCTOR**/
	public Titulos(String cod_titulo, String nombre, String genero, String sinopsis, String fecha_estreno, String imagen,
			String temporadas, String tipo, String link) {
		this.cod_titulo = cod_titulo;
		this.nombre = nombre;
		this.genero=genero;
		this.sinopsis = sinopsis;
		this.fecha_estreno = fecha_estreno;
		this.imagen = imagen;
		this.temporadas = temporadas;
		this.tipo = tipo;
		this.link= link;
	}
	
	/**CONTRUCTOR PARA PODER INSERTAR TITULOS**/
	public Titulos(String nombre, String genero, String sinopsis, String fecha_estreno, String imagen,
			String temporadas, String tipo, String link) {
	
		this.nombre = nombre;
		this.genero=genero;
		this.sinopsis = sinopsis;
		this.fecha_estreno = fecha_estreno;
		this.imagen = imagen;
		this.temporadas = temporadas;
		this.tipo = tipo;
		this.link= link;
	}
	

	/**CONTRUCTOR PARA GENEROS**/
	public Titulos (String genero) {
		this.genero=genero;
	}
		
	/**METODOS GETTER Y SETTER*/
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

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
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

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
	
	/**TO STRING**/
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
		sbResultado.append(",");
		sbResultado.append(link);
		
		return sbResultado.toString();
	}

}