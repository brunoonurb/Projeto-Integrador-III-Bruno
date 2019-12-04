package filter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import business.LogBusinessService;
import model.LogAcesso;
import model.Usuario;

/**
 * Servlet Filter implementation class AcessoFilter
 */
@WebFilter(urlPatterns = "*.jsp")
public class AcessoFilter implements Filter {
	final static Logger logger = LogManager.getLogger("Acesso");

	/**
	 * Default constructor.
	 */
	public AcessoFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String url = ((HttpServletRequest) request).getRequestURL().toString();
		String uri = ((HttpServletRequest) request).getPathInfo();
		HttpSession session = httpServletRequest.getSession();

		if ((url.equalsIgnoreCase("http://localhost:8080/fapi-poo-web-issuetracker-maven/usuario/alteracaoSenha.jsp"))
				|| (url.equalsIgnoreCase("http://localhost:8080/fapi-poo-web-issuetracker-maven/"
						+ session.getAttribute("nivel") + "/home.jsp"))) {
			if (!String.valueOf(httpServletRequest.getSession().getAttribute("login")).equalsIgnoreCase("S")) {
				SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy ");
				Date date = new Date(System.currentTimeMillis());
				String data = formato.format(date);
				SimpleDateFormat formatacao = new SimpleDateFormat("HH:mm:ss");
				Date hour = new Date(System.currentTimeMillis());
				String hora = formatacao.format(hour);
				logger.info("USUARIO: " + session.getAttribute("nome") + " - NIVEL: " + session.getAttribute("nivel")
						+ " - ID: " + session.getAttribute("id"));

				String nomeUsuario = String.valueOf(httpServletRequest.getSession().getAttribute("nome"));
				String sobrenomeUsuario = String.valueOf(httpServletRequest.getSession().getAttribute("sobrenome"));
				String nivelUsuario = String.valueOf(httpServletRequest.getSession().getAttribute("nivel"));
				String idUsuario = String.valueOf(httpServletRequest.getSession().getAttribute("id"));

				LogAcesso logAcesso = new LogAcesso();
				logAcesso.setData(data);
				logAcesso.setHora(hora);
				logAcesso.setNomeUsuario(nomeUsuario);
				logAcesso.setSobrenomeUsuario(sobrenomeUsuario);
				logAcesso.setNivelUsuario(nivelUsuario);
				logAcesso.setIdUsuario(Integer.parseInt(idUsuario));
				LogBusinessService logBusinessService = new LogBusinessService();
				logBusinessService.cadastrarLogAcesso(logAcesso);
				
				httpServletRequest.getSession().setAttribute("login", "S");
			}
		}

		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
