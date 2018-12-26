(function () {

// //== Start Chart Pie and  Line Admin LTE
//   // Định nghĩa Chart Line
//   var randomScalingFactor = function(){ return Math.round(Math.random()*200)};
//   // var dataOld = [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
//   // var dataNew = [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
//   var dataOld = $('#dataOld').html().split(',');
//   var dataNew = $('#dataNew').html().split(',');
//   var lineChartData = {
//     //   labels : ["January","February","March","April","May","June","July"],
//     labels : ["Tháng1","Tháng2","Tháng3","Tháng4","Tháng5","Tháng6","Tháng7","Tháng8","Tháng9","Tháng10","Tháng11","Tháng12"],
//     datasets : [
//     {
//       label: "Năm trước",
//       fillColor : "rgba(220,220,220,0.2)",
//       strokeColor : "rgba(220,220,220,1)",
//       pointColor : "rgba(220,220,220,1)",
//       pointStrokeColor : "#fff",
//       pointHighlightFill : "#fff",
//       pointHighlightStroke : "rgba(220,220,220,1)",
//       data: dataOld
//     },
//     {
//       label: "Năm hiện tại",
//       fillColor : "rgba(151,187,205,0.2)",
//       strokeColor : "rgba(26,154,20,1)",
//       pointColor : "rgba(26,154,20,1)",
//       pointStrokeColor : "#fff",
//       pointHighlightFill : "#fff",
//       pointHighlightStroke : "rgba(151,187,205,1)",
//       data: dataNew
//     }
//     ]
//   }

//   // Định nghĩa Chart Pie
//   var pieData = [
//                     {
//                       value: 20,
//                       color:"#990099",
//                       highlight: "#000",
//                       label: "Hà Nội"
//                     },
//                     {
//                       value: 15,
//                       color: "#dc3812",
//                       highlight: "#000",
//                       label: "Tp. Hồ Chí Minh"
//                     },
//                     {
//                       value: 15,
//                       color: "#ff9900",
//                       highlight: "#000",
//                       label: "Đà Nẵng"
//                     },
//                     {
//                       value: 10,
//                       color: "#3266cc",
//                       highlight: "#000",
//                       label: "Nghệ An"
//                     },
//                     {
//                       value: 5,
//                       color: "#109619",
//                       highlight: "#000",
//                       label: "Hà Tĩnh"
//                     },
//                     {
//                       value: 28,
//                       color: "#0099c5",
//                       highlight: "#000",
//                       label: "Hà Tĩnh"
//                     }

//                     ];

//   window.onload = function(){

//     //Load Chart.Line
//     var ctx = document.getElementById("canvas").getContext("2d");
//     window.myLine = new Chart(ctx).Line(lineChartData, {
//       responsive: true
//     });

//     // Load ChartPie
//     var ctx = document.getElementById("chart-area").getContext("2d");
//         window.myPie = new Chart(ctx).Pie(pieData);
//   }
//   //
//// == End Chart Pie and  Line Admin LTE

  // ==Start Line Chart Google
  window.onload = function(){

  var dataChartLine = document.getElementById('dataChartLine').innerHTML.split(',');
  var dataMarkerType =[]; var dataMarkerColor = [];
  dataMarkerType[0] ='triangle';
  dataMarkerColor[0] ='#6B8E23';
  for(var i = 1; i< dataChartLine.length; i++){
    if(parseInt(dataChartLine[i]) > parseInt(dataChartLine[i-1]))
    {
      dataMarkerType[i] = 'triangle';
      dataMarkerColor[i] = '#6B8E23';
    }
    else{
      dataMarkerType[i] = 'cross';
      dataMarkerColor[i] = 'tomato';
    }
  }
  var textLayout = "Báo cáo năm " + document.getElementById('yearSelect').value;
  var chart = new CanvasJS.Chart("chartContainer", {
  theme: "light2", // "light1", "light2", "dark1", "dark2"
  animationEnabled: true,
  title:{
    text: textLayout,  
  },
  axisX: {
    interval: 1,
    valueFormatString: "Tháng##"
  },
  axisY:{
    // title: "Thu nhập",
    valueFormatString: "#.000đ"
  },
  data: [{        
    type: "line",
    markerSize: 12,
    xValueFormatString: "T##",
    yValueFormatString: "###.#000đ",
    dataPoints: [
        { x: 1 , y: parseInt(dataChartLine[0]), markerType: dataMarkerType[0],  markerColor: dataMarkerColor[0]},
        { x: 2 , y: parseInt(dataChartLine[1]), markerType: dataMarkerType[1],  markerColor: dataMarkerColor[1] },
        { x: 3 , y: parseInt(dataChartLine[2]), markerType: dataMarkerType[2], markerColor: dataMarkerColor[2] },
        { x: 4 , y: parseInt(dataChartLine[3]), markerType: dataMarkerType[3], markerColor: dataMarkerColor[3] },
        { x: 5 , y: parseInt(dataChartLine[4]), markerType: dataMarkerType[4], markerColor: dataMarkerColor[4] },
        { x: 6 , y: parseInt(dataChartLine[5]), markerType: dataMarkerType[5], markerColor: dataMarkerColor[5]},
        { x: 7 , y: parseInt(dataChartLine[6]), markerType: dataMarkerType[6], markerColor: dataMarkerColor[6] },
        { x: 8 , y: parseInt(dataChartLine[7]), markerType: dataMarkerType[7], markerColor: dataMarkerColor[7] },
        { x: 9 , y: parseInt(dataChartLine[8]), markerType: dataMarkerType[8], markerColor: dataMarkerColor[8] },
        { x: 10 , y: parseInt(dataChartLine[9]), markerType: dataMarkerType[9], markerColor: dataMarkerColor[9] },
        { x: 11 , y: parseInt(dataChartLine[10]), markerType: dataMarkerType[10], markerColor: dataMarkerColor[10] },
        { x: 12 , y: parseInt(dataChartLine[11]), markerType: dataMarkerType[11], markerColor: dataMarkerColor[11] }
        ]
      }]
  });
  chart.render();

  }
  //== Start Pie Chart Google
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var dataPieString = document.getElementById('data-piechart-string').innerHTML.split(',');
    var dataPieNumber = document.getElementById('data-piechart-number').innerHTML.split(',');

    // Cách 1:
    // var data = google.visualization.arrayToDataTable([
    //   ['Task', 'Hours per Day'],
    //   [dataPieString[0],parseInt(dataPieNumber[0])],
    //   [dataPieString[1],parseInt(dataPieNumber[1])],
    //   [dataPieString[2],parseInt(dataPieNumber[2])],
    //   [dataPieString[3],parseInt(dataPieNumber[3])],
    //   [dataPieString[4],parseInt(dataPieNumber[4])],
    //   [dataPieString[5],parseInt(dataPieNumber[5])]
    //   ]);

    // Cách 2:
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Task');
    data.addColumn('number', 'Hours per Day');
    for(var i = 0; i < dataPieString.length; i++)
      data.addRows([
        [dataPieString[i],parseInt(dataPieNumber[i])],
        ]);


    var options = {
      title: 'Biểu đồ khu vực tiêu thụ',
      // with: 500,
      // height: 500
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    chart.draw(data, options);
  }
  // == end Pie Chart Google

}).call(this);
