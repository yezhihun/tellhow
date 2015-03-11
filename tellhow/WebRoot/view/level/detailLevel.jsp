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
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/resources/jquery.soui.all.css">
  </head>
  <script type="text/javascript">
  $(function(){
  	$("#submit").bind("click",function(){
  		var _url = "${pageContext.request.contextPath}/level/ajaxUpdateLevel.action";
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
	  			<td><span>级别</span><td>
	  			<td> <input type="text" name="level.name" value="${level.name}"> <input name="level.id" value="${level.id}" type="text" style="display: none;" > <td> 
	  		</tr>
	  		<tr>
	  			<td><span>描述</span><td>
	  			<td> <input type="text" name="level.info" value="${level.info}"> <td> 
	  		</tr>
	  	</table>
  	</div>
  	<button id="submit">提交</button>
</body>
</html>
