package dao;

import java.util.List;

import model.ResnposeHome;
import model.Resposta;
import model.Ticket;

public interface TicketsDaoInterface {

	int ciarTicket(Ticket ticket);
	int finalizarTicket(Ticket ticket);
	List<Ticket> listarTodosTickets(int idCliente);
	List<ResnposeHome> listaHome(int idCliente);
	List<Ticket> listarTicketsResolvidos(int idCliente);
	List<Ticket> listarTicketsPendentes(int idCliente);
	int adicionarResposta(Resposta resposta);
	List<Resposta> listarRespostas();
	int mudarSituacaoTicket(int statusTicket, int idTicket);
	Ticket buscarTicket(int id);
	
}
