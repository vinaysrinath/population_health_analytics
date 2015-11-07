$(document).ready(function() {
	$.ajax({
		  url: 'http://javafactory.info:8080/nhanes/master',
		})
		.done(function(data) {
		  var i=0;
		  console.log(data);
		  var arr;
		  $.each(data._embedded,function(key,val){
			  i++;
		  console.log("Obj"+i);
		  console.log(key);
		  console.log(val);
		  arr = val;
		  });
		  
		  console.log(arr.length);
		  var gridViewTable = "<table id='gridViewTable' class='table table-striped'>";
		  gridViewTable += "<tr>";
		  	gridViewTable += "<th>PATIENT SEQNO</th>";
		  	gridViewTable += "<th>AGE</th>";
		  	gridViewTable += "<th>GENDER</th>";
		  	gridViewTable += "<th>MARITAL STATUS</th>";
		  	gridViewTable += "<th>PRESCRIPTION MEDICATION</th>";
		  	gridViewTable += "<th>MEDICATION DRUG CODE</th>";
		  	gridViewTable += "<th>USAGE</th>";
		  	gridViewTable += "<th>TIMES PER DAY</th>";
		  	gridViewTable += "<th>DAYS</th>";
		  gridViewTable += "</tr>";
		  
		  $.each(arr,function(key,val){
//			 console.log("------------------------------------");
//			 console.log("SEQN"+key+":"+val.SEQN);
//			 console.log("RIDAGEYR"+key+":"+val.RIDAGEYR);
//			 console.log("RIAGENDR"+key+":"+val.RIAGENDR);
//			 console.log("DMDMARTL"+key+":"+val.DMDMARTL);
//			 console.log("LAT"+key+":"+val.LAT);
//			 console.log("LON"+key+":"+val.LON);
//			 console.log("STATE2K"+key+":"+val.STATE2K);
//			 console.log("CNTY2K"+key+":"+val.CNTY2K);
//			 console.log("RXDDRUG"+key+":"+val.RXDDRUG);
//			 console.log("RXDUSE"+key+":"+val.RXDUSE);
//			 console.log("RXDCOUNT"+key+":"+val.RXDCOUNT);
//			 console.log("RXDDAYS"+key+":"+val.RXDDAYS);
//			 console.log("------------------------------------");
			 var gender = val.RIAGENDR==1?"M":"F";
			 var age = val.RIDAGEYR==0?"-":val.RIDAGEYR;
			 var maritalStatus = val.DMDMARTL!='NA'?(val.DMDMARTL==5?'SINGLE':'MARRIED'):'-';
			 gridViewTable += "<tr>";
			 	gridViewTable += "<td align=center>"+val.SEQN+"</td>";
			 	gridViewTable += "<td align=center>"+age+"</td>";
			 	gridViewTable += "<td align=center>"+gender+"</td>";
			 	gridViewTable += "<td align=center>"+maritalStatus+"</td>";
			 	gridViewTable += "<td align=center>"+val.RXDDRUG+"</td>";
			 	gridViewTable += "<td align=center>"+val.RXDDRGID+"</td>";
			 	gridViewTable += "<td align=center>"+val.RXDUSE+"</td>";
			 	gridViewTable += "<td align=center>"+val.RXDCOUNT+"</td>";
			 	gridViewTable += "<td align=center>"+val.RXDDAYS+"</td>";
			 gridViewTable += "</tr>";
		  });
		  gridViewTable += "</table>";
		  $("#gridView").html(gridViewTable);
//		  console.log(i);
		  
		})
		.fail(function() {
		  alert("Ajax failed to fetch data");
		});
});