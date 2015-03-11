<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/js/index.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/ui/jquery.soui.store.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/ui/jquery.soui.paging.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/ui/jquery.soui.grid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/ui/jquery.soui.core.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/js/DatePicker/WdatePicker.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/resources/jquery.soui.all.css">
  </head>
  <script type="text/javascript">
  $(function(){
  	getAllDep();
  	$("#date").val(getNowDate());
	$("#date").bind("click",function(){
		resetDate();
	});
  	$("#submit").bind("click",function(){
  		var _url = "${pageContext.request.contextPath}/doctor/ajaxUpdateDoctor.action";
  		var params = getParams("query");
  		$.ajax({
  			url: _url,
  			type: "post",
  			data: params,
  			success: function(data){
  				alert(data.message);
  			}
  		});
  	});
  });
  
   function getAllDep(){
  	var _url = "${pageContext.request.contextPath}/depart/ajaxShowAllDep.action";
  		$.ajax({
  			url: _url,
  			type: "post",
  			success: function(data){
  				var dep = $("#dep");
  				for(var i=0;i<data.list.length;i++){
  					var d = data.list[i];
  					var op = '<option value="'+d.id+'">'+d.name+'</option>';
  					dep.append(op);
  				}
  			}
  		});
  }
  
  function resetDate(){
			WdatePicker({dateFmt:'yyyy-MM-dd',el:'date',maxDate:'%y-%M-%d'})
	}
  
  function getNowDate(){
		var d = new Date();
		var vYear = d.getFullYear();
		var vMon = d.getMonth() + 1;
		var vDay = d.getDate();
		
		var s ;
			s = vYear + "-" + vMon + "-" + vDay;
		return s;
	}
	 function getParams(panel){
		var queryFrom = $("#"+panel+" input[type=text]");
		var params = {};
		for(var i=0;i<queryFrom.length;i++){
			var name = queryFrom[i].name;
			var val = queryFrom[i].value;
			params[name]=val;
		}
		return params;
	}
  </script>
  
  <body>
  	<div id="query">
	  	<table>
	  		<tr>
	  			<td><span>日期</span><td>
	  			<td> <input type="text" id="date" name="duty.date" value="${duty.date}"> <input name="doctor.id" value="${doctor.id}" type="text" style="display: none;" > <td> 
	  		</tr>
	  		<tr>
	  			<td><span>科室</span><td>
	  			<td>
	  			<select id="dep" name="duty.depart.id">
	  				
	  			</select> 
	  			<td>  
	  		</tr>
	  		<tr>
	  			<td><span>医生</span><td>
	  			<td>
	  			<select id="doc" name="duty.doctor.id">
	  				
	  			</select> 
	  			<td>
	  		</tr>
	  	</table>
  	</div>
  	<button id="submit">提交</button>
</body>
</html>
