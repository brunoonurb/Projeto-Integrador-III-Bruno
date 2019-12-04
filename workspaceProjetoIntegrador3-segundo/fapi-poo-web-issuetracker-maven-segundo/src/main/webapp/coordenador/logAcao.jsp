<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<jsp:include page="./topoCoordenador.jsp"></jsp:include>

<h2>
	<i class="fas fa-sign-in-alt"></i>&ensp; Logs de A��es
</h2>



	<div class="panel-heading ">
		<h6 class="panel-title ">
			<table class="table  linkedin-bg ">
				<tr align="center">
					<td class="col-md-1 text-center" style="color: white;">Registro</td>
					<td class="col-md-1 text-center" style="color: white;">Data</td>
					<td class="col-md-1 text-center" style="color: white;">Hora</td>
					<td class="col-md-3 text-center" style="color: white;">Acao</td>
					<td class="col-md-3 text-center" style="color: white;">Usuario</td>
					<td class="col-md-2 text-center" style="color: white;">Nivel</td>
					<td class="col-md-1 text-center" style="color: white;">Id</td>
				</tr>
			</table>
		</h6>
	</div>


<div class="panel-group " id="accordion">

<c:forEach items="${logAcoes}" var="log">
		<div class="panel panel-linkedin-bg ">
			<div class="panel-heading">
				<h6 class="panel-title ">
					<table class="table table-hover ">
						<tr align="center">
							<td class="col-md-1 text-center">#${log.id}</td>
							<td class="col-md-1 text-center">${log.data}</td>
							<td class="col-md-1 text-center">${log.hora}</td>
							<td class="col-md-3 text-center">${log.acao}</td>
							<td class="col-md-3 text-center">${log.nomeUsuario} ${log.sobrenomeUsuario}</td>
							<td class="col-md-2 text-center">${log.nivelUsuario}</td>
							<td class="col-md-1 text-center">${log.idUsuario}</td>
						</tr>
					</table>
				</h6>
			</div>
		</div>
	</c:forEach>
</div>



<jsp:include page="./rodapeCoordenador.jsp"></jsp:include>
