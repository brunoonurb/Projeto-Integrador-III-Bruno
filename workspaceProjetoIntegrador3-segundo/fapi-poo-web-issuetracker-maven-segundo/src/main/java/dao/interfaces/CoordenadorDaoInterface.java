package dao.interfaces;

import java.util.List;

import model.EdicaoTicket;
import model.Resposta;
import model.Ticket;
import model.Usuario;

public interface CoordenadorDaoInterface {

	int cadastraCoordenador(Usuario usuario);

	List<Usuario> buscaSupervisores();

	boolean excluiSupervisor(String id);

	Usuario buscaSupervisor(String id);

	int atualizaSupervisor(Usuario usuario);

	List<Usuario> buscaTecnicos();

	List<Ticket> buscaTickets();

	int atribuiTecnico(String idTecnico, String idTicket);

	List<Resposta> buscaRespostas();

	List<EdicaoTicket> buscaEdicoesTickets();

	int editaResposta(EdicaoTicket edicaoTicket, String resposta);

	List<Usuario> buscaCoordenadores();

	
}
