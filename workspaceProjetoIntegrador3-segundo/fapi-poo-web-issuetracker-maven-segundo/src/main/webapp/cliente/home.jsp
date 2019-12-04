<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- include para menu de funcionalidade -->

<jsp:include page="./topoCliente.jsp"></jsp:include>

<!-- include para menu de funcionalidade -->
<div class="col-md-9">
	<div id="teste" class="col-md-12" style="background-color: white;">
		<!---bruno------------------>
		<div class="container">
			<h3>
				<i class="fa fa-bars" aria-hidden="true"></i> Home
			</h3>
			<h4> Relatorio geral da empresa</h4> 
			<div class="row col-md-12">
				<div id="container1"></div></br>
				
			</div>
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
anychart.onDocumentReady(function () {
	// set chart theme
anychart.theme('pastel');
    // create data set on our data
    var dataSet = anychart.data.set(getData1());

    // map data for the first series, take x from the zero column and value from the first column of data set
    var seriesData_1 = dataSet.mapAs({'x': 0, 'value': 1});

    // map data for the second series, take x from the zero column and value from the second column of data set
    var seriesData_2 = dataSet.mapAs({'x': 0, 'value': 2});

    // create bar chart
    var chart = anychart.bar3d();

    // set chart padding
    chart.padding([10, 20, 5, 20]);

    // force chart to stack values by Y scale.
    chart.yScale().stackMode('value');

    chart.yAxis().labels().format(function () {
        return Math.abs(this.value).toLocaleString();
    });

    // set titles for Y-axis
    chart.yAxis().title('Quantidadde de tickets');

    // turn on exstra axis for simmetry
    chart.xAxis(1)
            .enabled(true)
            .orientation('right');

    // set chart title text settings
    chart.title('Clientes da empresa e situacao dos tickets');

    chart.interactivity().hoverMode('by-x');
    chart.tooltip()
            .displayMode('separated')
            .positionMode('point')
            .title(false)
            .separator(false)
            .useHtml(true)
            .fontSize(12)
            .offsetX(5)
            .offsetY(0)
            .format(function () {
                return '<span style="color: #D9D9D9"></span>' + Math.abs(this.value).toLocaleString();
            });

    // temp variable to store series instance
    var series;

    // create first series with mapped data
    series = chart.bar(seriesData_1);
    series.name('Processo');
    series.tooltip()
            .position('right')
            .anchor('left-center');

    // create second series with mapped data
    series = chart.bar(seriesData_2);
    series.name('Resolvido');
    series.tooltip()
            .position('left')
            .anchor('left-center');

    // turn on legend
    chart.legend()
            .enabled(true)
            .inverted(true)
            .fontSize(13)
            .padding([0, 0, 20, 0]);

    chart.zAspect('100%');

    // set container id for the chart
    chart.container('container3');

    // initiate chart drawing
    chart.draw();
});

var vetores = [];

var nome='lami';
var n = 5;


for(var i = 1; i <=5 ; i++ ){

		 vetores[i] = [i+nome, n, -i+10];
	}
      console.log('local');
	  console.log(vetores);

var valores = [];
 valores = vetores;


function getData1() {
    return valores;
    
}
</script>


   <script>
anychart.onDocumentReady(function () {
	// set chart theme
anychart.theme('pastel');
    // create data set on our data
    var dataSet = anychart.data.set(getData());

    // map data for the first series, take x from the zero column and value from the first column of data set
    var seriesData_1 = dataSet.mapAs({'x': 0, 'value': 1});

    // map data for the second series, take x from the zero column and value from the second column of data set
    var seriesData_2 = dataSet.mapAs({'x': 0, 'value': 2});

    // map data for the third series, take x from the zero column and value from the third column of data set
    var seriesData_3 = dataSet.mapAs({'x': 0, 'value': 3});

    // create line chart
    var chart = anychart.line();

    // turn on chart animation
    chart.animation(true);

    // set chart padding
    chart.padding([10, 20, 5, 20]);

    // turn on the crosshair
    chart.crosshair()
            .enabled(true)
            .yLabel(false)
            .yStroke(null);

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
    series_1.hovered().markers()
            .enabled(true)
            .type('circle')
            .size(4);
    series_1.tooltip()
            .position('right')
            .anchor('left-center')
            .offsetX(5)
            .offsetY(5);

    // create second series with mapped data
    var series_2 = chart.line(seriesData_2);
    series_2.name('Em processo');
    series_2.hovered().markers()
            .enabled(true)
            .type('circle')
            .size(4);
    series_2.tooltip()
            .position('right')
            .anchor('left-center')
            .offsetX(5)
            .offsetY(5);

    // create third series with mapped data
    var series_3 = chart.line(seriesData_3);
    series_3.name('Resolvido');
    series_3.hovered().markers()
            .enabled(true)
            .type('circle')
            .size(4);
    series_3.tooltip()
            .position('right')
            .anchor('left-center')
            .offsetX(5)
            .offsetY(5);

    // turn the legend on
    chart.legend()
            .enabled(true)
            .fontSize(13)
            .padding([0, 0, 10, 0]);

    // set container id for the chart
    chart.container('container1');
    // initiate chart drawing
    chart.draw();
});

var vetor = ['JAN', 3, 2, 1, 8];
var vetore = [];

var m='mes';
var n = 5;


for(var i = 1; i <=10 ; i++ ){

		 vetore[i] = [i+m, n, i+2, i+1,i+5];
	}
      console.log('local');
	  console.log(vetore);

var vv = [];
vv = vetore;

function getData() {
    return vv;
}


/*=========== outro ==================================================================================================*/
anychart.onDocumentReady(function () {
	// set chart theme
	var novo = 10;
	var pendente = 10;
	var resolvido = 10;
	var reaberto = 10;
anychart.theme('pastel');
    // create pie chart with passed data
    var chart = anychart.pie3d([
        ['Novo', novo],
        ['',],
        ['Resolvido', resolvido],
        ['', ],
        ['Pendente', pendente],
        ['Reaberto', reaberto]
    ]);

    // set chart title text settings
    chart.title('Todos os tickets da empresa(Friboi)')
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