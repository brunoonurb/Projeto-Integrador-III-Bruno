package util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

public class GerarDataHora {

	public Date date() {
		Date data = new Date();
		return data;
	}

	public String dataString() {
		SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
		String dataString = data.format(this.date());
		return dataString;
	}

	public String horaString() {
		SimpleDateFormat data = new SimpleDateFormat("HH:mm:ss");
		String dataString = data.format(this.date());
		return dataString;
	}
	public String dataHoraString() {
		SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		String dataString = data.format(this.date());
		return dataString;
	}
	public int ConverterHorasParaSegundos(String hora) {
		
		 System.out.println("gera tempo hota " + hora);
		 String[] separado = hora.split (Pattern.quote (":"));
		 String horas = separado[0];
		 String minutos = separado[1];
		 String segundos = separado[2];

		int horasInt = Integer.parseInt(horas) * 3600;
		int minutosInt = Integer.parseInt(minutos) * 60;
		int segundoInt = Integer.parseInt(segundos);
		int convertidoEmSegundos = horasInt + minutosInt + segundoInt;
		
		
		return convertidoEmSegundos;
	}
	
	public String ConverterSegundosEmHoras(int segundos) {
		
		int segundo = segundos % 60;
		int minutos = segundos / 60;
		int minuto = minutos % 60;
		int hora = minutos / 60;
		String hms = String.format ("%02d:%02d:%02d", hora, minuto, segundo);
		
		return hms;
	}
	
public String TempoCriacaoTickts(String hora) {
		
	int horaSegundo = this.ConverterHorasParaSegundos(hora);
	int novaHoraSegundos = this.ConverterHorasParaSegundos(this.horaString());
	int result = novaHoraSegundos - horaSegundo;
	
	String tempoCriacao = this.ConverterSegundosEmHoras(result);
		return tempoCriacao;
	}
	
}
