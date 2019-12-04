
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<c:set var="testa" value="valueHere" scope="session"  />
<jsp:include page="./topoCoordenador.jsp"></jsp:include>



<h2>
	<i class="fas fa-ticket-alt"></i>&ensp;Gestão de tickets
</h2>

<div class="panel-heading ">
	<h6 class="panel-title ">
		<table class="table  brown-bg ">
			<tr align="center">
				<td class="col-md-1 text-center" style="color: white;">Protocolo</td>
				<td class="col-md-2 text-center" style="color: white;">Data</td>
				<td class="col-md-2 text-center" style="color: white;">Cliente</td>
				<td class="col-md-3 text-center" style="color: white;">Assunto</td>
				<td class="col-md-1 text-center" style="color: white;">Status</td>
				<td class="col-md-1 text-center" style="color: white;">Tempo</td>
				<td class="col-md-2 text-center" style="color: white;">Técnico</td>
			</tr>
		</table>
	</h6>
</div>




<div class="panel-group " id="accordion">
	<c:forEach items="${tickets}" var="ticket">
		<div class="panel panel-brown-bg ">
			<div class="panel-heading">
				<h6 class="panel-title ">
					<table class="table table-hover ">
						<tr align="center">
							<td id="ticketId" class="col-md-1 text-center"
								data-toggle="collapse" data-parent="#accordion"
								data-target="#collapse${ticket.id}">${ticket.id}</td>

							<td class="col-md-2 text-center" data-toggle="collapse"
								data-parent="#accordion" data-target="#collapse${ticket.id}">${ticket.data}</td>

							<td class="col-md-2 text-center" data-toggle="collapse"
								data-parent="#accordion" data-target="#collapse${ticket.id}">${ticket.nomeCliente}</td>

							<td class="col-md-3 text-center" data-toggle="collapse"
								data-parent="#accordion" data-target="#collapse${ticket.id}">${ticket.assunto}</td>

							<td class="col-md-1 text-center" data-toggle="collapse"
								data-parent="#accordion" data-target="#collapse${ticket.id}"><span
								class="badge bg-success m-0">${ticket.explicacao}</span></td>

							<td class="col-md-1 text-center" data-toggle="collapse"
								data-parent="#accordion" data-target="#collapse${ticket.id}">${ticket.tempoCriacao}</td>

							<td class="col-md-2 text-center"><c:if
									test="${ticket.explicacao=='atribuido'}">
									<select name="tecnicoEscolhido" id="tecnicoEscolhido">
										<c:forEach items="${tecnicos}" var="tecnico">
											<option value="<c:out value="${tecnico.id}"></c:out>"
												<c:if test="${ticket.atribuicaoTecnico==tecnico.id}">selected</c:if>>${tecnico.nome}
												${tecnico.sobrenome}</option>
										</c:forEach>
									</select>
								</c:if> <c:if test="${!(ticket.explicacao=='atribuido')}">
									<c:forEach items="${tecnicos}" var="tecnico">

										<c:if test="${ticket.atribuicaoTecnico==tecnico.id}">${tecnico.nome}
												${tecnico.sobrenome}</c:if>
									</c:forEach>
								</c:if></td>
						</tr>
					</table>
				</h6>
			</div>

			<c:if test="${!(ticket.explicacao=='atribuido')}">
				<div id="collapse${ticket.id}" class="panel-collapse collapse">


					<div class="panel-body">
						<ul class="comment-section">
							<div class="row justify-content-center">
								<div class="row col-md-10 text-justify">
									<li class="comment user-comment">
										<div class="info">
											<a href="#">${ticket.nomeCliente}</a> <span
												class="badge badge-pill bg-info">Cliente</span>&ensp;&ensp;<span>
												${ticket.data} | ${ticket.hora }</span>
										</div> <a class="avatar" href="#"> <img
											src="/fapi-poo-web-issuetracker-maven/imagens/avatar_author.jpg"
											width="35" alt="${ticket.nomeCliente}"
											title="${ticket.nomeCliente}" /></a>
										<h4 class="font-weight-bold">
											<b>${ticket.descricao}</b>
										</h4>
									</li>
								</div>
							</div>
							<hr style="border-color: #7bac3b; widht: 150%">
							<c:set var="cont" value="${0}" />
							<c:set var="nomeUsuario" value="${null}" />
							<c:set var="nivelUsuario" value="${null}" />
							<c:set var="data" value="${null}" />
							<c:set var="hora" value="${null}" />
							<c:set var="idResposta" value="${null}" />
							<c:forEach items="${respostas}" var="resposta" varStatus="loop">

								<c:if test="${resposta.idTicket == ticket.id}">
									<c:set var="cont" value="${cont + 1}" />
								
									
									
									<div id="resposta${cont}">
									
									
										<c:if
												test="${resposta.nivelUsuario=='Cliente'}">
												<div 
													style="background-color: #FFD6D6; background-image: linear-gradient(to right, white, #FFE5E5);">
													<br>
													<div class="info">
														<a class="avatar" href="#"> <img
															src="/fapi-poo-web-issuetracker-maven/img/tickets/avatarCliente.jpg"
															width="35" alt="Profile Avatar"
															title="${resposta.nomeUsuario }" />
														</a> <a href="#">${resposta.nomeUsuario}</a> <span
															class="badge badge-pill bg-info">${resposta.nivelUsuario}</span>
														&ensp; <span> ${resposta.data} | ${resposta.hora }
														</span> &ensp;&ensp;&ensp;&ensp;
													</div>
													<br>

													
														<p>
															<b>${resposta.resposta}</b>
														</p>
													
												

												</div>
											</c:if> 
											
											
											
											
											<c:if test="${!(resposta.nivelUsuario=='Cliente')}">
												<div
													style="background-color: #FFD6D6; background-image: linear-gradient(to right, white, #E5ECFF);">
													<br>
													<div class="info">
														<a class="avatar" href="#"> <img
															src="/fapi-poo-web-issuetracker-maven/img/tickets/avatarSistema.jpg"
															width="35" alt="Profile Avatar"
															title="${resposta.nomeUsuario }" />
														</a> <a href="#">${resposta.nomeUsuario}</a> <span
															class="badge  bg-primary">${resposta.nivelUsuario}</span>
														&ensp; <span> ${resposta.data} | ${resposta.hora }
														</span> &ensp;&ensp;&ensp;&ensp;

														<c:forEach items="${edicoes}" var="edicao">

															<c:if test="${resposta.id==edicao.idResposta}">
																
																	<i>(Editado por: ${edicao.edicaoNomeUsuario} ${edicao.edicaoSobrenomeUsuario}&ensp;
																		<span class="badge  bg-primary">${edicao.edicaoNivelUsuario}</span>
																		&ensp;&ensp; ${edicao.edicaoData} |
																		${edicao.edicaoHora} )
																	</i>
															</c:if>
														</c:forEach>
													</div>
													<br>

													<div id="edicaoResposta${cont}">
														<p>
															<b>${resposta.resposta}</b>
														</p>
														<div id="botaoResposta${cont}"></div>
													</div>
												</div>
											</c:if>
											
											 <c:set var="nomeUsuario" value="${resposta.nomeUsuario}" />
											<c:set var="nivelUsuario" value="${resposta.nivelUsuario}" />
											<c:set var="data" value="${resposta.data}" /> <c:set
												var="hora" value="${resposta.hora}" /> <c:set
												var="ultimaResposta" value="${resposta.resposta}" /> <c:set
												var="idResposta" value="${resposta.id}" />
											<script>	
									//alert('${ultimaResposta}');
									</script>
												
									</div>
									
								</c:if>
								
												<script>
												
												function editarResposta() {
													
													formulario = "<form  onSubmit='direcionar()' method='post' action='/fapi-poo-web-issuetracker-maven/CoordenadorServlet?acao=editarRespostaTicket'>"
															+ "<label for='Descricao-text' class='col-form-label'><b>Responder:<b></label><br>"
															+ "<input type='hidden' id='idUsuario' name='idUsuario' value='${sessionScope.id}'>"
															+ "<input type='hidden' id='nomeUsuario' name='nomeUsuario' value='${sessionScope.nome}'>"
															+ "<input type='hidden' id='sobrenomeUsuario' name='sobrenomeUsuario' value='${sessionScope.sobrenome}'>"
															+ "<input type='hidden' id='nivelUsuario' name='nivelUsuario' value='${sessionScope.nivel}'>"
															+ "<input type='hidden' id='idResposta' name='idResposta' value='${idResposta}'>"
															+ "<textarea id='respostaEditada' name='respostaEditada' class='' rows='5' cols='50' id='respostaEditada' style=' border: 1px solid #ba68c8;' required   	><c:out value='${ultimaResposta}'/></textarea>"
															+ "&ensp;&ensp;<input type='submit' class='btn btn-success' value='Salvar'>"
															+ "</form>";
													document.getElementById('edicaoResposta<c:out value='${cont}'/>').innerHTML = formulario;

												}
							
								</script>
								
								
								
								<script>
								
							window.onload =function() {
										
												document.getElementById('botaoResposta<c:out value='${cont}'/>').innerHTML = " <button class='btn btn-success btn-sm' onClick='editarResposta()'>Editar resposta</button>";

											}
						</script>
								
								
								
								
								
								
								
							</c:forEach>
							
						</ul>
						
							
							

					</div>
				</div>

			</c:if>
		</div>

	</c:forEach>
</div>

<jsp:include page="./rodapeCoordenador.jsp"></jsp:include>

