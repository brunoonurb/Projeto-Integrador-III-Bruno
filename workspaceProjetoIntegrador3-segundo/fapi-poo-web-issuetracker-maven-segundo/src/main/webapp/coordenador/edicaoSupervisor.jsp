<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>

<meta charset="utf-8">
<title>Cadastro de Usuario</title>
<link href="/fapi-poo-web-issuetracker-maven/css/bootstrap.min.css" rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/bootstrap-theme.css" rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/elegant-icons-style.css" rel="stylesheet" />
<link href="./fapi-poo-web-issuetracker-maven/css/font-awesome.min.css" rel="stylesheet" />
<link href="/fapi-poo-web-issuetracker-maven/css/widgets.css" rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/style-responsive.css" rel="stylesheet" />
<link href="/fapi-poo-web-issuetracker-maven/css/xcharts.min.css" rel=" stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/loginStyle.css" rel="stylesheet">
</head>

<body background="/fapi-poo-web-issuetracker-maven/img/back.jpg">
	<div class="wrapper fadeInDown">
		<div id="formContent2">
			<div class="d-flex justify-content-center">
				<a href="#" class="logo">Editar <span class="lite">Supervisor</span></a>
			</div>
			<br> <br>
			<form class="" method="post"
				action="/fapi-poo-web-issuetracker-maven/CoordenadorServlet?acao=atualizarSupervisor"><br>
				<input type="text" id="nome" class="fadeIn second" name="nome"
					placeholder="Nome" value="${supervisor.nome}" required data-toggle="tooltip" title="Nome do supervisor"> <input type="text"
					id="sobrenome" class="fadeIn second" name="sobrenome"
					placeholder="Sobrenome" value="${supervisor.sobrenome}"required data-toggle="tooltip" title="Sobrenome do supervisor"> <input type="text"
					id="email" class="fadeIn second" name="email" placeholder="Email" value="${supervisor.email}"
					required data-toggle="tooltip" title="Email do supervisor">
					<div class="form-row col-md-12">
					<div class="col-md-6">
					<input style="width:90%;margin-right:-2%;" class="fadeIn second" type="text" value="${supervisor.id}"  disabled data-toggle="tooltip" title="Id do supervisor">
					<input type="hidden" value="${supervisor.id}" name="id" id="id">
					</div>
					<div class="col-md-6">
					<input style="width:90%;margin-left:-2%;" class="fadeIn second" type="text" value="${supervisor.senha}" name="senha" id="senha" required data-toggle="tooltip" title="Senha do supervisor">
					<input type="hidden" value="${supervisor.nivel}" id="nivel" name="nivel">
					<input type="hidden" value="${supervisor.status}" id="status" name="status">
					</div>
					</div>
					<br> <br> 
				<div class="form-row">
					<input type="reset" class="fadeIn fourth" value="Limpar"> <input
						type="submit" class="fadeIn fourth" value="Salvar">
				</div>
			</form>
			
		</div>
	</div>
</body>
</html>


