<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Meu Perfil</title>
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

<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<style type="text/css">
img {
	max-width: 100px;
}

input[type=file] {
	padding: 0px;
	background:;
}
</style>
</head>
<body>

	<!-- container section start -->
	<section id="container" class="">


		<header class="header dark-bg">


			<!--logo start-->
			<a href="homeTecnico.jsp" class="logo">Issue <span class="lite">Tracker</span></a>
			<!--logo end-->



			<div class="top-nav notification-row">

				<ul class="nav pull-right top-menu">
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <span class="profile-ava">
								<img alt="" src="../img/avatar-mini2.jpg">
						</span> <span class="username">Técnico</span> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu extended logout">
							<div class="log-arrow-up"></div>
							<li class="eborder-top"><a href="perfilTecnico.jsp"><i
									class="icon_profile"></i> Meu perfil</a></li>
							<li><a href="#"><i class="icon_key_alt"></i> Sair</a></li>
						</ul></li>
					<!-- user login dropdown end -->
				</ul>
				<!-- notificatoin dropdown end-->
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

							<a href="todosTicketsTecnico.jsp">
								<div class="info-box green-bg">
									<i class="fa fa-bars" aria-hidden="true"></i>
									<div class="count">1.426</div>
									<div class="title">Todos</div>
								</div>
							</a>
							<!--/.info-box-->
							<!--/.col-->

							<a href="pendentesTecnico.jsp">
								<div class="info-box orange-bg">
									<i class="fa fa-times" aria-hidden="true"></i>
									<div class="count">2</div>
									<div class="title">Pendentes</div>
								</div>
							</a>
							<!--/.info-box-->
							<!--/.col-->

							<a href="reabertosTecnico.jsp">
								<div class="info-box dark-bg">
									<i class="fa fa-refresh" aria-hidden="true"></i>
									<div class="count">1</div>
									<div class="title">Reabertos</div>
								</div>
							</a>
							<!--/.info-box-->
							<!--/.col-->

							<a href="resolvidosTecnico.jsp">
								<div class="info-box green-bg">
									<i class="fa fa-thumbs-o-up"></i>
									<div class="count">362</div>
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
									<i class="fa fa-pencil-square"> </i> Meu Perfil
								</h2>
								<br>




								<form>
									<div class="row">
										<div class="form-group col-md-6">
											<div class="form-row">
												<div class="form-group col-md-12">
													<label for="inputNome">Nome</label> <input type="text"
														class="form-control" id="inputNome"
														placeholder="Digite Nome" name="nome"
														pattern="[A-Za-z]+{50}" title="Nao foi possivel"
														value="Bruno">
												</div>
											</div>

											<div class="form-row">
												<div class="form-group col-md-12">
													<label for="inputSobrenome">Sobrenome</label> <input
														type="text" class="form-control" id="inputSobrenome"
														placeholder="Digite Sobrenome" name="sobrenome"
														pattern="[A-Za-z]+{50}" title="Nao foi possivel" value="">
												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-12">
													<label for="inputSobrenome">Email</label> <input
														type="text" class="form-control" id="inputSobrenome"
														placeholder="Digite Email" name="email"
														pattern="[A-Za-z]+{50}" title="Nao foi possivel"
														value="bruno@gmail.com">
												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-12">
													<label for="inputSenha">Senha</label> <input type="text"
														class="form-control" id="inputSenha"
														placeholder="Digite a senha" name="senha"
														pattern="[A-Za-z]+{50}" title="Nao foi possivel" value="">
												</div>
											</div>
										</div>
										<div class=" col-md-6">
											<div class="row" style="margin-right: 0">
												<div class="form-group col-md-12">
													<img id="blah" src="../imagens/fotoPerfil.jpg"
														alt="your image"
														style="min-width: 120px; max-height: 132px" /> <br>
													<input type='file' onchange="readURL(this);"
														name="foto-aluno" value="">



												</div>
											</div>
				
											<div class="form-row">
												<div class="form-group col-md-12">
													<label for="inputSobrenome">Confirmar Senha</label> <input
														type="text" class="form-control" id="inputConfirmarSenha"
														placeholder="Confirmar Senha" name="confirmarSenha"
														pattern="[A-Za-z]+{50}" title="Nao foi possivel" value="">
												</div>
											</div>
										</div>
									</div>
									<center>
										<button type="submit" class="btn btn-success">Atualizar</button>
									</center>
								</form>




							</div>
			</section>
		</section>
	</section>


</body>
</html>