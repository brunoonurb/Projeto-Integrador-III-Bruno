package business;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.implement.CoordenadorDaoImplement;
import dao.interfaces.CoordenadorDaoInterface;
import model.EdicaoTicket;
import model.Resposta;
import model.Ticket;
import model.Usuario;

public class CoordenadorBusinessService {
	CoordenadorDaoInterface coordenadorDao = new CoordenadorDaoImplement();

	public int cadastraCoordenador(Usuario usuario) {
		return coordenadorDao.cadastraCoordenador(usuario);
	}

	public List<Usuario> buscaSupervisores() {
		return coordenadorDao.buscaSupervisores();
	}

	public boolean excluiSupervisor(String id) {
		return coordenadorDao.excluiSupervisor(id);
	}

	public Usuario buscaSupervisor(String id) {
		return coordenadorDao.buscaSupervisor(id);
	}

	public int atualizaSupervisor(Usuario usuario) {
		return coordenadorDao.atualizaSupervisor(usuario);
	}

	public List<Ticket> buscaTickets() {
		return coordenadorDao.buscaTickets();
	}

	public List<Usuario> buscaTecnicos() {
		return coordenadorDao.buscaTecnicos();
	}

	public int atribuiTecnico(String idTecnico, String idTicket) {
		return coordenadorDao.atribuiTecnico(idTecnico, idTicket);

	}

	public List<Resposta> buscaRespostas() {
		return coordenadorDao.buscaRespostas();
	}

	public List<EdicaoTicket> buscaEdicoesTickets() {
		return coordenadorDao.buscaEdicoesTickets();
	}

	public int editaResposta(EdicaoTicket edicaoTicket, String resposta) {
		return coordenadorDao.editaResposta(edicaoTicket,resposta);
		
		
	}

	public List<Usuario> buscaCoordenadores() {
		return coordenadorDao.buscaCoordenadores();
	}
}
