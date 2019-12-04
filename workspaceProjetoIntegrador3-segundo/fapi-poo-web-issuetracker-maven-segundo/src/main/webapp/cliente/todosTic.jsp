<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!-- include para menu de funcionalidade -->

<jsp:include page="./topoCliente.jsp"></jsp:include>

<!-- include para menu de funcionalidade -->
<div class="col-md-9">
	<div id="teste" class="col-md-12" style="background-color: white;">
		<!---bruno------------------>
		<div class="container">
			<h2>
				<i class="fa fa-bars" aria-hidden="true"></i>
				<c:out value="${pagina }" />
			</h2>
			<p>
				<strong>Note:</strong><strong><span class="badge bg-dark"></i>
						<c:out value="${pagina }" /></span> </strong>.
			</p>

			<!-- AQUI COMECA A LINAH ATABELA -->
			<c:forEach items="${tickets}" var="ticket">
				<div class="panel-group " id="accordion">
					<div class="panel panel-warning ">
						<div class="panel-heading">
							<h6 class="panel-title ">
								<table class="table table-hover mb-0 ">
									<tr class="table">
										<td onclick="focusResposta(${ticket.id})" class="col-md-1"
											data-toggle="collapse" data-parent="#accordion"
											data-target="#<c:out value="${ticket.id}"/>">#${ticket.id}</td>
										<td class="col-md-3" data-toggle="collapse"
											data-parent="#accordion"
											data-target="#<c:out value="${ticket.id}"/>">${ticket.data}|${ticket.hora}
										</td>
										<td class="col-md-2" data-toggle="collapse"
											data-parent="#accordion"
											data-target="#<c:out value="${ticket.id}"/>"><c:if
												test="${ticket.status == 1}">
												<span class="badge bg-warning m-0"> Pendente / base
													->${ticket.status} 
											</c:if> <c:if test="${ticket.status == 2}">
												<span class="badge bg-info m-0"> Pendente Respotas /
													base ->${ticket.status} 
											</c:if> <c:if test="${ticket.status == 3}">
												<span class="badge bg-success m-0"> Resolvido / base
													->${ticket.status} 
											</c:if> </span></td>
										<td class="col-md-4" data-toggle="collapse"
											data-parent="#accordion"
											data-target="#<c:out value="${ticket.id}"/>">
											${ticket.assunto}</td>
										<td class="col-md-2"><c:if test="${ticket.status != 3}">
												<a class="btn btn-success"
													href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=finalizarTicket&idTicket=${ticket.id }">Finalizar</a>
											</c:if> <c:if test="${ticket.status == 3}">
												<a class="btn btn-danger"
													href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=reabrirTicket&idTicket=${ticket.id }">Reabrir</a>
											</c:if></td>
									</tr>
								</table>
							</h6>
						</div>
						<div id="<c:out value="${ticket.id}"/>"
							class="panel-collapse collapse">
							<div class="panel-body">
								<ul class="comment-section">
									<div class="row justify-content-center">

										<div class="row col-md-10 text-justify">
											<li class="comment user-comment">
												<div class="info">
													<a href="#">${ticket.nomeCliente} </a> <span>
														${ticket.data}</span>
												</div> <a class="avatar" href="#"> <img
													src="/fapi-poo-web-issuetracker-maven/imagens/avatar_author.jpg"
													width="35" alt="${ticket.nomeCliente}"
													title="${ticket.nomeCliente}" />
											</a>

												<h4 class="font-weight-bold">
													<b>${ticket.descricao}</b>
												</h4>
											</li>
										</div>

									</div>
									<hr style="width: 10; border-color: #7bac3b;" />
									<!-- aqui sera a tabela resposta -->
									<c:forEach items="${respostas}" var="resposta">
										<c:if test="${resposta.idTicket == ticket.id}">
											<li class="comment user-comment">
												<div class="info">
													<a href="">${resposta.nomeUsuario}</a> <span>${resposta.data}
														| ${resposta.hora} </span>
												</div> <a class="avatar" href="#"> <img
													src="/fapi-poo-web-issuetracker-maven/imagens/avatarD.jpg"
													width="35" alt="Profile Avatar" title="Anie Silverston" />
											</a>
												<p>${resposta.resposta}</p>
											</li>
										</c:if>
									</c:forEach>
								</ul>
								<form name="form${ticket.id}"
									action="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=responderTicket"
									method="post">
									<input type="hidden" value="${ticket.id}" name="idTicket">
									<div class="form-group">
										<label for="Descrição-text" class="col-form-label"><b>Responder:<b></label>
										<textarea class="form-control"
											placeholder="Digite sua resposta" id="resposta"
											name="resposta" height="500px"></textarea>
										<img
											src="/fapi-poo-web-issuetracker-maven/imagens/avatar_author.jpg"
											width="35" alt="${sessionScope.usuario.nome }"
											title="${sessionScope.usuario.nome }" />
										<button type="submit">Enviar</button>
									</div>
								</form>


							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- AQUI COMECA A LINAH ATABELA -->

			<!-- AQUI COMECA A LINAH ATABELA -->

		</div>
	</div>
	</section>
	</section>
	</section>
	</body>
	</html>
	<script>
	function focusResposta(var idTicket){
		alert("focus")
		document.getElementById('form'+idTicket').focus
	}

</script>