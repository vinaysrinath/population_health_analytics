var chart_options = {
	chart : {
		plotBackgroundColor : null,
		plotBorderWidth : null,
		plotShadow : false,
		type : 'pie'
	},
	title : {
		text : 'Population Gender Data'
	},
	tooltip : {
		pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
	},
	plotOptions : {
		pie : {
			allowPointSelect : true,
			cursor : 'pointer',
			dataLabels : {
				enabled : true,
				format : '<b>{point.name}</b>: {point.percentage:.1f} %',
				style : {
					color : (Highcharts.theme && Highcharts.theme.contrastTextColor)
							|| 'black'
				},
				connectorColor : 'silver'
			}
		}
	},
	series : [ {
		name : 'Brands',
		data : [ {
			name : 'Microsoft Internet Explorer',
			y : 56.33
		}, {
			name : 'Chrome',
			y : 24.03,
			sliced : true,
			selected : true
		}, {
			name : 'Firefox',
			y : 10.38
		}, {
			name : 'Safari',
			y : 4.77
		}, {
			name : 'Opera',
			y : 0.91
		}, {
			name : 'Proprietary or Undetectable',
			y : 0.2
		} ]
	} ]
};

$(document).ready(function() {
	
	console.log("removing active");
	$("li.active").removeClass('active');
	$('ul:first li:eq(1)').addClass('active');
	
	console.log("removed active");
	$.ajax({
		url : 'http://javafactory.info:8080/nhanes/master',
	}).done(function(data) {
		console.log(data);
		var arr;
		$.each(data._embedded, function(key, val) {
			arr = val;
		});

		var chartArr = [];

		var male = 0, female = 0;
		var single = 0, married = 0, unknown=0;
		$.each(arr, function(key, val) {
			val.RIAGENDR == 1 ? male++ : female++;
			val.DMDMARTL!='NA'?(val.DMDMARTL==5?single++:married++):unknown++;
		});
		var dataPoint = {
			name : 'MALE',
			y : male,
			color: 'lightgreen'
		};
		chartArr.push(dataPoint);
		dataPoint = {
			name : 'FEMALE',
			y : female,
			color: 'lightblue'
		};
		chartArr.push(dataPoint);

		chart_options.chart.renderTo = "genderChart";
		chart_options.title.text = 'Population Gender data';
		chart_options.series[0].data = chartArr;
		chart = new Highcharts.Chart(chart_options);
		
		chartArr=[];
		dataPoint = {
				name : 'SINGLE',
				y : single,
				color: 'lightgreen'
		};
		chartArr.push(dataPoint);
		dataPoint = {
			name : 'MARRIED',
			y : married,
			color: 'lightblue'
		};
		chartArr.push(dataPoint);
		dataPoint = {
			name : 'UNKNOWN',
			y : unknown,
		};
		chartArr.push(dataPoint);
		chart_options.chart.renderTo = "maritalChart";
		chart_options.title.text = 'Population Marital Status';
		chart_options.series[0].data = chartArr;
		chart = new Highcharts.Chart(chart_options);
		$('#chartMenu').addClass('active');
		// console.log(i);

	}).fail(function() {
		alert("Ajax failed to fetch data");
	});
	
});