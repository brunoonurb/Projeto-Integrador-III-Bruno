
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="pt-br">


<jsp:include page="./home.jsp"></jsp:include>
<script>
function direcionar() {
	
	document.getElementById("conteudo3").innerHTML = '<object type="text/html" data="/fapi-poo-web-issuetracker-maven/CoordenadorServlet?acao=editarRespostaTicketGet&idUsuario='+idUsuario+'&respostaEditada='+respostaEditada+'&nomeUsuario='+nomeUsuario+'&sobrenomeUsuario='+sobrenomeUsuario+'&nivelUsuario='+nivelUsuario+'&idResposta='+idResposta+'" ></object>';
}
$(document).ready(function() {
    $('#myModal').modal('show');
})

</script>




  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Informativo</h4>
        </div>
        <div class="modal-body">
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
					href="/fapi-poo-web-issuetracker-maven/TicketsServlet?acao=home&descricao=Entrou na Home">Voltar</a>							
			</div>
		</div>
	</div>
        </div>
      </div>
      
    </div>
  </div>
  
