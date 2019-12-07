package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.UsuarioBusinessService;
import model.Usuario;

/**
 * Servlet implementation class UsuarioServlet
 */
@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioBusinessService usuarioBusinessService = new UsuarioBusinessService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsuarioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	String acao = "";
	String cor = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		acao = request.getParameter("acao");

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> info = new ArrayList<String>();
		acao = request.getParameter("acao");

		if ("cadastrarNovaSenha".equalsIgnoreCase(acao)) {
			HttpSession session = request.getSession(false);
			String novaSenha = request.getParameter("novaSenha");
			String id = request.getParameter("id");
			int resposta = usuarioBusinessService.alterarSenha(novaSenha, Integer.parseInt(id));
			if (resposta == 1) {
				info.add("<strong>SUCESSO!</strong> Senha alterada");
				cor = "alert-success";
				request.setAttribute("cor", cor);
				request.setAttribute("infos", info);
				request.getRequestDispatcher("paginaInfo/paginaInfo.jsp").forward(request, response);
			} else {
				info.add("<strong>ERRO!</strong> Não foi possivel alterar senha");
				cor = "alert-danger";
				request.setAttribute("cor", cor);
				request.setAttribute("infos", info);
				request.getRequestDispatcher("paginaInfo/paginaInfo.jsp").forward(request, response);
			}

		}

		if ("cadastrarUsuario".equalsIgnoreCase(acao)) {
			// System.out.println("Passou pelo cadastro usuario POST");

			String nome = request.getParameter("nome");
			String sobrenome = request.getParameter("sobrenome");
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			// LOGICA PROVISORIA PARA VERIFICAR NIVEIS
			String nivel = "";
			if (senha.equalsIgnoreCase("coordenador")) {
				nivel = "coordenador";
			} else if (senha.equalsIgnoreCase("supervisor")) {
				nivel = "supervisor";
			} else if (senha.equalsIgnoreCase("tecnico")) {
				nivel = "tecnico";
			} else {
				nivel = "cliente";
			}
			int status = 99;
			Usuario usuario = new Usuario();
			usuario.setNome(nome);
			usuario.setSobrenome(sobrenome);
			usuario.setEmail(email);
			usuario.setSenha(senha);
			usuario.setNivel(nivel);
			usuario.setStatus(status);
			int resposta = usuarioBusinessService.cadastrarUsuario(usuario);

			if (resposta == 1) {
				response.sendRedirect(
						"/fapi-poo-web-issuetracker-maven/usuario/sucesso/cadastroSucesso.html?descricao=Cadastrou usuario");
			} else {
				response.sendRedirect("/fapi-poo-web-issuetracker-maven/usuario/erro/cadastroErro.html");
			}

		}

		if ("loginUsuario".equalsIgnoreCase(acao)) {
			request.getSession(true).invalidate();
			request.getSession(true).setAttribute("login", "N");
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			Usuario usuario = new Usuario();
			usuario = usuarioBusinessService.buscarUsuario(email, senha);

			if (usuario != null) {

				if (usuario.getId() < 1) {
					response.sendRedirect(
							"/fapi-poo-web-issuetracker-maven/usuario/erro/loginErro.html?descricao=Tentativa de login&tentativaEmail="
									+ usuario.getEmail() + "");
					return;

				} else {
					HttpSession session = request.getSession();
					session.setAttribute("usuarioLogado", "S");
					session.setMaxInactiveInterval(20 * 60);
					session.setAttribute("nivel", usuario.getNivel());
					session.setAttribute("nome", usuario.getNome());
					session.setAttribute("email", usuario.getEmail());
					session.setAttribute("sobrenome", usuario.getSobrenome());
					session.setAttribute("id", usuario.getId());
					session.setAttribute("empresa", "");
					session.setAttribute("t_re", "0");
					session.setAttribute("t_pen", "0");
					session.setAttribute("todos", "0");
					

					if (usuario.getStatus() == 99) {
						response.sendRedirect("/fapi-poo-web-issuetracker-maven/usuario/alteracaoSenha.jsp");
					} else if(usuario.getNivel().equals("cliente")){
						response.sendRedirect("/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=home&descricao=Entrou na Home");
					}else {
						response.sendRedirect("/fapi-poo-web-issuetracker-maven/" + usuario.getNivel() + "/home.jsp");
					}

				}
			} else {
				response.sendRedirect("/fapi-poo-web-issuetracker-maven/usuario/erro/loginErro.html");
			}
		}

		// doGet(request, response);
	}

}
