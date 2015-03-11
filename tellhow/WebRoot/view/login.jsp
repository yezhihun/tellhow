<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="scripts/js/jquery.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#submitBtn").bind("click",function(){
				var name = $("#userName").val();
 				var password = $("#password").val();
				$.ajax({
		 			url: "login/ajaxLogin.action?user.name="+name+"&user.password="+password+"&user.role="+"a",
		 			type : "post",
		 			success: function(data){
		 				var role = data.role;
		 				var result = data.result;
		 				if(result == 'n'){
		 					alert("登录失败！");
		 					return;
		 				}
		 				
	 					window.open("view/index.jsp","_blank");
		 				
		 			}
		 		});
			});
		});
	</script>
  </head>
  
  <body>
    <form action="" method="post">
    	<table border="1" align="center">
    	<tr>
    		<th colspan="2" align="center">后台登陆</th>
    	</tr>
    	<input type="hidden" value="a" name="role">
    	<tr>
    		<td>用户名：<td><input type="text" name="userName" id="userName"></td>
    	</tr>
    	<tr>
    		<td>密&nbsp;&nbsp;码：</td><td><input type="password" name="password" id="password"></td>
    	</tr>
    	
    	<tr>
    		<td colspan="2" align="right"><input type="button" id="submitBtn" value="登录"></td>
    	</tr>
    </table>
    </form>
  </body>
</html>
