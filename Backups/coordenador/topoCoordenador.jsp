<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Issue Tracker</title>

<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/elegant-icons-style.css" rel="stylesheet" />
<link href="../css/font-awesome.min.css" rel="stylesheet" />
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="../css/fullcalendar.css">
<link href="../css/widgets.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link href="../css/style-responsive.css" rel="stylesheet" />
<link href="../css/xcharts.min.css" rel=" stylesheet">
<link href="../css/jquery-ui-1.10.4.min.css" rel="stylesheet">
</head>



<body>


	<section id="container" class="">
		<!-- |--------------------------------------------------------------------------------------------------------- >
		Inicia menu superior -->
		<header class="header dark-bg">
			<a href="./homeCoordenador.jsp" class="logo">Issue <span
				class="lite">Tracker</span></a>
			<div class="top-nav notification-row">
				<ul class="nav pull-right top-menu">
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <span class="profile-ava">
								<img alt="" src="../img/avatar-mini2.jpg">
						</span> <span class="username">Coordenador</span> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu extended logout">
							<div class="log-arrow-up"></div>
							<li class="eborder-top"><a href="#"><i
									class="icon_profile"></i> Meu perfil</a></li>
							<li><a href="#"><i class="icon_key_alt"></i> Sair</a></li>
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
							<li><i class="fa fa-home"></i><a
								href="./home.jsp">Home</a></li>
						</ol>
					</div>
				</div>

				<div class="row">


					<div class="col-md-3">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist">
							<a href="./logAcesso.jsp">
								<div class="info-box green-bg">
									<i class="fa fa-eye" aria-hidden="true"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Logs de Acessos</div>
								</div>
							</a> <a href="./logAcao.jsp">
								<div class="info-box linkedin-bg">
									<i class="fa fa-eye" aria-hidden="true"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Logs de Ações</div>
								</div>
							</a> <a href="./relatorioClientes.jsp">
								<div class="info-box brown-bg">
									<i class="fa fa-archive"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Relatorio de Clientes</div>
								</div>
							</a> <a href="relatorioTecnicos.jsp">
								<div class="info-box yellow-bg">
									<i class="fa fa-archive"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Relatorio de Tecnicos</div>
								</div>
							</a> <a href="relatorioSupervisores.jsp">
								<div class="info-box teal-bg">
									<i class="fa fa-archive"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Relatorio de Supervisores</div>
								</div>
							</a> <a href="relatorioCoordenadores.jsp">
								<div class="info-box blue-bg">
									<i class="fa fa-archive"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Relatorio de Coordenadores</div>
								</div>
							</a>
						</div>
					</div>
					<!-- Finaliza menu principal  <------------------------------------------------------------------------------------------------------| -->





					<!-- |------------------------------------------------------------------------------------------------------ >  Inicia divisao do corpo -->
					<div class="col-md-9">
						<div id="teste" class="col-md-12" style="background-color: white;">