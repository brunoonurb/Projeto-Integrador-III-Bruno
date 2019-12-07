<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Todos os Tickets</title>
<!-- Bootstrap CSS -->
<link href="/fapi-poo-web-issuetracker-maven/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="/fapi-poo-web-issuetracker-maven/css/bootstrap-theme.css" rel="stylesheet">
<!-- font icon -->
<link href="/fapi-poo-web-issuetracker-maven/css/elegant-icons-style.css" rel="stylesheet" />
<link href="/fapi-poo-web-issuetracker-maven/css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles -->
<link rel="stylesheet" href="../css/fullcalendar.css">
<link href="/fapi-poo-web-issuetracker-maven/css/widgets.css" rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/style.css" rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/style-responsive.css" rel="stylesheet" />
<link href="/fapi-poo-web-issuetracker-maven/css/xcharts.min.css" rel=" stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	 <script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js?hcode=c11e6e3cfefb406e8ce8d99fa8368d33"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-ui.min.js?hcode=c11e6e3cfefb406e8ce8d99fa8368d33"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-exports.min.js?hcode=c11e6e3cfefb406e8ce8d99fa8368d33"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-cartesian-3d.min.js?hcode=c11e6e3cfefb406e8ce8d99fa8368d33"></script>
  <script src="https://cdn.anychart.com/releases/v8/themes/pastel.min.js"></script>
  <link href="https://cdn.anychart.com/releases/v8/css/anychart-ui.min.css?hcode=c11e6e3cfefb406e8ce8d99fa8368d33" type="text/css" rel="stylesheet">
  <link href="https://cdn.anychart.com/releases/v8/fonts/css/anychart-font.min.css?hcode=c11e6e3cfefb406e8ce8d99fa8368d33" type="text/css" rel="stylesheet">
	
	<style type="text/css">
 

#container3 {
    width: 100%;
    height: 500px;
    margin: 0;
    padding: 0;
}
#container2 {
    width: 100%%;
    height: 500px;
    margin: 0;
    padding: 0;
}
#container1 {
    width: 100%%;
    height: 300px;
    margin: 0;
    padding: 0;
}
#teste {
    height: 750px;
}
</style>
	
</head>

<body>


	<section id="container" class="">
		<!-- |--------------------------------------------------------------------------------------------------------- >
		Inicia menu superior -->
		<header class="header dark-bg">
			<a href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=home&descricao=Entrou na Home" class="logo">Issue <span
				class="lite">Tracker</span></a>
			<div class="top-nav notification-row">
				<ul class="nav pull-right top-menu">
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <span class="profile-ava">
								<img alt=""
								src="/fapi-poo-web-issuetracker-maven/img/avatar-mini2.jpg">
						</span> <span class="username">${sessionScope.nome}
								${sessionScope.sobrenome}</span> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu extended logout">
							<div class="log-arrow-up"></div>
							<li class="eborder-top"><a href="#"><i
									class="icon_profile"></i> Meu perfil</a></li>
							<li><a href="/fapi-poo-web-issuetracker-maven/LogoutServlet"><i class="icon_key_alt"></i> Sair</a></li>
						</ul></li>
				</ul>
			</div>
		</header>
		<!-- Finaliza menu superior  <-------------------------------------------------------------------------------------------------------| -->




		<section id="main">
			<section class="wrapper">
				<!-- |-------------------------------------------------------------------------------------------------------- >  Inicia menu principal -->
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=home&descricao=Entrou na Home">Home</a></li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist">
							<a
								href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=novoTicket">
								<div class="info-box blue-bg">
									<i class="fa fa-plus-square" aria-hidden="true"></i>
									<h3>
										<div>Novo</div>
										<div class="title">Ticket</div>
									</h3>
								</div>
							</a>
							<!--/.info-box-->
							<!--/.col-->

							<a
								href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=listarTodosTickets&descricao=Listou todos os tickets">
								<div class="info-box dark-bg">
									<i class="fa fa-bars" aria-hidden="true"></i>

									<div class="count">Todos</div>
									<div class="title">  Os Tickets</div>
								</div>
							</a>
							<!--/.info-box-->
							<!--/.col-->

							<a
								href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=listarTicketsPendentes&descricao=Listou tickets pendentes">
								<div class="info-box orange-bg">
									<i class="fa fa-info-circle" aria-hidden="true"></i>
									<div class="title">  Tickets</div>
									<div class="count">Pendentes</div>
								</div>
							</a>
							<!--/.info-box-->
							<!--/.col-->

							<a
								href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=listarTicketsResolvidos&descricao=Listou tickets resolvidos">
								<div class="info-box green-bg">
									<i class="fa fa-thumbs-o-up"></i>
									<div class="title">os Tickets</div>
									<div class="count">Resolvidos</div>
								</div>
							</a>
							<!--/.info-box-->
							<!--/.col-->
						</div>
					</div>
					<!-- Finaliza menu principal  <------------------------------------------------------------------------------------------------------| -->