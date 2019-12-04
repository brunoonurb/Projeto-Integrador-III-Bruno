<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<jsp:include page="./topoCoordenador.jsp"></jsp:include>




<h2>
	<i class="fas fa-users"></i>&ensp; Gestão de Coordenadores
</h2>



	<div class="panel-heading ">
		<h6 class="panel-title ">
			<table class="table  blue-bg ">
				<tr align="center">
					<td class="col-md-2">Id</td>
					<td class="col-md-2">Nome</td>
					<td class="col-md-2">Sobrenome</td>
					<td class="col-md-4">E-mail</td>
					<td class="col-md-2">Rank F.</td>
				</tr>
			</table>
		</h6>
	</div>



<div class="panel-group " id="accordion">


<c:forEach items="${coordenadores}" var="coordenador">
	<div class="panel panel-blue-bg ">
		<div class="panel-heading">
			<h6 class="panel-title ">
				<table class="table table-hover ">
					<tr align="center">
						<td class="col-md-2">${coordenador.id}</td>
						<td class="col-md-2">${coordenador.nome}</td>
						<td class="col-md-2">${coordenador.sobrenome}</td>
						<td class="col-md-4">${coordenador.email}</td>
						<td class="col-md-2">
							<button type="button" class="btn btn-success"
								data-toggle="collapse" data-parent="#accordion"
								data-target="#collapse1">Acessar</button>
						</td>
					</tr>
				</table>
			</h6>
		</div>



		<div id="collapse1" class=" panel-collapse collapse">
			<div class="panel-body">

				<div>
					<div class="row">
						<div class="col-xs-1">Editar ticket</div>
						<div class="col-xs-11">
							<div class="progress">
								<div class="progress-bar blue-bg" role="progressbar"
									style="width: 25%" aria-valuenow="25" aria-valuemin="0"
									aria-valuemax="100">10%</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-1">Login</div>
						<div class="col-xs-11">
							<div class="progress">
								<div class="progress-bar teal-bg" role="progressbar"
									style="width: 50%" aria-valuenow="50" aria-valuemin="0"
									aria-valuemax="100">15%</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-1">Listar tickets</div>
						<div class="col-xs-11">
							<div class="progress">
								<div class="progress-bar orange-br" role="progressbar"
									style="width: 75%" aria-valuenow="75" aria-valuemin="0"
									aria-valuemax="100">25%</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-1">Responder Ticket</div>
						<div class="col-xs-11">
							<div class="progress">
								<div class="progress-bar lime-bg" role="progressbar"
									style="width: 100%" aria-valuenow="100" aria-valuemin="0"
									aria-valuemax="100">50%</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>



	<jsp:include page="./rodapeCoordenador.jsp"></jsp:include>