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
  		var _url = "${pageContext.request.contextPath}/news/ajaxUpdateNews.action";
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
		var queryArea = $("#"+panel+" textarea");
		var params = {};
		for(var i=0;i<queryFrom.length;i++){
			var name = queryFrom[i].name;
			var val = queryFrom[i].value;
			params[name]=val;
		}
		for(var i=0;i<queryArea.length;i++){
			var name = queryArea[i].name;
			var val = queryArea[i].value;
			params[name]=val;
		}
		return params;
	}
  </script>
  
  <body>
  	<div id="query" style="width: 50%">
	  	<table title="编辑新闻" border="1">
	  		<tr style="">
	  			<td><span>标题</span><td>
	  			<td><input name="news.title" value="${news.title}" type="text"> <td> 
	  		</tr>
	  		<tr>
	  			<td><span>新闻</span><td>
	  			<td><textarea rows="20" cols="20" name="news.info">${news.info}</textarea> <input name="news.id" value="${news.id}" type="text" style="display: none;" > <td> 
	  		</tr>
	  	</table>
  	</div>
  	<button id="submit">提交</button>
</body>
</html>
