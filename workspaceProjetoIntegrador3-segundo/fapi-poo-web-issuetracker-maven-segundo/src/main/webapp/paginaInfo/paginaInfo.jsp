
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="ISO-8859-1">

<title>Cadastrado</title>

<link href="/fapi-poo-web-issuetracker-maven/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/bootstrap-theme.css"
	rel="stylesheet">
<link
	href="/fapi-poo-web-issuetracker-maven/css/elegant-icons-style.css"
	rel="stylesheet" />
<link href="/fapi-poo-web-issuetracker-maven/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="/fapi-poo-web-issuetracker-maven/css/widgets.css"
	rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/style-responsive.css"
	rel="stylesheet" />
<link href="/fapi-poo-web-issuetracker-maven/css/xcharts.min.css"
	rel=" stylesheet">
<link
	href="/fapi-poo-web-issuetracker-maven/css/jquery-ui-1.10.4.min.css"
	rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/loginStyle.css"
	rel="stylesheet">

</head>
<body background="/fapi-poo-web-issuetracker-maven/img/back.jpg">
	<c:forEach items="${infos}" var="info">
		<div class="alert <c:out value='${cor}'/> text-center">
			${info}<br />
		</div>
	</c:forEach>
	<br>
	<div class="container">
		<div class="row">
			<div class="col text-center">
						<a class="btn btn-success"
					href="/fapi-poo-web-issuetracker-maven/${sessionScope.nivel}/home.jsp">Voltar</a>							
			</div>
		</div>
	</div>
</body>
</html>