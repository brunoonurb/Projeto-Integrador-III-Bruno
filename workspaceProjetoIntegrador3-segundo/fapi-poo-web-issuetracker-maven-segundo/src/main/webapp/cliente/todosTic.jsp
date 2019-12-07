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
												test="${ticket.status != 3}">
												<span class="badge bg-warning m-0"> Pendente
											</c:if>  <c:if test="${ticket.status == 3}">
												<span class="badge bg-success m-0"> Resolvido 
											</c:if> </span></td>
										<td class="col-md-4" data-toggle="collapse"
											data-parent="#accordion"
											data-target="#<c:out value="${ticket.id}"/>">
											${ticket.assunto}</td>
										<td class="col-md-2"><c:if
												test="${ticket.idCliente == sessionScope.id}">
												<c:set var="nameCliente_t" value="${ticket.nomeCliente}" />
												<c:if test="${ticket.status != 3}">
													<c:set var="situacao" value="Finalizado" />
													<button class="btn btn-success" data-toggle="modal"
														data-target="#modalBotton<c:out value="${ticket.id}"/>">Finalizar</button>
													<!--<a class="btn btn-success" onclick="modalBotton2()"
														href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=finalizarTicket&idTicket=${ticket.id }">Finalizar</a>-->
												</c:if>
												<c:if test="${ticket.status == 3}">
													<c:set var="situacao" value="Reaberto" />
													<button class="btn btn-danger" data-toggle="modal"
														data-target="#modalBotton2<c:out value="${ticket.id}"/>">Reabrir</button>
													<!--<a class="btn btn-danger" onclick="modalBotton2()"
														href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=reabrirTicket&idTicket=${ticket.id }">Reabrir</a>-->
												</c:if>
											</c:if> <c:if test="${ticket.idCliente != sessionScope.id}">
												<c:set var="nameCliente_t" value="${ticket.nomeCliente}" />
												<c:if test="${ticket.status != 3}">
													<button class="btn btn-success" onclick="modalBotton()">Finalizar</button>
												</c:if>
												<c:if test="${ticket.status == 3}">
													<button class="btn btn-danger" onclick="modalBotton()">Reabrir</button>
												</c:if>
											</c:if></td>
									</tr>
								</table>
							</h6>
						</div>

						<div class="modal fade"
							id="modalBotton<c:out value="${ticket.id}"/>" role="dialog">
							<div class="modal-dialog"
								style="background-color: SpringGreen; color: black;">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">
											<b>Alterar situacao do tickets</b>
										</h4>
									</div>
									<div class="modal-body">
										<h4>
											<b> <c:out value="${nameCliente_t}" /> seu tickets sera
												<c:out value="${situacao}" />.
											</b>
										</h4>
									</div>
									<div class="modal-footer">
										<div class="row">
											<div class="col-md-3"></div>
											<div class="col-md-3">
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Fechar</button>
											</div>
											<div class="col-md-3">
												<a class="btn btn-success"
													href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=finalizarTicket&idTicket=${ticket.id }">Finalizar</a>
											</div>
											<div class="col-md-3"></div>
										</div>

									</div>
								</div>

							</div>
						</div>
						<div class="modal fade"
							id="modalBotton2<c:out value="${ticket.id}"/>" role="dialog">
							<div class="modal-dialog"
								style="background-color: SpringGreen; color: black;">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">
											<b>Alterar situacao do tickets</b>
										</h4>
									</div>
									<div class="modal-body">
										<h4>
											<b> <c:out value="${nameCliente_t}" /> seu tickets sera
												<c:out value="${situacao}" />.
											</b>
										</h4>
									</div>
									<div class="modal-footer">
										<div class="row">
											<div class="col-md-3"></div>
											<div class="col-md-3">
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Fechar</button>
											</div>
											<div class="col-md-3">
												<a class="btn btn-danger" onclick="modalBotton2()"
													href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=reabrirTicket&idTicket=${ticket.id }">Reabrir</a>
											</div>
											<div class="col-md-3"></div>
										</div>

									</div>
								</div>

							</div>
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

</div>

<script>
	/* function focusResposta(var idTicket){
		alert("focus")
		document.getElementById('form'+idTicket').focus
	} */
	function modalBotton(){
		//alert('ooo');
		 $('#modalBotton').modal('show');
	}
</script>


<div class="modal fade" id="modalBotton" role="dialog">
	<div class="modal-dialog"
		style="background-color: tomato; color: black;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<b>Alterar situacao do tickets</b>
				</h4>
			</div>
			<div class="modal-body">
				<h4>
					<b>Esse ticket não pode ser alterado pois pertence a outro
						funcionario. </b>
				</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
			</div>
		</div>

	</div>
</div>


</section>
</section>
</section>
</body>
</html>