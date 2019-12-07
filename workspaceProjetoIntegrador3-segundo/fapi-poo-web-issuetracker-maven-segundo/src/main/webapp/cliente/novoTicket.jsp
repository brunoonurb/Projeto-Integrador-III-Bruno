<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<jsp:include page="./topoCliente.jsp"></jsp:include>

<!-- include para menu de funcionalidade -->
<div class="col-md-9">
	<div id="teste" class="col-md-12" style="background-color: white;">

		<!---bruno------------------>
		<div class="container">
			<h2>
				<i class="fa fa-pencil-square"> </i> Novo Ticket
			</h2>
			<br>




			<form class="form-horizontal" method="POST"
				action="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=cadastrarTickets&descricao=Cadastrou ticket">
				<div class="row">
					<div class="form-group col-md-3">
						<i class="fa fa-user"></i> <label for="nome">Usuario </label> <input
							type="text" class="form-control" id="nome" name=""
							aria-describedby="nomeHelp" value="${sessionScope.nome }"
							disabled> <small id="nomeHelp"
							class="form-text text-muted">Nome do usuario logado no
							momenmto.</small>
					</div>
					<input type="hidden" name="nomeCliente"
						value="${sessionScope.usuario.nome }"> 
						<input
						type="hidden" name="idCliente" value="${sessionScope.id }">
						<input
						type="hidden" name="idTicket" value="${idTicket}">
					<div class="col-md-2"></div>
					<div class="form-group col-md-3">
						<i class="fa fa-envelope"> </i> <label for="nome">Email</label> <input
							type="text" class="form-control" id="nome"
							aria-describedby="nomeHelp"
							value="${sessionScope.email }" disabled> <small
							id="nomeHelp" class="form-text text-muted">Email do
							usuario logado no momenmto.</small>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-8">
						<i class="fa fa-group"> </i> <label for="nome">Assunto</label> <input
							type="text" class="form-control" id="assunto" name="assunto"
							aria-describedby="nomeHelp"
							placeholder="Digite assunto do seu ticket" maxlength="25">
						<small id="nomeHelp" class="form-text text-muted"> Numero
							maximo caracteres 25.</small>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-8">
						<i class="fa fa-comments-o"> </i> <label for="exampleTextarea">Descrição</label>
						<textarea class="form-control" id="exampleTextarea" rows="3"
							placeholder="Descreva qual é seu problema" name="relato"></textarea>
					</div>
				</div>
				<br>
				<!-- <div class="row d-flex justify-content-center">
					<div class="form-group col-md-12">
						<i class="fa fa-comments-o"> </i> <label for="exampleTextarea">Adicionar
							Print do problema</label>
						<div class="file-field">
							<div class="btn btn-info btn-sm float-left">
								<span>Escolha Arquivo</span> <input type="file" name="print"
									multiple>
							</div>
						</div>
					</div>
				</div> -->
				<br />

				<button type="submit" class="btn btn-primary">Gerar Ticket</button>
			</form>




		</div>
		</section>
		</section>
		</section>


		</body>
		</html>