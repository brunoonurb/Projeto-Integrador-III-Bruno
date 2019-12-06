package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.LogBusinessService;
import model.LogAcao;
import model.LogAcesso;

/**
 * Servlet implementation class LogServlet
 */
@WebServlet("/LogServlet")
public class LogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LogBusinessService logBusinessService = new LogBusinessService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogServlet() {
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
		List<String> info = new ArrayList<String>();
		acao = request.getParameter("acao");
		
		if ("listarLogAcesso".equalsIgnoreCase(acao)) {
			List<LogAcesso> logAcessos = new ArrayList<LogAcesso>();
			logAcessos = logBusinessService.listarLogAcessos();
			request.setAttribute("logAcessos",logAcessos);
			request.getRequestDispatcher("coordenador/logAcesso.jsp?descricao=Listou log de acessos").forward(request, response);

		}

		if ("listarLogAcao".equalsIgnoreCase(acao)) {
			List<LogAcao> logAcoes = new ArrayList<LogAcao>();
			logAcoes = logBusinessService.listarLogAcoes();
			request.setAttribute("logAcoes",logAcoes);
			request.getRequestDispatcher("coordenador/logAcao.jsp?descricao=Listou log de acoes").forward(request, response);
		}

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
