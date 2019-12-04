<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<!-- Bootstrap CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<!-- font icon -->
<link href="../css/elegant-icons-style.css" rel="stylesheet" />
<link href="../css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles -->
<link rel="stylesheet" href="../css/fullcalendar.css">
<link href="../css/widgets.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link href="../css/style-responsive.css" rel="stylesheet" />
<link href="../css/xcharts.min.css" rel=" stylesheet">
<link href="../css/jquery-ui-1.10.4.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- container section start -->
	<section id="container" class="">


		<header class="header dark-bg">


			<!--logo start-->
			<a href="homeCliente.jsp" class="logo">Issue <span class="lite">Tracker</span></a>
			<!--logo end-->


			<div class="top-nav notification-row">

				<ul class="nav pull-right top-menu">
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <span class="profile-ava">
								<img alt="" src="../img/avatar-mini2.jpg">
						</span> <span class="username">cliente</span> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu extended logout">
							<div class="log-arrow-up"></div>
							<li class="eborder-top"><a href="perfilCliente.jsp"><i
									class="icon_profile"></i> Meu perfil</a></li>
							<li><a href="#"><i class="icon_key_alt"></i> Sair</a></li>
						</ul></li>
					<!-- user login dropdown end -->
				</ul>
				<!-- notificatoin  dropdown end-->
			</div>
		</header>
		<!--header end-->

		<!--main content start-->
		<section id="main">
			<section class="wrapper">
				<!--overview start-->
				<div class="row">
					<div class="col-md-3">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist">

							<a href="novoTicket.jsp">
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

							<a href="todosTic.jsp">
								<div class="info-box dark-bg">
									<i class="fa fa-bars" aria-hidden="true"></i>

									<div class="count">9</div>
									<div class="title">Todos</div>
								</div>
							</a>
							<!--/.info-box-->
							<!--/.col-->

							<a href="pendentes.jsp">
								<div class="info-box orange-bg">
									<i class="fa fa-info-circle" aria-hidden="true"></i>
									<div class="count">6</div>
									<div class="title">Pendentes</div>
								</div>
							</a>
							<!--/.info-box-->
							<!--/.col-->

							<a href="resolvidos.jsp">
								<div class="info-box green-bg">
									<i class="fa fa-thumbs-o-up"></i>
									<div class="count">6</div>
									<div class="title">Resolvidos</div>
								</div>
							</a>
							<!--/.info-box-->
							<!--/.col-->


						</div>
					</div>
					<div class="col-md-9">
						<div id="teste" class="col-md-12" style="background-color: white;">
							<!---bruno------------------>
							<div class="container">
								<h2>
									<i class="fa fa-bars" aria-hidden="true"></i> Home?
								</h2>
								


								
							</div>
						</div>
			</section>
		</section>
	</section>

</body>
</html>