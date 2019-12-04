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
import model.LogAcao;
import util.GerarDataHora;

/**
 * Servlet Filter implementation class AcaoFilter
 */
@WebFilter(urlPatterns = "/*")
public class AcaoFilter implements Filter {
	final static Logger logger = LogManager.getLogger("Acao");

	/**
	 * Default constructor.
	 */
	public AcaoFilter() {
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
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		String url = ((HttpServletRequest) request).getRequestURL().toString();
		GerarDataHora gerarDataHora = new GerarDataHora();

		String descricao = String.valueOf(httpServletRequest.getParameter("descricao"));
		//logger.info("URL: "+url);
		if (!descricao.equalsIgnoreCase("null")) {

			HttpSession session = httpServletRequest.getSession();
			String nome = String.valueOf(session.getAttribute("nome"));
			String sobrenome = "";
			String nivel = "";
			String id = "";
			if (!nome.equalsIgnoreCase("null")) {
				nome = String.valueOf(session.getAttribute("nome"));
				sobrenome = String.valueOf(session.getAttribute("sobrenome"));
				nivel = String.valueOf(session.getAttribute("nivel"));
				id = String.valueOf(session.getAttribute("id"));
			} else {
				nome = "Nenhum";
				sobrenome="Nenhum";
				nivel = "Nenhum";
				id = "0";
			}

			SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy ");
			Date date = new Date(System.currentTimeMillis());
			String data = formato.format(date);
			SimpleDateFormat formatacao = new SimpleDateFormat("HH:mm:ss");
			Date hour = new Date(System.currentTimeMillis());
			String hora = formatacao.format(hour);
			String tentativaEmail = String.valueOf(httpServletRequest.getParameter("tentativaEmail"));
			if (!tentativaEmail.equalsIgnoreCase("null")) {
				logger.info("ACAO: " + descricao + " - TENTATIVA NO EMAIL: "+tentativaEmail+" - USUARIO: " + nome + " " + sobrenome + " - NIVEL: " + nivel + " - ID: "
						+ id);
				nome=tentativaEmail;
				sobrenome="";
				nivel="Restrito";
			}else {
			logger.info("ACAO: " + descricao + " USUARIO: " + nome + " " + sobrenome + " - NIVEL: " + nivel + " - ID: "
					+ id);
			}
		
			LogAcao logAcao = new LogAcao();
			logAcao.setHora(gerarDataHora.horaString());
			logAcao.setData(gerarDataHora.dataString());
			logAcao.setAcao(descricao);
			logAcao.setNomeUsuario(nome);
			logAcao.setSobrenomeUsuario(sobrenome);
			logAcao.setNivelUsuario(nivel);
			logAcao.setIdUsuario(Integer.parseInt(id));
			LogBusinessService logBusinessService = new LogBusinessService();
			logBusinessService.cadastrarLogAcao(logAcao);
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
