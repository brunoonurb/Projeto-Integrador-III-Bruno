<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<jsp:include page="./topoCoordenador.jsp"></jsp:include>

<div class="row">
	<div class="col-md-6">
		<h2>
			<i class="fas fa-users"></i>&ensp; Gestão de supervisores
		</h2>

	</div>
	<div class="col-md-4 "></div>
	<div class="col-md-2">
		<br>
		<button onclick="cadastro()" class="btn btn-success ">Adicionar
			Supervisor</button>
	</div>
</div>
<div class="panel-heading ">
	<h6 class="panel-title ">
		<table class="table  dark-bg ">
			<tr align="center">
				<td class="col-md-1 text-center" style="color: white;">Id</td>
				<td class="col-md-2 text-center" style="color: white;">Nome
					completo</td>
				<td class="col-md-2 text-center" style="color: white;">Email</td>
				<td class="col-md-2 text-center" style="color: white;">Tks
					atribuidos</td>
				<td class="col-md-2 text-center" style="color: white;">Rank
					funcionalidades</td>
									<td class="col-md-1"></td>
				<td class="col-md-1 text-center" style="color: white;">Editar</td>
				<td class="col-md-1 text-center" style="color: white;">Excluir</td>
			</tr>
		</table>
	</h6>
</div>


<div class="panel-group " id="accordion">

	<c:forEach items="${supervisores}" var="supervisor">
		<div class="panel panel-dark-bg ">
			<div class="panel-heading">
				<h6 class="panel-title ">
					<table class="table table-hover ">
						<tr align="center">
							<td class="col-md-1 text-center">${supervisor.id}</td>
							<td class="col-md-2 text-center">${supervisor.nome}
								${supervisor.sobrenome}</td>
							<td class="col-md-2 text-center">${supervisor.email}</td>
							<td class="col-md-2 text-center"><button type="button"
									class="btn btn-info" data-toggle="collapse"
									data-parent="#accordion" data-target="#collapse${supervisor.id}${supervisor.nome}1">Acessar</button></td>
							<td class="col-md-2 text-center"><button type="button"
									class="btn btn-info" data-toggle="collapse"
									data-parent="#accordion" data-target="#collapse${supervisor.id}${supervisor.nome}2">Acessar</button></td>
							<td class="col-md-1"></td>
							<td class="col-md-1 text-center"><a href="#"
								onclick="editar('${supervisor.id}')"
								class="btn btn-success btn-sm"><i class="fas fa-pencil-alt"></i>
									Editar</a>
							</button></td>
							<td class="col-md-1 text-center"><a
								href="#" onclick="excluir('${supervisor.id}')"
								class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i>
									Excluir</a></td>
						</tr>
					</table>
				</h6>
			</div>
			
			<div id="collapse${supervisor.id}${supervisor.nome}1" class="panel-collapse collapse">
			<div class="panel-body">Tickets assinalados pelo supervisor de id ${supervisor.id} e nome  ${supervisor.nome}</div>
		</div>


		<div id="collapse${supervisor.id}${supervisor.nome}2" class="panel-collapse collapse">
			<div class="panel-body">Funcionalidades mais usadas pelo supervisor de id ${supervisor.id} e nome  ${supervisor.nome}</div>
		</div>
			
		</div>
	</c:forEach>
	<br><br><br>
	
</div>
</div>

<jsp:include page="./rodapeCoordenador.jsp"></jsp:include>
