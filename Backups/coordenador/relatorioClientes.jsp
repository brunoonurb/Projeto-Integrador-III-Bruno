
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<jsp:include page="./topoCoordenador.jsp"></jsp:include>



<h2>
	<i class="fa fa-archive"></i> Relatório de Clientes
</h2>



<div class="panel-heading ">
	<h6 class="panel-title ">
		<table class="table  brown-bg ">
			<tr align="center">
				<td class="col-md-1 text-center" style="color: white;">Protocolo</td>
				<td class="col-md-2 text-center" style="color: white;">Data</td>
				<td class="col-md-2 text-center" style="color: white;">Cliente</td>
				<td class="col-md-3 text-center" style="color: white;">Assunto</td>
				<td class="col-md-1 text-center" style="color: white;">Situação</td>
				<td class="col-md-1 text-center" style="color: white;">Ticket</td>
				<td class="col-md-2 text-center" style="color: white;">Técnico</td>
			</tr>
		</table>
	</h6>
</div>




<div class="panel-group " id="accordion">

	<div class="panel panel-brown-bg ">
	
		<div class="panel-heading">
			<h6 class="panel-title ">
				<table class="table table-hover ">
					<tr align="center">
						<td class="col-md-1 text-center" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapse">#0125</td>

						<td class="col-md-2 text-center" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapse">27/08/2019</td>

						<td class="col-md-2 text-center" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapse">Matheus
							Navalho</td>

						<td class="col-md-3 text-center" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapse">PC inicia mas desliga no boot</td>

						<td class="col-md-1 text-center" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapse"><span
							class="badge bg-success m-0">Resolvido</span></td>

						<td class="col-md-1 text-center">1'54"</td>
						<td class="col-md-2 text-center"><select ><option>João Alfredo</option><option>Victor Alfredo</option><option>Carlos Ramalho</option></select></td>
					</tr>
				</table>
			</h6>
		</div>



		<div id="collapse" class="panel-collapse collapse">
			<div class="panel-body">
				<ul class="comment-section">
					<div class="row justify-content-center">
						<div class="row col-md-10 text-justify">
							<li class="comment user-comment">
							
							
							
							<div class="info">
									<a href="#">Thiago de Andrade </a> <span> 27/08/2019 - 19:08</span>
								</div> <a class="avatar" href="#"> <img
									src="../img/tickets/avatarCliente.jpg" width="35"
									alt="Profile Avatar" title="Cliente" />
							</a>
							
								<h4 class="font-weight-bold">
									<b>Bom dia, hj a tarde fui usar meu computador, ele iniciou, mas quando passou pela tela do boot logo travou e desligou. Não sei o que posso fazer! </b>
								</h4>
							</li>
						</div>
					</div>
					<hr class="border-20">
					<li class="comment user-comment">
						<div class="info">
							<a href="#">Surporte Tecnico</a> <span>4 hours ago</span>
						</div> <a class="avatar" href="#"> <img src="../img/tickets/avatarSistema.jpg"
							width="35" alt="Profile Avatar" title="Suporte" />
					</a>
						<p>Bom dia senhor Thiago de Andrade, o senhor tentou resetar a BIOS?</p>
					</li>
					<li class="comment author-comment">
						<div class="info">
							<a href="#">Thiago de Andrade</a> <span>3 hours ago</span>
						</div> <a class="avatar" href="#"> <img
							src="../img/tickets/avatarCliente.jpg" width="35" alt="Profile Avatar"
							title="Cliente" />
					</a>
						<p>Ainda não, como posso fazer isso?</p>
					</li>
					<li class="comment user-comment">
						<div class="info">
							<a href="#">Surporte Tecnico</a> <span>1 hour ago</span>
						</div> <a class="avatar" href="#"> <img src="../img/tickets/avatarSistema.jpg"
							width="35" alt="Profile Avatar" title="Suporte" />
					</a>
						<p>O senhor pode fazer de duas formas: Com o computador desligado, na sua placa, o senhor pode retirar a bateria por 5 segundos ou retirar o jumper da mesma por 5 segundos e depois colocar novamente </p>
					</li>
					<li class="comment author-comment">

						<div class="info">
							<a href="#">Thiago de Andrade</a> <span>1 hour ago</span>
						</div> <a class="avatar" href="#"> <img
							src="../img/tickets/avatarCliente.jpg" width="35" alt="Profile Avatar"
							title="Cliente" />
					</a>
						<p>Deu certo!! Retirei a bateria por 5 segundos, coloquei novamente e depois iniciei o PC e agora esta funcionando normal, muito obrigado!</p>
					</li>
				</ul>
				<form action="#" method="post">
					<div class="form-group">
						<label for="Descricao-text" class="col-form-label"><b>Responder:<b></label>
						<textarea class="form-control" placeholder="Digite sua resposta"
							id="resposta" height="500px"></textarea>
						<img src="../images/avatar_author.jpg" width="35"
							alt="Profile of Bradley Jones" title="Bradley Jones" />
						<button type="submit">Enviar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>







<jsp:include page="./rodapeCoordenador.jsp"></jsp:include>

