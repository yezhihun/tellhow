<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Author" content="kudychen@gmail.com" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../scripts/js/jquery.js"></script>
<title>网站后台登陆</title>
</head>

<body >

<div id="main">
   
   <!-- logo-->
   <div class="logo">
     <img src="../images/1.jpg" width="100%" height="100%" />
  </div>
  <div class="menu_bg">
	 <div class="menu">
	 <ul>
	 <li id="shouye">首 页</li>
	 <li id="yuyue">挂号预约</li>
	 </ul>
	 </div>	 
	 </div>
	 
	 <!-- 新闻标题 -->
	<h2><%=URLDecoder.decode(request.getParameter("title")) %></h2>
	<!-- 新闻内容 -->
	<div>
		<p><%=URLDecoder.decode(request.getParameter("desc")) %></p>
	</div>
    <!-- menu结束-->
	<!-- 主页1 -->
  <div class="content01">
	<!-- 主页的左边 -->
	<div class="content01_left">
	<!-- 主页的左边第一个 -->
	
	
	
	
  </div>
	<!-- bottom -->
    <div class="bottom">
       
    </div>
    
    <!-- bottom结束 -->


</div>
	
</body>
</html>