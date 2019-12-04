<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<jsp:include page="./topoCoordenador.jsp"></jsp:include>



<h2>
	<i class="fa fa-eye"></i> Logs de Acessos
</h2>



	<div class="panel-heading ">
		<h6 class="panel-title ">
			<table class="table  green-bg ">
				<tr align="center">
					<td class="col-md-1 text-center" style="color: white;">Registro</td>
					<td class="col-md-2 text-center" style="color: white;">Data</td>
					<td class="col-md-1 text-center" style="color: white;">Hora</td>
					<td class="col-md-2 text-center" style="color: white;">Acao</td>
					<td class="col-md-2 text-center" style="color: white;">Tentativas
						de login</td>
					<td class="col-md-1 text-center" style="color: white;">Nivel</td>
					<td class="col-md-3 text-center" style="color: white;">Usuario</td>
				</tr>
			</table>
		</h6>
	</div>


<div class="panel-group " id="accordion">

	<div class="panel panel-green-bg ">
		<div class="panel-heading">
			<h6 class="panel-title ">
				<table class="table table-hover ">
					<tr align="center">
						<td class="col-md-1 text-center" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapse7">#012546</td>
						<td class="col-md-2 text-center" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapse7">27/08/2019</td>
						<td class="col-md-1 text-center" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapse7">15:25</td>
						<td class="col-md-2 text-center" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapse7">Login</td>
						<td class="col-md-2 text-center" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapse7">2</td>
						<td class="col-md-1 text-center" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapse7">Cliente</td>
						<td class="col-md-3 text-center"><a href="#"> Roberto Bon</a></td>
					</tr>
				</table>
			</h6>
		</div>


		<div id="collapse7" class="panel-collapse collapse">
			<div class="panel-body">
				<table class="table table-striped table-blue">
					<thead class="blue-bg">
						<tr>
							<th class="text-center" style="color: white;">Registro</th>
							<th class="text-center" style="color: white;">Data</th>
							<th class="text-center" style="color: white;">Hora</th>
							<th class="text-center" style="color: white;">Acao</th>
							<th class="text-center" style="color: white;">Acesso</th>
							<th class="text-center" style="color: white;">Usuario</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<tr>
							<td>#012546</td>
							<td>27/08/2019</td>
							<td>15:31</td>
							<td>Tentativa de Login</td>
							<td>Sistema</td>
							<td>Roberto Bonadine</td>
						</tr>
						<tr>
							<td>#012546</td>
							<td>27/08/2019</td>
							<td>15:32</td>
							<td>Tentativa de Login</td>
							<td>Sistema</td>
							<td>Roberto Bonadine</td>
						</tr>
						<tr>
							<td>#012546</td>
							<td>27/08/2019</td>
							<td>15:35</td>
							<td>Login</td>
							<td>Sistema</td>
							<td>Roberto Bonadine</td>
						</tr>
						<tr>
							<td>#012546</td>
							<td>27/08/2019</td>
							<td>15:40</td>
							<td>Respondeu Ticket #1</td>
							<td>Ticket #1</td>
							<td>Roberto Bonadine</td>
						</tr>
						<tr>
							<td>#012546</td>
							<td>27/08/2019</td>
							<td>15:42</td>
							<td>Atribui tecnico</td>
							<td>Ticket #1</td>
							<td>Roberto Bonadine</td>
						</tr>
						<tr>
							<td>#012546</td>
							<td>27/08/2019</td>
							<td>15:45</td>
							<td>Logout</td>
							<td>Sistema</td>
							<td>Roberto Bonadine</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


	</div>
</div>



<jsp:include page="./rodapeCoordenador.jsp"></jsp:include>
