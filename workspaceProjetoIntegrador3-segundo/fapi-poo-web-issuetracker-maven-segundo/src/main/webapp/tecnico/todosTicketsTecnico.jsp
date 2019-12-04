<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todos os Tickets</title>
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
			<a href="homeTecnico.jsp" class="logo">Issue <span class="lite">Tracker</span></a>
			<!--logo end-->



			<div class="top-nav notification-row">

				<ul class="nav pull-right top-menu">
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <span class="profile-ava">
								<img alt="" src="../img/avatar-mini2.jpg">
						</span> <span class="username">T�cnico</span> <b class="caret"></b>
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
							<div class="main">
								<!---bruno------------------>
								<div class="container">
									<h2>Todos os tickets</h2>
									<p>
										<strong>Note:</strong> <span class="badge bg-info m-0">Todos</span>
									</p>


									<div class="panel-group " id="accordion">

										<!-- AQUI COMECA A LINAH ATABALA -->
										<div class="panel panel-success ">
											<div class="panel-heading">
												<h6 class="panel-title ">
													<a data-toggle="collapse" data-parent="#accordion"
														href="#collapse1">

														<table class="table table-hover mb-0 ">
															<tr class="table">
																<td class="col-md-1">#1</td>
																<td class="col-md-3">mar�o 30, 2019</td>
																<td class="col-md-2"><span
																	class="badge bg-success m-0">Resolvido</span></td>
																<td class="col-md-4">problema inas mensagem</td>
																<td class="col-md-2"><button type="button"
																		class="btn btn-success" disabled>Resolvido</button></td>
															</tr>
														</table>
													</a>
												</h6>
											</div>
											<div id="collapse1" class="panel-collapse collapse">
												<div class="panel-body">


													<ul class="comment-section">
														<div class="row justify-content-center">

															<div class="row col-md-10 text-justify">
																<li class="comment user-comment">

																	<div class="info">
																		<a href="#">Bruno Pedroso </a> <span>4 hours
																			ago</span>
																	</div> <a class="avatar" href="#"> <img
																		src="../images/avatar_author.jpg" width="35"
																		alt="Profile Avatar" title="Anie Silverston" />
																</a>

																	<h4 class="font-weight-bold">
																		<b>Estava tentando ligar meu computador mas nao
																			estou consegindo ja instalei tudo que consegui mas
																			nao posso fazer mais nada nao tenho nem ideia oque
																			podera ser entao to oque tentei nao deu resultado</b>
																	</h4>

																</li>
															</div>

														</div>
														<hr class="border-20">

														<li class="comment user-comment">

															<div class="info">
																<a href="#">Surporte Tecnico</a> <span>4 hours
																	ago</span>
															</div> <a class="avatar" href="#"> <img
																src="../images/avatarD.jpg" width="35"
																alt="Profile Avatar" title="Anie Silverston" />
														</a>

															<p>Suspendisse gravida sem?</p>

														</li>

														<li class="comment author-comment">

															<div class="info">
																<a href="#">Bruno Pedroso</a> <span>3 hours ago</span>
															</div> <a class="avatar" href="#"> <img
																src="../images/avatar_author.jpg" width="35"
																alt="Profile Avatar" title="Jack Smith" />
														</a>

															<p>Lorem ipsum dolor sit amet, consectetur adipiscing
																elit. Suspendisse gravida sem sit amet molestie
																portitor.</p>

														</li>

														<li class="comment user-comment">

															<div class="info">
																<a href="#">Surporte Tecnico</a> <span>1 hour ago</span>
															</div> <a class="avatar" href="#"> <img
																src="../images/avatarD.jpg" width="35"
																alt="Profile Avatar" title="Bradley Jones" />
														</a>

															<p>Suspendisse gravida sem sit amet molestie
																portitor?</p>

														</li>
														<li class="comment author-comment">

															<div class="info">
																<a href="#">Bruno Pedroso</a> <span>1 hour ago</span>
															</div> <a class="avatar" href="#"> <img
																src="../images/avatar_author.jpg" width="35"
																alt="Profile Avatar" title="Jack Smith" />
														</a>
															<p>Lorem ipsum dolor sit amet, consectetur adipiscing
																elit. Suspendisee gravida sem sit amet molestie
																porttitor?.</p>
														</li>
													</ul>
													<form action="#" method="post">
														<div class="form-group">
															<label for="Descri��o-text" class="col-form-label"><b>Responder:<b></label>
															<textarea class="form-control"
																placeholder="Digite sua resposta" id="resposta"
																height="500px"></textarea>
															<img src="../images/avatar_author.jpg" width="35"
																alt="Profile of Bradley Jones" title="Bradley Jones" />
															<button type="submit">Enviar</button>
														</div>
													</form>


												</div>
											</div>
										</div>
										<div class="panel panel-info">
											<div class="panel-heading">
												<h6 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion"
														href="#collapse2">
														<table class="table table-hover mb-0 ">
															<tr class="table">
																<td class="col-md-1">#2</td>
																<td class="col-md-3">Agosto 20, 2019</td>
																<td class="col-md-2"><span
																	class="badge bg-info m-0">Em Processo</span></td>
																<td class="col-md-4">problema inas mensagem</td>
																<td class="col-md-2"><button type="button"
																		class="btn btn-success">Resolvido</button></td>
															</tr>
														</table>
													</a>
												</h6>
											</div>
											<div id="collapse2" class="panel-collapse collapse">
												<div class="panel-body">

													<ul class="comment-section">
														<div class="row justify-content-center">

															<div class="row col-md-10 text-justify">
																<li class="comment user-comment">

																	<div class="info">
																		<a href="#">Bruno Pedroso </a> <span>4 hours
																			ago</span>
																	</div> <a class="avatar" href="#"> <img
																		src="../images/avatar_author.jpg" width="35"
																		alt="Profile Avatar" title="Anie Silverston" />
																</a>

																	<h4 class="font-weight-bold">
																		<b>Estava tentando ligar meu computador mas nao
																			estou consegindo ja instalei tudo que consegui mas
																			nao posso fazer mais nada nao tenho nem ideia oque
																			podera ser entao to oque tentei nao deu resultado</b>
																	</h4>

																</li>
															</div>

														</div>
														<hr class="border-20">

														<li class="comment user-comment">

															<div class="info">
																<a href="#">Surporte Tecnico</a> <span>4 hours
																	ago</span>
															</div> <a class="avatar" href="#"> <img
																src="../images/avatarD.jpg" width="35"
																alt="Profile Avatar" title="Anie Silverston" />
														</a>

															<p>Suspendisse gravida sem?</p>

														</li>

														<li class="comment author-comment">

															<div class="info">
																<a href="#">Bruno Pedroso</a> <span>3 hours ago</span>
															</div> <a class="avatar" href="#"> <img
																src="../images/avatar_author.jpg" width="35"
																alt="Profile Avatar" title="Jack Smith" />
														</a>

															<p>Lorem ipsum dolor sit amet, consectetur adipiscing
																elit. Suspendisse gravida sem sit amet molestie
																portitor.</p>

														</li>

														<li class="comment user-comment">

															<div class="info">
																<a href="#">Surporte Tecnico</a> <span>1 hour ago</span>
															</div> <a class="avatar" href="#"> <img
																src="../images/avatarD.jpg" width="35"
																alt="Profile Avatar" title="Bradley Jones" />
														</a>

															<p>Suspendisse gravida sem sit amet molestie
																portitor?</p>

														</li>
														<li class="comment author-comment">

															<div class="info">
																<a href="#">Bruno Pedroso</a> <span>1 hour ago</span>
															</div> <a class="avatar" href="#"> <img
																src="../images/avatar_author.jpg" width="35"
																alt="Profile Avatar" title="Jack Smith" />
														</a>
															<p>Lorem ipsum dolor sit amet, consectetur adipiscing
																elit. Suspendisee gravida sem sit amet molestie
																porttitor?.</p>
														</li>
													</ul>
													<form action="#" method="post">
														<div class="form-group">
															<label for="Descri��o-text" class="col-form-label"><b>Responder:<b></label>
															<textarea class="form-control"
																placeholder="Digite sua resposta" id="resposta"
																height="500px"></textarea>
															<img src="../images/avatar_author.jpg" width="35"
																alt="Profile of Bradley Jones" title="Bradley Jones" />
															<button type="submit">Enviar</button>
														</div>
													</form>

												</div>
											</div>
										</div>

										<!--aqui-->
										<div class="panel panel-warning">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion"
														href="#collapse3">
														<table class="table table-hover mb-0 ">
															<tr class="table">
																<td class="col-md-1">#3</td>
																<td class="col-md-3">Agosto 24, 2019</td>
																<td class="col-md-2"><span
																	class="badge bg-warning m-0">Pendente T�cnico</span></td>
																<td class="col-md-4">problema inas mensagem</td>
																<td class="col-md-2"><button type="button"
																		class="btn btn-success">Resolvido</button></td>
															</tr>
														</table>
													</a>
												</h4>
											</div>
											<div id="collapse3" class="panel-collapse collapse">
												<div class="panel-body">

													<ul class="comment-section">
														<div class="row justify-content-center">

															<div class="row col-md-10 text-justify">
																<li class="comment user-comment">

																	<div class="info">
																		<a href="#">Bruno Pedroso </a> <span>4 hours
																			ago</span>
																	</div> <a class="avatar" href="#"> <img
																		src="images/avatar_author.jpg" width="35"
																		alt="Profile Avatar" title="Anie Silverston" />
																</a>

																	<h4 class="font-weight-bold">
																		<b>Estava tentando ligar meu computador mas nao
																			estou consegindo ja instalei tudo que consegui mas
																			nao posso fazer mais nada nao tenho nem ideia oque
																			podera ser entao to oque tentei nao deu resultado</b>
																	</h4>

																</li>
															</div>

														</div>
														<hr class="border-20">

														<li class="comment user-comment">

															<div class="info">
																<a href="#">Surporte Tecnico</a> <span>4 hours
																	ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatarD.jpg" width="35" alt="Profile Avatar"
																title="Anie Silverston" />
														</a>

															<p>Suspendisse gravida sem?</p>

														</li>

														<li class="comment author-comment">

															<div class="info">
																<a href="#">Bruno Pedroso</a> <span>3 hours ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatar_author.jpg" width="35"
																alt="Profile Avatar" title="Jack Smith" />
														</a>

															<p>Lorem ipsum dolor sit amet, consectetur adipiscing
																elit. Suspendisse gravida sem sit amet molestie
																portitor.</p>

														</li>

														<li class="comment user-comment">

															<div class="info">
																<a href="#">Surporte Tecnico</a> <span>1 hour ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatarD.jpg" width="35" alt="Profile Avatar"
																title="Bradley Jones" />
														</a>

															<p>Suspendisse gravida sem sit amet molestie
																portitor?</p>

														</li>
														<li class="comment author-comment">

															<div class="info">
																<a href="#">Bruno Pedroso</a> <span>1 hour ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatar_author.jpg" width="35"
																alt="Profile Avatar" title="Jack Smith" />
														</a>
															<p>Lorem ipsum dolor sit amet, consectetur adipiscing
																elit. Suspendisee gravida sem sit amet molestie
																porttitor?.</p>
														</li>
													</ul>
													<form action="#" method="post">
														<div class="form-group">
															<label for="Descri��o-text" class="col-form-label"><b>Responder:<b></label>
															<textarea class="form-control"
																placeholder="Digite sua resposta" id="resposta"
																height="500px"></textarea>
															<img src="images/avatar_author.jpg" width="35"
																alt="Profile of Bradley Jones" title="Bradley Jones" />
															<button type="submit">Enviar</button>
														</div>
													</form>

												</div>
											</div>
										</div>
										<!--aqui-->
										<div class="panel panel-warning">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion"
														href="#collapse5">
														<table class="table table-hover mb-0 ">
															<tr class="table">
																<td class="col-md-1">#4</td>
																<td class="col-md-3">Agosto 24, 2019</td>
																<td class="col-md-2"><span
																	class="badge bg-warning m-0">Pendente Usu�rio</span></td>
																<td class="col-md-4">problema inas mensagem</td>
																<td class="col-md-2"><button type="button"
																		class="btn btn-success">Resolvido</button></td>
															</tr>
														</table>
													</a>
												</h4>
											</div>
											<div id="collapse5" class="panel-collapse collapse">
												<div class="panel-body">

													<ul class="comment-section">
														<div class="row justify-content-center">

															<div class="row col-md-10 text-justify">
																<li class="comment user-comment">

																	<div class="info">
																		<a href="#">Bruno Pedroso </a> <span>4 hours
																			ago</span>
																	</div> <a class="avatar" href="#"> <img
																		src="images/avatar_author.jpg" width="35"
																		alt="Profile Avatar" title="Anie Silverston" />
																</a>

																	<h4 class="font-weight-bold">
																		<b>Estava tentando ligar meu computador mas nao
																			estou consegindo ja instalei tudo que consegui mas
																			nao posso fazer mais nada nao tenho nem ideia oque
																			podera ser entao to oque tentei nao deu resultado</b>
																	</h4>

																</li>
															</div>

														</div>
														<hr class="border-20">

														<li class="comment user-comment">

															<div class="info">
																<a href="#">Surporte Tecnico</a> <span>4 hours
																	ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatarD.jpg" width="35" alt="Profile Avatar"
																title="Anie Silverston" />
														</a>

															<p>Suspendisse gravida sem?</p>

														</li>

														<li class="comment author-comment">

															<div class="info">
																<a href="#">Bruno Pedroso</a> <span>3 hours ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatar_author.jpg" width="35"
																alt="Profile Avatar" title="Jack Smith" />
														</a>

															<p>Lorem ipsum dolor sit amet, consectetur adipiscing
																elit. Suspendisse gravida sem sit amet molestie
																portitor.</p>

														</li>

														<li class="comment user-comment">

															<div class="info">
																<a href="#">Surporte Tecnico</a> <span>1 hour ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatarD.jpg" width="35" alt="Profile Avatar"
																title="Bradley Jones" />
														</a>

															<p>Suspendisse gravida sem sit amet molestie
																portitor?</p>

														</li>
														<li class="comment author-comment">

															<div class="info">
																<a href="#">Bruno Pedroso</a> <span>1 hour ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatar_author.jpg" width="35"
																alt="Profile Avatar" title="Jack Smith" />
														</a>
															<p>Lorem ipsum dolor sit amet, consectetur adipiscing
																elit. Suspendisee gravida sem sit amet molestie
																porttitor?.</p>
														</li>
													</ul>
													<form action="#" method="post">
														<div class="form-group">
															<label for="Descri��o-text" class="col-form-label"><b>Responder:<b></label>
															<textarea class="form-control"
																placeholder="Digite sua resposta" id="resposta"
																height="500px"></textarea>
															<img src="images/avatar_author.jpg" width="35"
																alt="Profile of Bradley Jones" title="Bradley Jones" />
															<button type="submit">Enviar</button>
														</div>
													</form>

												</div>
											</div>
										</div>
										<!--aqui-->
										<div class="panel panel-danger">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion"
														href="#collapse6">
														<table class="table table-hover mb-0 ">
															<tr class="table">
																<td class="col-md-1">#5</td>
																<td class="col-md-3">Agosto 24, 2019</td>
																<td class="col-md-2"><span
																	class="badge bg-primary m-0">Reaberto</span></td>
																<td class="col-md-4">problema inas mensagem</td>
																<td class="col-md-2"><button type="button"
																		class="btn btn-success">Resolvido</button></td>
															</tr>
														</table>
													</a>
												</h4>
											</div>
											<div id="collapse6" class="panel-collapse collapse">
												<div class="panel-body">

													<ul class="comment-section">
														<div class="row justify-content-center">

															<div class="row col-md-10 text-justify">
																<li class="comment user-comment">

																	<div class="info">
																		<a href="#">Bruno Pedroso </a> <span>4 hours
																			ago</span>
																	</div> <a class="avatar" href="#"> <img
																		src="images/avatar_author.jpg" width="35"
																		alt="Profile Avatar" title="Anie Silverston" />
																</a>

																	<h4 class="font-weight-bold">
																		<b>Estava tentando ligar meu computador mas nao
																			estou consegindo ja instalei tudo que consegui mas
																			nao posso fazer mais nada nao tenho nem ideia oque
																			podera ser entao to oque tentei nao deu resultado</b>
																	</h4>

																</li>
															</div>

														</div>
														<hr class="border-20">

														<li class="comment user-comment">

															<div class="info">
																<a href="#">Surporte Tecnico</a> <span>4 hours
																	ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatarD.jpg" width="35" alt="Profile Avatar"
																title="Anie Silverston" />
														</a>

															<p>Suspendisse gravida sem?</p>

														</li>

														<li class="comment author-comment">

															<div class="info">
																<a href="#">Bruno Pedroso</a> <span>3 hours ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatar_author.jpg" width="35"
																alt="Profile Avatar" title="Jack Smith" />
														</a>

															<p>Lorem ipsum dolor sit amet, consectetur adipiscing
																elit. Suspendisse gravida sem sit amet molestie
																portitor.</p>

														</li>

														<li class="comment user-comment">

															<div class="info">
																<a href="#">Surporte Tecnico</a> <span>1 hour ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatarD.jpg" width="35" alt="Profile Avatar"
																title="Bradley Jones" />
														</a>

															<p>Suspendisse gravida sem sit amet molestie
																portitor?</p>

														</li>
														<li class="comment author-comment">

															<div class="info">
																<a href="#">Bruno Pedroso</a> <span>1 hour ago</span>
															</div> <a class="avatar" href="#"> <img
																src="images/avatar_author.jpg" width="35"
																alt="Profile Avatar" title="Jack Smith" />
														</a>
															<p>Lorem ipsum dolor sit amet, consectetur adipiscing
																elit. Suspendisee gravida sem sit amet molestie
																porttitor?.</p>
														</li>
													</ul>
													<form action="#" method="post">
														<div class="form-group">
															<label for="Descri��o-text" class="col-form-label"><b>Responder:<b></label>
															<textarea class="form-control"
																placeholder="Digite sua resposta" id="resposta"
																height="500px"></textarea>
															<img src="images/avatar_author.jpg" width="35"
																alt="Profile of Bradley Jones" title="Bradley Jones" />
															<button type="submit">Enviar</button>
														</div>
													</form>

												</div>
											</div>
										</div>
									</div>
								</div>
			</section>
		</section>
	</section>
	</br>


</body>
</html>