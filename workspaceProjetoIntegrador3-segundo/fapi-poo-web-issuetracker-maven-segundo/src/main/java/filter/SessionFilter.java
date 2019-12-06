package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.util.StringUtils;

/**
 * Servlet Filter implementation class SessionFilter
 */
@WebFilter(urlPatterns = "/*")
public class SessionFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public SessionFilter() {
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
		// TODO Auto-generated method stub
		// place your code here

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		String usuario = (String) httpServletRequest.getSession().getAttribute("usuarioLogado");

		HttpServletResponse res = (HttpServletResponse) response;


		String url = ((HttpServletRequest) request).getRequestURL().toString();
		System.out.println(url);

		if (!url.contentEquals("http://localhost:8080/fapi-poo-web-issuetracker-maven/")) {
			if (!url.contentEquals("http://localhost:8080/fapi-poo-web-issuetracker-maven/UsuarioServlet")) {
				if (!url.contentEquals("http://localhost:8080/fapi-poo-web-issuetracker-maven/LogoutServlet")) {
					if (StringUtils.isNullOrEmpty(usuario)) {
						System.out.println("\n\n\n\n-----------------" + "\n\n\n NAO esta logado\n------------------");

						res.sendRedirect("http://localhost:8080/fapi-poo-web-issuetracker-maven/");
						
							System.out.println("session expiradaaaaaaaaaaaa  ");
							//((HttpServletResponse) response).sendRedirect("/fapi-poo-web-issuetracker-maven/");

					
						System.out.println("\n\n\n\n-----------------" + "\n\n\n RETURN ag  passouuuu\n------------------");
						return;

					} else {
						System.out.println("\n\n\n\n-----------------" + "\n\n\n esta logado\n------------------");
					}
				}
			}
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
