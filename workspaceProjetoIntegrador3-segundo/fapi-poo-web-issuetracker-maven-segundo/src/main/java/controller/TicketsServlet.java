package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.util.StringUtils;

import business.ticketsBusinessService;
import model.ResnposeHome;
import model.ResnposeHome2;
import model.Resposta;
import model.Ticket;
import util.GerarDataHora;

/**
 * Servlet implementation class TicketsServlet
 */
@WebServlet("/TicketsServlet")

public class TicketsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ticketsBusinessService ticketsBusinessService = new ticketsBusinessService();
	private GerarDataHora gerarDataHora = new GerarDataHora();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TicketsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	String acao = "";
	boolean paginaInfo = false;
	String cor = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> info = new ArrayList<String>();
		// TODO Auto-generated method stub
		acao = request.getParameter("acao");
		//
		if  (StringUtils.isNullOrEmpty((String) request.getSession().getAttribute("nome"))) {
			System.out.println("session expiradaaaaaaaaaaaa index ");
			response.sendRedirect("index.jsp");
			//request.getRequestDispatcher("/fapi-poo-web-issuetracker-maven/");
			return;
		} else {
			System.out.println("esta ok");
		}
		
		String nomeUsuario = (String) request.getSession().getAttribute("nome");
		int idusuario = (int) request.getSession().getAttribute("id");
		String empresa = "";
		int t_pen=0;
		int t_re=0;
		int todos=0;
		
		
		

		if ("home".equalsIgnoreCase(acao)) {
			System.out.println("home");

			List<ResnposeHome> responseHomes = ticketsBusinessService.listaHome(idusuario);
			List<ResnposeHome2> responseHomes2 = ticketsBusinessService.listaHome2(idusuario);
			if (responseHomes2 != null) {
				for (ResnposeHome2 res2 : responseHomes2) {
					System.out.println("id respot re " + res2.getT_resolvido());
					empresa = res2.getNome_empresa(); 
					t_pen = res2.getT_pendente();
					t_re = res2.getT_resolvido();
					todos = res2.getTodos();
				}
				request.getSession().setAttribute("empresa", empresa);
				request.getSession().setAttribute("t_pen", t_pen);
				request.getSession().setAttribute("t-re", t_re);
				request.getSession().setAttribute("todos", todos);
				
				request.setAttribute("home", "Home");
				request.setAttribute("responseHomes2", responseHomes2);
				request.setAttribute("responseHomes", responseHomes);
				request.getRequestDispatcher("cliente/home.jsp").forward(request, response);
			} else {
				// talvez nao seja necessario essa pagina de erro
				info.add("<strong>ERRO!</strong> buscar dados da home");
				cor = "alert-danger";
				paginaInfo = true;
			}
		} else if ("listarTodosTickets".equalsIgnoreCase(acao)) {
			System.out.println("listarTodosTickets");

			List<Ticket> tickets = ticketsBusinessService.listarTodosTickets(idusuario);
			List<Resposta> respostas = ticketsBusinessService.listarRespostas();
			if (tickets != null) {
				for (Resposta resposta : respostas) {
					System.out.println("id tickst " + resposta.getIdTicket());
				}
				request.setAttribute("pagina", "Todos os Tickets");
				request.setAttribute("respostas", respostas);
				request.setAttribute("tickets", tickets);
				request.getRequestDispatcher("cliente/todosTic.jsp").forward(request, response);
			} else {
				// talvez nao seja necessario essa pagina de erro
				info.add("<strong>ERRO!</strong> nao foi possivel acessar todos os tickets");
				cor = "alert-danger";
				paginaInfo = true;
			}
		} else if ("listarTicketsResolvidos".equalsIgnoreCase(acao)) {
			System.out.println("listarTickets Resolvidos");
			List<Ticket> tickets = ticketsBusinessService.listarTicketsResolvidos(idusuario);
			List<Resposta> respostas = ticketsBusinessService.listarRespostas();
			if (tickets != null) {
				for (Ticket ticket : tickets) {
					System.out.println("id tickst resolvidos " + ticket.getId());
				}
				
				request.setAttribute("pagina", "Tickets Resolvidos");
				request.setAttribute("respostas", respostas);
				request.setAttribute("tickets", tickets);
				request.getRequestDispatcher("cliente/todosTic.jsp").forward(request, response);
			} else {
				// talcez nao seja necessario essa pagina de erro
				info.add("<strong>ERRO!</strong> nao foi possivel acessar os tickets resolvidos");
				cor = "alert-danger";
				paginaInfo = true;
			}
		} else if ("listarTicketsPendentes".equalsIgnoreCase(acao)) {
			System.out.println("listar pendentes");
			List<Ticket> tickets = ticketsBusinessService.listarTicketsPendentes(idusuario);
			List<Resposta> respostas = ticketsBusinessService.listarRespostas();
			if (tickets != null) {
				request.setAttribute("pagina", "Tickets Pendentes");
				request.setAttribute("respostas", respostas);
				request.setAttribute("tickets", tickets);
				request.getRequestDispatcher("cliente/todosTic.jsp").forward(request, response);
			} else {
				// talcez nao seja necessario essa pagina de erro
				info.add("<strong>ERRO!</strong> nao foi possivel acessar os tickets pendentes");
				cor = "alert-danger";
				request.setAttribute("cor", cor);
				paginaInfo = true;
			}
		} else if ("home".equalsIgnoreCase(acao)) {
			request.getRequestDispatcher("cliente/home.jsp").forward(request, response);
		} else if ("novoTicket".equalsIgnoreCase(acao)) {

			Ticket ticket = new Ticket();
			ticket.setIdCliente(idusuario);
			ticket.setNomeCliente(nomeUsuario);
			ticket.setStatus(1);// situacao de ticket/NOVO
			ticket.setData(gerarDataHora.dataString());
			ticket.setHora(gerarDataHora.horaString());

			int resposta = ticketsBusinessService.criarticket(ticket);

			if (resposta != 0) {
				request.setAttribute("idTicket", resposta);
				request.getRequestDispatcher("cliente/novoTicket.jsp").forward(request, response);
			} else {
				info.add("<strong>ERRO!</strong>  Nao foi possivel acessar essa pagina no momento");
				cor = "alert-danger";
				request.setAttribute("cor", cor);
				request.setAttribute("infos", info);
				request.getRequestDispatcher("cliente/paginaInfo.jsp").forward(request, response);
			}

		} else if ("finalizarTicket".equalsIgnoreCase(acao)) {
			System.out.println("FINALIZAR Tickets");
			String idTicket = request.getParameter("idTicket");
			int resultado = ticketsBusinessService.mudarSituacaoTicket(8, Integer.parseInt(idTicket));
			if (resultado != 0) {
				List<Ticket> tickets = ticketsBusinessService.listarTodosTickets(idusuario);
				List<Resposta> respostas = ticketsBusinessService.listarRespostas();
				if (tickets != null) {
					request.setAttribute("pagina", "Todos os Tickets");
					request.setAttribute("respostas", respostas);
					request.setAttribute("tickets", tickets);
					request.getRequestDispatcher("cliente/todosTic.jsp").forward(request, response);
				} else {
					info.add("<strong>ERRO!</strong> FALHA TEMPORARIA!");
					cor = "alert-danger";
					paginaInfo = true;
				}
			} else {
				info.add("<strong>ERRO!</strong> Nao foi possivel FINALIZAR esse ticket no momento!");
				cor = "alert-danger";
				paginaInfo = true;
			}
		} else if ("reabrirTicket".equalsIgnoreCase(acao)) {
			System.out.println("REABrIR Tickets");
			String idTicket = request.getParameter("idTicket");
			int resultado = ticketsBusinessService.mudarSituacaoTicket(9, Integer.parseInt(idTicket));

			if (resultado != 0) {
				List<Ticket> tickets = ticketsBusinessService.listarTodosTickets(idusuario);
				List<Resposta> respostas = ticketsBusinessService.listarRespostas();
				if (tickets != null) {
					request.setAttribute("pagina", "Todos os Tickets");
					request.setAttribute("respostas", respostas);
					request.setAttribute("tickets", tickets);
					request.getRequestDispatcher("cliente/todosTic.jsp").forward(request, response);
				} else {
					// talvez nao seja necessario essa pagina de erro
					info.add("<strong>ERRO!</strong> FALHA TEMPORARIA!");
					cor = "alert-danger";
					paginaInfo = true;
				}
			} else {
				info.add("<strong>ERRO!</strong> Nao foi possivel REABRIR esse ticket no momento!");
				cor = "alert-danger";
				paginaInfo = true;
			}
		}
		if (paginaInfo) {
			request.setAttribute("cor", cor);
			request.setAttribute("infos", info);
			request.getRequestDispatcher("cliente/paginaInfo.jsp").forward(request, response);
		}

		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> info = new ArrayList<String>();
		// TODO Auto-generated method stub
		acao = request.getParameter("acao");
		String nomeUsuario = (String) request.getSession().getAttribute("nome");
		if (StringUtils.isNullOrEmpty(nomeUsuario)) {
			System.out.println("session expiradaaaaaaaaaaaa  ");
			response.sendRedirect("/fapi-poo-web-issuetracker-maven/index.jsp");
			return;
		} else {
			System.out.println("esta ok");
		}

		if ("cadastrarTickets".equalsIgnoreCase(acao)) {
			// System.out.println("Passou pelo cadastro usuario POST");

			String idTicket = request.getParameter("idTicket");
			String assunto = request.getParameter("assunto");
			String descricao = request.getParameter("relato");
			String linkPrint = request.getParameter("print");
			System.out.println(assunto);
			System.out.println(descricao);
			System.out.println(idTicket);
			// LOGICA PROVISORIA PARA VERIFICAR NIVEIS

			if (assunto.equalsIgnoreCase("")) {
				// pagina de erro
				paginaInfo = true;
				info.add("<strong>ERRO!</strong> Campo Assunto Vazio");
				System.out.println("assunto");

			}
			if (descricao.equalsIgnoreCase("")) {
				// pagina de erro
				paginaInfo = true;
				info.add("<strong>ERRO!</strong> Campo Descricao Vazio");

			}
			if (paginaInfo) {
				cor = "alert-danger";
				request.setAttribute("cor", cor);
				request.setAttribute("infos", info);
				request.getRequestDispatcher("cliente/paginaInfo.jsp").forward(request, response);
			}
			Ticket ticket = ticketsBusinessService.buscarTicket(Integer.parseInt(idTicket));
			System.out.println("\nservelet \n " + ticket.toString());
			ticket.setAssunto(assunto);
			ticket.setDescricao(descricao);
			ticket.setStatus(2);// situacao de ticket esta a analise de revisao
			ticket.setLinkPrint(linkPrint);
			ticket.setData(gerarDataHora.dataString());
			ticket.setTempoCriacao(gerarDataHora.TempoCriacaoTickts(ticket.getHora()));
			ticket.setHora(gerarDataHora.horaString());

			System.out.println("twmpo criacao  -> " + ticket.toString());

			int resposta = ticketsBusinessService.finalizarTicket(ticket);
			if (resposta == 1) {
				info.add("<strong>SUCESSO!</strong> Tickets cadastrado com sucesso");
				cor = "alert-success";
				request.setAttribute("cor", cor);
				request.setAttribute("infos", info);
				request.getRequestDispatcher("cliente/paginaInfo.jsp").forward(request, response);
			} else {
				info.add("<strong>ERRO!</strong>  Nao foi possivel gerar novo ticket");
				cor = "alert-danger";
				request.setAttribute("cor", cor);
				request.setAttribute("infos", info);
				request.getRequestDispatcher("cliente/paginaInfo.jsp").forward(request, response);
			}

		}
		if ("responderTicket".equalsIgnoreCase(acao)) {
			System.out.println("responder ticket");
			int idUsuario = (int) request.getSession().getAttribute("id");
			nomeUsuario = (String) request.getSession().getAttribute("nome");
			String nivelUsuario = (String) request.getSession().getAttribute("nivel");
			Resposta resposta = new Resposta();
			String respostaUsuario = request.getParameter("resposta");
			String idTicket = request.getParameter("idTicket");

			resposta.setIdUsuario(idUsuario);
			resposta.setNomeUsuario(nomeUsuario);
			resposta.setNivelUsuario(nivelUsuario);
			resposta.setData(gerarDataHora.dataString());
			resposta.setHora(gerarDataHora.horaString());
			resposta.setResposta(respostaUsuario);
			resposta.setIdTicket(Integer.parseInt(idTicket));

			int validarResposta = ticketsBusinessService.adicionarResposta(resposta);
			if (validarResposta == 0) {
				info.add("<strong>ERRO!</strong> Sua resposta nao foi enviada");
				cor = "alert-danger";
				request.setAttribute("cor", cor);
				request.setAttribute("infos", info);
				request.getRequestDispatcher("cliente/paginaInfo.jsp").forward(request, response);
			}
			List<Ticket> tickets = ticketsBusinessService.listarTodosTickets(idUsuario);
			List<Resposta> respostas = ticketsBusinessService.listarRespostas();
			if (tickets != null) {
				request.setAttribute("pagina", "Todos os Tickets");
				request.setAttribute("respostas", respostas);
				request.setAttribute("tickets", tickets);
				request.getRequestDispatcher("cliente/todosTic.jsp").forward(request, response);
			} else {
				// talcez nao seja necessario essa pagina de erro
				info.add("<strong>ERRO!</strong> nao foi possivel acessar os tickets");
				cor = "alert-danger";
				request.setAttribute("cor", cor);
				request.setAttribute("infos", info);
				request.getRequestDispatcher("cliente/paginaInfo.jsp").forward(request, response);
			}
		}

		doGet(request, response);
	}

}
