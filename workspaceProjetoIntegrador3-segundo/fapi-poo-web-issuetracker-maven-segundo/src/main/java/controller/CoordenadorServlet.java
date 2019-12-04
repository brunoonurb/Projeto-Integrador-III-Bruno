package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.CoordenadorBusinessService;
import model.EdicaoTicket;
import model.Resposta;
import model.Ticket;
import model.Usuario;
import util.GerarDataHora;

/**
 * Servlet implementation class CoordenadorServlet
 */
@WebServlet("/HomeCoordenadorServlet")
public class CoordenadorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CoordenadorBusinessService coordenadorBusinessService = new CoordenadorBusinessService();
	private GerarDataHora gerarDataHora = new GerarDataHora();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CoordenadorServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> info = new ArrayList<String>();
		acao = request.getParameter("acao");

		
		if ("editarRespostaTicketGet".equalsIgnoreCase(acao)) {

			String resposta = request.getParameter("respostaEditada");

			String idUsuario = request.getParameter("idUsuario");
			String nomeUsuario = request.getParameter("nomeUsuario");
			String sobrenomeUsuario = request.getParameter("sobrenomeUsuario");
			String nivelUsuario = request.getParameter("nivelUsuario");
			String idResposta = request.getParameter("idResposta");
			String hora = gerarDataHora.horaString();
			String data = gerarDataHora.dataString();

			EdicaoTicket edicaoTicket = new EdicaoTicket();
			edicaoTicket.setIdResposta(Integer.parseInt(idResposta));
			edicaoTicket.setEdicaoIdUsuario(Integer.parseInt(idUsuario));
			edicaoTicket.setEdicaoNomeUsuario(nomeUsuario);
			edicaoTicket.setEdicaoSobrenomeUsuario(sobrenomeUsuario);
			edicaoTicket.setEdicaoNivelUsuario(nivelUsuario);
			edicaoTicket.setEdicaoData(data);
			edicaoTicket.setEdicaoHora(hora);

			// System.out.println("ID = "+idUsuario);
			// System.out.println("NOME = "+nomeUsuario);
			// System.out.println("NIVEL = "+nivelUsuario);
			// System.out.println("RESPOSTA = "+resposta);
			// System.out.println("ID TICKET = "+idResposta);
			coordenadorBusinessService.editaResposta(edicaoTicket, resposta);

			response.sendRedirect(
					"/fapi-poo-web-issuetracker-maven/coordenador/sucesso/edicaoTicketSucesso.html?descricao=Editou Ticket");

		}
		
		
		
		if ("atribuirTecnico".equalsIgnoreCase(acao)) {
			String idTecnico = request.getParameter("idTecnico");
			String idTicket = request.getParameter("idTicket");
			// System.out.println("Id do tecnico é = "+idTecnico+" e o id do ticket é =
			// "+idTicket);
			// texto ="Sai da servlet e voltei para o ajax";
			// response.setContentType("text/html;charset=UTF-8");
			// response.getWriter().write(texto);
			coordenadorBusinessService.atribuiTecnico(idTecnico, idTicket);
			return;
		}

		if ("paginaEditarSupervisor".equalsIgnoreCase(acao)) {
			String id = request.getParameter("id");
			Usuario usuario = new Usuario();
			usuario = coordenadorBusinessService.buscaSupervisor(id);
			if (usuario != null) {
				request.setAttribute("supervisor", usuario);
				request.getRequestDispatcher("coordenador/edicaoSupervisor.jsp").forward(request, response);
			}
		}

		if ("listarTicketsAtribuidos".equalsIgnoreCase(acao)) {
			List<Ticket> tickets = new ArrayList<Ticket>();
			tickets = coordenadorBusinessService.buscaTickets();

			List<Usuario> tecnicos = new ArrayList<Usuario>();
			tecnicos = coordenadorBusinessService.buscaTecnicos();

			List<Resposta> respostas = new ArrayList<Resposta>();
			respostas = coordenadorBusinessService.buscaRespostas();

			List<EdicaoTicket> edicoesTickets = new ArrayList<EdicaoTicket>();
			edicoesTickets = coordenadorBusinessService.buscaEdicoesTickets();

			request.setAttribute("respostas", respostas);
			request.setAttribute("tickets", tickets);
			request.setAttribute("tecnicos", tecnicos);
			request.setAttribute("edicoes", edicoesTickets);
			request.getRequestDispatcher("coordenador/administracaoTickets.jsp").forward(request, response);
		}

		if ("atualizarSupervisor".equalsIgnoreCase(acao)) {
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String sobrenome = request.getParameter("sobrenome");
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			String nivel = request.getParameter("nivel");
			String status = request.getParameter("status");

			Usuario usuario = new Usuario();
			usuario.setId(Integer.parseInt(id));
			usuario.setNome(nome);
			usuario.setSobrenome(sobrenome);
			usuario.setEmail(email);
			usuario.setSenha(senha);
			usuario.setNivel(nivel);
			usuario.setStatus(Integer.parseInt(status));

			int resposta = coordenadorBusinessService.atualizaSupervisor(usuario);

			if (resposta == 1) {
				response.sendRedirect(
						"/fapi-poo-web-issuetracker-maven/coordenador/sucesso/edicaoSucesso.html?descricao=Editou supervisor");
			} else {
				response.sendRedirect("/fapi-poo-web-issuetracker-maven/coordenador/erro/edicaoErro.html");
			}

		}

		if ("listarTecnicos".equalsIgnoreCase(acao)) {
			List<Usuario> tecnicos = new ArrayList<Usuario>();
			tecnicos = coordenadorBusinessService.buscaTecnicos();
			request.setAttribute("tecnicos", tecnicos);
			request.getRequestDispatcher("coordenador/administracaoTecnicos.jsp").forward(request, response);
		}
		
		if ("listarCoordenadores".equalsIgnoreCase(acao)) {
			List<Usuario> coordenadores = new ArrayList<Usuario>();
			coordenadores = coordenadorBusinessService.buscaCoordenadores();
			request.setAttribute("coordenadores", coordenadores);
			request.getRequestDispatcher("coordenador/administracaoCoordenadores.jsp").forward(request, response);
		}

		if ("listarSupervisores".equalsIgnoreCase(acao)) {
//Fluxo erro e sucesso faltando
			List<Usuario> supervisores = new ArrayList<Usuario>();
			supervisores = coordenadorBusinessService.buscaSupervisores();
			request.setAttribute("supervisores", supervisores);
			request.getRequestDispatcher("coordenador/administracaoSupervisores.jsp").forward(request, response);
		}

		if ("excluirSupervisor".equalsIgnoreCase(acao)) {
			String id = request.getParameter("id");
			boolean resposta = coordenadorBusinessService.excluiSupervisor(id);
			if (!resposta) {
				response.sendRedirect(
						"/fapi-poo-web-issuetracker-maven/coordenador/sucesso/exclusaoSucesso.html?descricao=Excluiu supervisor");
			} else {
				response.sendRedirect("/fapi-poo-web-issuetracker-maven/coordenador/erro/exclusaoErro.html");

			}
		}

		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	String acao = "";
	String cor = "";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> info = new ArrayList<String>();
		acao = request.getParameter("acao");

		if ("editarRespostaTicket".equalsIgnoreCase(acao)) {

			String resposta = request.getParameter("respostaEditada");

			String idUsuario = request.getParameter("idUsuario");
			String nomeUsuario = request.getParameter("nomeUsuario");
			String sobrenomeUsuario = request.getParameter("sobrenomeUsuario");
			String nivelUsuario = request.getParameter("nivelUsuario");
			String idResposta = request.getParameter("idResposta");
			String hora = gerarDataHora.horaString();
			String data = gerarDataHora.dataString();

			EdicaoTicket edicaoTicket = new EdicaoTicket();
			edicaoTicket.setIdResposta(Integer.parseInt(idResposta));
			edicaoTicket.setEdicaoIdUsuario(Integer.parseInt(idUsuario));
			edicaoTicket.setEdicaoNomeUsuario(nomeUsuario);
			edicaoTicket.setEdicaoSobrenomeUsuario(sobrenomeUsuario);
			edicaoTicket.setEdicaoNivelUsuario(nivelUsuario);
			edicaoTicket.setEdicaoData(data);
			edicaoTicket.setEdicaoHora(hora);

			// System.out.println("ID = "+idUsuario);
			// System.out.println("NOME = "+nomeUsuario);
			// System.out.println("NIVEL = "+nivelUsuario);
			// System.out.println("RESPOSTA = "+resposta);
			// System.out.println("ID TICKET = "+idResposta);
			coordenadorBusinessService.editaResposta(edicaoTicket, resposta);

			response.sendRedirect(
					"/fapi-poo-web-issuetracker-maven/coordenador/sucesso/edicaoTicketSucesso.html?descricao=Editou Ticket");

		}

		if ("cadastrarSupervisor".equalsIgnoreCase(acao)) {

			String nome = request.getParameter("nome");
			String sobrenome = request.getParameter("sobrenome");
			String email = request.getParameter("email");
			String senha = "12345";
			String nivel = "supervisor";
			int status = 99;
			Usuario usuario = new Usuario();
			usuario.setNome(nome);
			usuario.setSobrenome(sobrenome);
			usuario.setEmail(email);
			usuario.setSenha(senha);
			usuario.setNivel(nivel);
			usuario.setStatus(status);
			int resposta = coordenadorBusinessService.cadastraCoordenador(usuario);

			if (resposta == 1) {
				response.sendRedirect(
						"/fapi-poo-web-issuetracker-maven/coordenador/sucesso/cadastroSucesso.html?descricao=Cadastrou supervisor");
			} else {
				System.out.println("Deu erro cadastro supervisor");
				info.add("<strong>ERRO!</strong> Não foi possivel cadastrar supervisor");
				cor = "alert-danger";
				request.setAttribute("cor", cor);
				request.setAttribute("infos", info);
				request.getRequestDispatcher("../paginaInfo/paginaInfo.jsp").forward(request, response);
			}

		}

		doGet(request, response);
	}

}
