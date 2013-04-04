package sistema_reglas;

import jess.JessException;
import jess.Rete;
import jess.Value;

public class ManejadorJess {

	private final String programaFuente = "practica2.clp";
	private final Rete miRete;
	
	public ManejadorJess(){
		this.miRete = new Rete();
	}
	
	public void cargaPrograma(String rutaFichero) {
		try { Value v = miRete.batch(rutaFichero);
			System.out.println("Value " + v);
		} catch (JessException je0) {
			System.out.println("Error de lectura en " + rutaFichero);
			je0.printStackTrace();
		}
	}

	public static void main(String[] args) {
		ManejadorJess manejador = new ManejadorJess();
		manejador.cargaPrograma(manejador.programaFuente);
	}

}
