<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Issue Tracker</title>

<!-- Coloquei estes 2 links agora, caso der conflito,retirar -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">






<link href="/fapi-poo-web-issuetracker-maven/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/bootstrap-theme.css"
	rel="stylesheet">
<link
	href="/fapi-poo-web-issuetracker-maven/css/elegant-icons-style.css"
	rel="stylesheet" />
<link href="/fapi-poo-web-issuetracker-maven/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="/fapi-poo-web-issuetracker-maven/css/fullcalendar.css">
<link href="/fapi-poo-web-issuetracker-maven/css/widgets.css"
	rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/style.css"
	rel="stylesheet">
<link href="/fapi-poo-web-issuetracker-maven/css/style-responsive.css"
	rel="stylesheet" />
<link href="/fapi-poo-web-issuetracker-maven/css/xcharts.min.css"
	rel=" stylesheet">
<link
	href="/fapi-poo-web-issuetracker-maven/css/jquery-ui-1.10.4.min.css"
	rel="stylesheet">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
object {
	width: 100%;
	height: 530px;
	box-shadow: -5px 5px 1px -2px rgba(0, 0, 0, 0.2);
}
</style>
<script>
function direcionar() {
	respostaEditada = document.getElementById('respostaEditada').value;
	idUsuario = document.getElementById('idUsuario').value;
	nomeUsuario= document.getElementById('nomeUsuario').value;
	sobrenomeUsuario= document.getElementById('sobrenomeUsuario').value;
	nivelUsuario = document.getElementById('nivelUsuario').value;
	idResposta = document.getElementById('idResposta').value;

	document.getElementById("conteudo3").innerHTML = '<object type="text/html" data="/fapi-poo-web-issuetracker-maven/CoordenadorServlet?acao=editarRespostaTicketGet&idUsuario='+idUsuario+'&respostaEditada='+respostaEditada+'&nomeUsuario='+nomeUsuario+'&sobrenomeUsuario='+sobrenomeUsuario+'&nivelUsuario='+nivelUsuario+'&idResposta='+idResposta+'" ></object>';
}


function excluir(idDoSupervisor) {
	document.getElementById("conteudo3").innerHTML = '<object type="text/html" data="/fapi-poo-web-issuetracker-maven/CoordenadorServlet?acao=excluirSupervisor&id='
		+ idDoSupervisor + '" ></object>';
}



	function cadastro() {
		document.getElementById("conteudo3").innerHTML = '<object type="text/html" data="/fapi-poo-web-issuetracker-maven/coordenador/cadastroSupervisor.jsp" ></object>';
	}
	function editar(idSupervisor) {
		document.getElementById("conteudo3").innerHTML = '<object type="text/html" data="/fapi-poo-web-issuetracker-maven/CoordenadorServlet?acao=paginaEditarSupervisor&id='
				+ idSupervisor + '" ></object>';
	}

	$(document).ready(function() {

		$('#tecnicoEscolhido').change(function() {
			var idTecnico = $('#tecnicoEscolhido').val();
			var idTicket =$("#ticketId").text();
			$.ajax({
				type : "get",
				url : "CoordenadorServlet?acao=atribuirTecnico&descricao=Alterou tecnico do ticket",
				data : {
					idTicket : idTicket,
					idTecnico : idTecnico,
					
				},

				success : function(mensagem) {
					//alert('Passou com a mensagem : '+mensagem);
				}

			});
		});

	});
	
	
</script>

<body>


	<section id="container" class="">
		<!-- |--------------------------------------------------------------------------------------------------------- >
		Inicia menu superior -->
		<header class="header dark-bg">
			<a href="/fapi-poo-web-issuetracker-maven/coordenador/home.jsp" class="logo">Issue <span
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
							<li><i class="fa fa-home"></i><a href="/fapi-poo-web-issuetracker-maven/coordenador/administracaoTicketsBACKUP.jsp">Home</a></li>
						</ol>
					</div>
				</div>

				<div class="row">


					<div class="col-md-3">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist">
							<a
								href="/fapi-poo-web-issuetracker-maven/LogServlet?acao=listarLogAcesso&descricao=Listou logs de acessos">
								<div class="info-box green-bg">
									<i class="fas fa-sign-in-alt"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Logs de acessos</div>
								</div>
							</a> <a
								href="/fapi-poo-web-issuetracker-maven/LogServlet?acao=listarLogAcao&descricao=Listou logs de acoes">
								<div class="info-box linkedin-bg">
									<i class="fas fa-sign-in-alt"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Logs de ações</div>
								</div>
							</a> <a
								href="/fapi-poo-web-issuetracker-maven/CoordenadorServlet?acao=listarSupervisores&descricao=Listou supervisores">
								<div class="info-box dark-bg">
									<i class="fas fa-users"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Gestão de supervisores</div>
								</div>
							</a> <a
								href="/fapi-poo-web-issuetracker-maven/CoordenadorServlet?acao=listarTicketsAtribuidos&descricao=Listou tickets">
								<div class="info-box brown-bg">
									<i class="fas fa-ticket-alt"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Gestão de tickets</div>
								</div>
							</a> <a
								href="/fapi-poo-web-issuetracker-maven/CoordenadorServlet?acao=listarTecnicos&descricao=Listou tecnicos">
								<div class="info-box yellow-bg">
									<i class="fas fa-users"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Gestão de técnicos</div>
								</div>
							</a>
							<a
								href="/fapi-poo-web-issuetracker-maven/CoordenadorServlet?acao=listarCoordenadores&descricao=Listou coordenadores">
								<div class="info-box blue-bg">
									<i class="fas fa-users"></i>
									<div class="count">&nbsp;</div>
									<div class="title">Gestão e coordenadores</div>
								</div>
							</a>
						</div>
					</div>
					<!-- Finaliza menu principal  <------------------------------------------------------------------------------------------------------| -->





					<!-- |------------------------------------------------------------------------------------------------------ >  Inicia divisao do corpo -->
					<div id="conteudo3" class="col-md-9">
						<div id="teste" class="col-md-12" style="background-color: white;">