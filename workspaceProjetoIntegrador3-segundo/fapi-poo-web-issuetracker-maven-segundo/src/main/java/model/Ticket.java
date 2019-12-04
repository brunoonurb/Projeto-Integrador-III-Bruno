package model;

public class Ticket {
	
	private int id;
	private int idCliente;
	private String nomeCliente;
	private String assunto;
	private String descricao;
	private int status;
	private String linkPrint;
	private String data;
	private String hora;
	private String tempoCriacao;
	private int atribuicaoTecnico;
	//Thiago-> Bruno: Fiz um inner join e coloquei esta variavel para pegar o nome do status ou podemos colocar direto no ticket la no banco, mas inviabiliza a normalização do banco, decidimos na semana
	private String explicacao;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public String getNomeCliente() {
		return nomeCliente;
	}
	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}
	public String getAssunto() {
		return assunto;
	}
	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getLinkPrint() {
		return linkPrint;
	}
	public void setLinkPrint(String linkPrint) {
		this.linkPrint = linkPrint;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	public String getTempoCriacao() {
		return tempoCriacao;
	}
	public void setTempoCriacao(String tempoCriacao) {
		this.tempoCriacao = tempoCriacao;
	}
	public int getAtribuicaoTecnico() {
		return atribuicaoTecnico;
	}
	public void setAtribuicaoTecnico(int atribuicaoTecnico) {
		this.atribuicaoTecnico = atribuicaoTecnico;
	}
	public String getExplicacao() {
		return explicacao;
	}
	public void setExplicacao(String explicacao) {
		this.explicacao = explicacao;
	}
	@Override
	public String toString() {
		return "Ticket [id=" + id + ", idCliente=" + idCliente + ", nomeCliente=" + nomeCliente + ", assunto=" + assunto
				+ ", descricao=" + descricao + ", status=" + status + ", linkPrint=" + linkPrint + ", data=" + data
				+ ", hora=" + hora + ", tempoCriacao=" + tempoCriacao + ", atribuicaoTecnico=" + atribuicaoTecnico
				+ ", explicacao=" + explicacao + "]";
	}
	

}
