<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<c:set var="logou" value="${0}" scope="session" />

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">

<title>Issue Tracker</title>


<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/elegant-icons-style.css" rel="stylesheet" />
<link href="css/font-awesome.min.css" rel="stylesheet" />
<link href="css/widgets.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />
<link href="css/xcharts.min.css" rel=" stylesheet">
<link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet">
<link href="css/loginStyle.css" rel="stylesheet">

</head>
<body background="img/back.jpg">
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<div class="d-flex justify-content-center">
				<a href="#" class="logo">Issue <span class="lite">Tracker</span></a><br>
				<br> <br>
			</div>
			<form class="" method="post"
				action="/fapi-poo-web-issuetracker-maven/UsuarioServlet?acao=loginUsuario">
				<input type="text" id="email" class="fadeIn second" name="email"
					placeholder="Email" required> <input type="text" id="senha"
					class="fadeIn third" name="senha" placeholder="Senha" required><br>
				<br> <input type="submit" class="fadeIn fourth" value="Entrar">
			</form>
			<div class="" id="formFooter">
				<a class="underlineHover"
					href="/fapi-poo-web-issuetracker-maven/usuario/cadastroUsuario.jsp">Cada um terá que cadastrar conforme os requisitos, só pegar o layout do cadastrar</a>
			</div>
		</div>
	</div>
</body>
</html>
