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
  	$("#submit").bind("click",function(data){
  		var name = $("#name").val();
  		var pass1 = $("#password1").val();
  		var pass2 = $("#password2").val();
  		if(pass1 != pass2){
  			alert("两次密码不一致，请重新输入");
  			return;
  		}
  		$.ajax({
  			url : "${pageContext.request.contextPath}/login/register?name="+name+"&password="+pass1,
  			type: "post",
  			success: function(data){
  				alert(data.message);
  			}
  		});
  	});
  });
  
  </script>
  
  <body>
  	<div id="query">
	  	<table title="用户注册">
	  		<tr>
	  			<td><span>用户名</span><td>
	  			<td><input name="name" id="name" type="text"> <td> 
	  		</tr>
	  		<tr>
	  			<td><span>密码</span><td>
	  			<td><input name="password1" id="password1" type="password"> <td> 
	  		</tr>
	  		<tr>
	  			<td><span>再次输入密码</span><td>
	  			<td><input name="password2" id="password2" type="password"> <td> 
	  		</tr>
	  	</table>
  	</div>
  	<button id="submit">提交</button>
</body>
</html>
