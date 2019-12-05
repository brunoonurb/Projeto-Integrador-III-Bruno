package model;

public class ResnposeHome {
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public int getNovo() {
		return novo;
	}
	public void setNovo(int novo) {
		this.novo = novo;
	}
	public int getFinalizado() {
		return finalizado;
	}
	public void setFinalizado(int finalizado) {
		this.finalizado = finalizado;
	}
	public int getProcesso() {
		return processo;
	}
	public void setProcesso(int processo) {
		this.processo = processo;
	}
	private String data;
	private int novo;
	private int finalizado;
	private int processo;
}
