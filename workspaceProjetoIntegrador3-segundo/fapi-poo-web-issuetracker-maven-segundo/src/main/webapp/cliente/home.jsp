<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!-- include para menu de funcionalidade -->

<jsp:include page="./topoCliente.jsp"></jsp:include>

<!-- include para menu de funcionalidade -->
<div class="col-md-9">
	<div id="teste" class="col-md-12" style="background-color: white;">
		<!---bruno------------------>
		<div class="container">
			<h3>
				<i class="fa fa-bars" aria-hidden="true"></i> Relatorio geral da Empresa ${sessionScope.empresa}.
			</h3>
			</br>
			<div class="row col-md-12">
				<div id="container1"></div>
			</div>
			</br>
			<div class="row">
				<div class="col-md-6">
					<div id="container2"></div>
				</div>

				<div class="col-md-6">
					<div id="container3"></div>
				</div>
			</div>



		</div>
	</div>


	<script>
	var empresa = "<c:out value='${sessionScope.empresa}'/>";
	
		anychart
				.onDocumentReady(function() {
					// set chart theme
					anychart.theme('pastel');
					// create data set on our data
					var dataSet = anychart.data.set(getData1());

					// map data for the first series, take x from the zero column and value from the first column of data set
					var seriesData_1 = dataSet.mapAs({
						'x' : 0,
						'value' : 1
					});

					// map data for the second series, take x from the zero column and value from the second column of data set
					var seriesData_2 = dataSet.mapAs({
						'x' : 0,
						'value' : 2
					});

					// create bar chart
					var chart = anychart.bar3d();

					// set chart padding
					chart.padding([ 10, 20, 5, 20 ]);

					// force chart to stack values by Y scale.
					chart.yScale().stackMode('value');

					chart.yAxis().labels().format(function() {
						return Math.abs(this.value).toLocaleString();
					});

					// set titles for Y-axis
					chart.yAxis().title('Quantidadde de tickets');

					// turn on exstra axis for simmetry
					chart.xAxis(1).enabled(true).orientation('right');

					// set chart title text settings
					chart
							.title('Funcionarios da empresa ' + empresa +' e situacao dos tickets');

					chart.interactivity().hoverMode('by-x');
					chart
							.tooltip()
							.displayMode('separated')
							.positionMode('point')
							.title(false)
							.separator(false)
							.useHtml(true)
							.fontSize(12)
							.offsetX(5)
							.offsetY(0)
							.format(
									function() {
										return '<span style="color: #D9D9D9"></span>'
												+ Math.abs(this.value)
														.toLocaleString();
									});

					// temp variable to store series instance
					var series;

					// create first series with mapped data
					series = chart.bar(seriesData_1);
					series.name('Processo');
					series.tooltip().position('right').anchor('left-center');

					// create second series with mapped data
					series = chart.bar(seriesData_2);
					series.name('Resolvido');
					series.tooltip().position('left').anchor('left-center');

					// turn on legend
					chart.legend().enabled(true).inverted(true).fontSize(13)
							.padding([ 0, 0, 20, 0 ]);

					chart.zAspect('100%');

					// set container id for the chart
					chart.container('container3');

					// initiate chart drawing
					chart.draw();
				});

		var vetores = [];

		var nome = 'erro';
		var t_processo,t_finalizado,t_resolvido,t_pendente,t_novo,t_reaberto;
		var i = 0;

		</script>



		<c:forEach items="${responseHomes2}" var="reshome2">
			<script>
			nome = "<c:out value='${reshome2.cliente}'/>";
			t_processo = "<c:out value='${reshome2.t_processo}'/>";
			t_finalizado = "<c:out value='${reshome2.t_finalizado}'/>";
			t_resolvido = "<c:out value='${reshome2.t_resolvido}'/>";
			t_pendente = "<c:out value='${reshome2.t_pendente}'/>";
			t_novo = "<c:out value='${reshome2.t_novo}'/>";
			t_reaberto = "<c:out value='${reshome2.t_reaberto}'/>";
		
			
			vetores[i] = [ nome, t_processo, -t_finalizado ];
			i ++;
			
			</script>

		</c:forEach>

		<script>
		
		
		/* for (var i = 1; i <= 5; i++) {

			vetores[i] = [ i + nome, n, -i + 40 ];
		} */
		console.log('local');
		console.log(vetores);

		var valores = [];
		valores = vetores;

		function getData1() {
			return valores;

		}
	</script>


	<script>
		anychart.onDocumentReady(function() {
			// set chart theme
			anychart.theme('pastel');
			// create data set on our data
			var dataSet = anychart.data.set(getData());

			// map data for the first series, take x from the zero column and value from the first column of data set
			var seriesData_1 = dataSet.mapAs({
				'x' : 0,
				'value' : 1
			});

			// map data for the second series, take x from the zero column and value from the second column of data set
			var seriesData_2 = dataSet.mapAs({
				'x' : 0,
				'value' : 2
			});

			// map data for the third series, take x from the zero column and value from the third column of data set
			var seriesData_3 = dataSet.mapAs({
				'x' : 0,
				'value' : 3
			});

			// create line chart
			var chart = anychart.line();

			// turn on chart animation
			chart.animation(true);

			// set chart padding
			chart.padding([ 10, 20, 5, 20 ]);

			// turn on the crosshair
			chart.crosshair().enabled(true).yLabel(false).yStroke(null);

			// set tooltip mode to point
			chart.tooltip().positionMode('point');

			// set chart title text settings
			chart.title('Tickets criado ao longo do tempo.');

			// set yAxis title
			chart.yAxis().title('Numero de tickets criado');
			chart.xAxis().labels().padding(5);

			chart.xScale().mode('continuous');

			// create first series with mapped data
			var series_1 = chart.line(seriesData_1);
			series_1.name('novo');
			series_1.hovered().markers().enabled(true).type('circle').size(4);
			series_1.tooltip().position('right').anchor('left-center').offsetX(
					5).offsetY(5);

			// create second series with mapped data
			var series_2 = chart.line(seriesData_2);
			series_2.name('Em processo');
			series_2.hovered().markers().enabled(true).type('circle').size(4);
			series_2.tooltip().position('right').anchor('left-center').offsetX(
					5).offsetY(5);

			// create third series with mapped data
			var series_3 = chart.line(seriesData_3);
			series_3.name('Resolvido');
			series_3.hovered().markers().enabled(true).type('circle').size(4);
			series_3.tooltip().position('right').anchor('left-center').offsetX(
					5).offsetY(5);

			// turn the legend on
			chart.legend().enabled(true).fontSize(13).padding([ 0, 0, 10, 0 ]);

			// set container id for the chart
			chart.container('container1');
			// initiate chart drawing
			chart.draw();
		});

		var vetor = [ 'JAN', 3, 2, 1, 8 ];
		var vetore = [];

		var m,p,n,f;
		var i = 0;
	</script>



	<c:forEach items="${responseHomes}" var="reshome">
		<script>
		m = "<c:out value='${reshome.data}'/>";
		p = "<c:out value='${reshome.processo}'/>";
		f = "<c:out value='${reshome.finalizado}'/>";
		n = "<c:out value='${reshome.novo}'/>";
		
		vetore[i] = [m,n, p, f];
		i ++;
		</script>

	</c:forEach>

	<script>
		/* for(var i = 1; i <=10 ; i++ ){

		 vetore[i] = [i+m, n, i+2, i+1,i+5];
		 } */
		console.log('local');
		console.log(vetore);

		var vv = [];
		vv = vetore;

		function getData() {
			return vv;
		}

		/*=========== outro ==================================================================================================*/
		anychart.onDocumentReady(function() {
			// set chart theme
			/*
			t_resolvido ;
			t_pendente ;
			t_novo ;
			t_reaberto ;*/
		
			anychart.theme('pastel');
			// create pie chart with passed data
			var chart = anychart.pie3d([ [ 'Novo', t_novo ], [ '', ],
					[ 'Resolvido', t_resolvido ], [ '', ],
					[ 'Pendente', t_pendente ],
					[ 'Reaberto', t_reaberto ] ]);

			// set chart title text settings
			chart.title('Todos os tickets da empresa(' + empresa +')')
			//set chart radius
			.radius('75%')
			// create empty area in pie chart
			.innerRadius('40%');

			// set container id for the chart
			chart.container('container2');
			// initiate chart drawing
			chart.draw();
		});
	</script>


	</section>
	</section>
	</section>

	</body>
	</html>