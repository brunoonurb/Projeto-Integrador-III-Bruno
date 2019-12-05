package business;

import java.util.List;

import dao.TicketsDaoInterface;
import dao.implement.TicketsDaoImplement;
import model.ResnposeHome;
import model.Resposta;
import model.Ticket;

public class ticketsBusinessService {

	TicketsDaoInterface ticketsDao = new TicketsDaoImplement();

	public int criarticket(Ticket tickets) {
		return ticketsDao.ciarTicket(tickets);
	}
	
	public int finalizarTicket(Ticket tickets) {
		return ticketsDao.finalizarTicket(tickets);
	}

	public List<Ticket> listarTodosTickets(int idCliente) {

		return ticketsDao.listarTodosTickets(idCliente);
	}
	
	public List<ResnposeHome> listaHome(int idCliente){

		return ticketsDao.listaHome(idCliente);
	}
	

	public int adicionarResposta(Resposta resposta) {

		return ticketsDao.adicionarResposta(resposta);
	}

	public List<Resposta> listarRespostas() {

		return ticketsDao.listarRespostas();
	}
	
	public int mudarSituacaoTicket(int statusTicket, int idTicket) {

		return ticketsDao.mudarSituacaoTicket(statusTicket, idTicket);
	}
	
	public Ticket buscarTicket(int id) {
		return ticketsDao.buscarTicket(id);
	}
	
	public List<Ticket> listarTicketsResolvidos(int idCliente) {

		return ticketsDao.listarTicketsResolvidos(idCliente);
	}
	
	public List<Ticket> listarTicketsPendentes(int idCliente) {

		return ticketsDao.listarTicketsPendentes(idCliente);
	}

}
