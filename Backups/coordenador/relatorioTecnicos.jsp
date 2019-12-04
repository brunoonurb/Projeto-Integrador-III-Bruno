<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<jsp:include page="./topoCoordenador.jsp"></jsp:include>



<h2>
	<i class="fa fa-archive"></i> Relatório de Técnicos
</h2>




	<div class="panel-heading ">
		<h6 class="panel-title ">
			<table class="table  yellow-bg ">
				<tr align="center">
					<td class="col-md-2">Id</td>
					<td class="col-md-3">Técnico</td>
					<td class="col-md-3">Tickets resolvidos</td>
					<td class="col-md-4">Rank funcionalidades</td>
				</tr>
			</table>
		</h6>
	</div>


<div class="panel-group " id="accordion">

	<div class="panel panel-yellow-bg ">
		
		<div class="panel-heading">
			<h6 class="panel-title ">
				<table class="table table-hover ">
					<tr align="center">
						<td class="col-md-2">#87474</td>
						<td class="col-md-3">Cristian Caleb</td>
						<td class="col-md-3">
							<button type="button" class="btn btn-info" data-toggle="collapse"
								data-parent="#accordion" data-target="#collapse1">Acessar</button>
						</td>
						<td class="col-md-4">
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
</div>



<jsp:include page="./rodapeCoordenador.jsp"></jsp:include>

