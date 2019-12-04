<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<jsp:include page="./topoCoordenador.jsp"></jsp:include>



<h2>
	<i class="fas fa-users"></i>&ensp; Gestão de Técnicos
</h2>




	<div class="panel-heading ">
		<h6 class="panel-title ">
			<table class="table  yellow-bg ">
				<tr align="center">
					<td class="col-md-2">Id</td>
					<td class="col-md-2">Nome</td>
					<td class="col-md-2">Sobrenome</td>
					<td class="col-md-2">Email</td>
					<td class="col-md-2">Tickets resolvidos</td>
					<td class="col-md-2">Rank F.</td>
				</tr>
			</table>
		</h6>
	</div>


<div class="panel-group " id="accordion">
<c:forEach items="${tecnicos}" var="tecnico">
	<div class="panel panel-yellow-bg ">
		
		<div class="panel-heading">
			<h6 class="panel-title ">
				<table class="table table-hover ">
					<tr align="center">
						<td class="col-md-2">${tecnico.id}</td>
						<td class="col-md-2">${tecnico.nome}</td>
						<td class="col-md-2">${tecnico.sobrenome}</td>
						<td class="col-md-2">${tecnico.email}</td>
						<td class="col-md-2">
							<button type="button" class="btn btn-info" data-toggle="collapse"
								data-parent="#accordion" data-target="#collapse1">Acessar</button>
						</td>
						<td class="col-md-2">
							<button type="button" class="btn btn-info" data-toggle="collapse"
								data-parent="#accordion" data-target="#collapse2">Acessar</button>
						</td>
					</tr>
				</table>
			</h6>
		</div>
		
		<div id="collapse1" class="panel-collapse collapse">
			<div class="panel-body">Tickets resolvidos</div>
		</div>
		<div id="collapse2" class="panel-collapse collapse">
			<div class="panel-body">Funcionalidades mais usadas</div>
		</div>
	</div>
	</c:forEach>
</div>



<jsp:include page="./rodapeCoordenador.jsp"></jsp:include>

