<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Author" content="kudychen@gmail.com" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>网站后台登陆</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.global.css" type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.index.css"
	type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/js/jquery.utils.js"></script>
<link href="${pageContext.request.contextPath}/jBox/Skins/Green/jbox.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jBox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/js/admin.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/js/index.js"></script>
</head>


<body>
	<div id="header">
		<div id="header-logo">
			<img src="${pageContext.request.contextPath}/images/logo.gif" alt="logo" width="59" height="64"
				border="0" />
		</div>
		<div id="header-title">医院管理系统</div>
<!-- 		<div id="header-info"> -->
<!-- 			<span style="margin-right: 50px; color: #fff;"><b>${TRybid.rymc}</b> -->
<!-- 				您好，欢迎登陆使用！</span> <span style="margin-right: 50px; color: #fff;">当前版本：1.0</span> -->
<!-- 			<a href="javascript:Index.Open('welcome.jsp');" -->
<!-- 				style="margin-right: 10px; color: #fff; font-weight: bold;">后台首页</a> -->
<!-- 			<a href="javascript:Index.Open('welcome.jsp');" -->
<!-- 				style="margin-right: 10px; color: #fff; font-weight: bold;">修改密码</a> -->
<!-- 			<a href="javascript:Admin.Logout();"><img src="${pageContext.request.contextPath}/images/out.gif" -->
<!-- 				class="middle" alt="安全退出" width="46" height="20" border="0" /> </a> -->
<!-- 		</div> -->
	</div>
	<!--//#header-->

	<div id="main" style="height: 90%; float: left;">
		<div id="left" ">
			<div id="menu-container">
				<div class="menu-tit">信息管理</div>
				<div class="menu-list">
					<div class="top-line"></div>
					<ul class="nav-items">
						<li><a href="${pageContext.request.contextPath}/depart/show.action" target="content">科室信息管理</a></li>
						<li><a href="${pageContext.request.contextPath}/doctor/show.action" target="content">医生信息管理</a></li>
						<li><a href="${pageContext.request.contextPath}/drug/show.action" target="content">药品信息管理</a></li>
						<li><a href="${pageContext.request.contextPath}/level/show.action" target="content">医生级别管理</a></li>
					</ul>
				</div>
				
				<div class="menu-tit">挂号管理</div>
				<div class="menu-list hide">
					<div class="top-line"></div>
					<ul class="nav-items">
						<li><a href="${pageContext.request.contextPath}/duty/show.action" target="content">值班信息</a></li>
						<li><a href="${pageContext.request.contextPath}/register/show.action" target="content">门诊挂号</a></li>
					</ul>
				</div>
				<div class="menu-tit">公告管理</div>
				<div class="menu-list hide">
					<div class="top-line"></div>
					<ul class="nav-items">
						<li><a
							href="${pageContext.request.contextPath}/news/show.action"
							target="content">新闻管理</a>
						</li>
						<li><a href="${pageContext.request.contextPath}/gonggao/show.action"
							target="content">公告管理</a>
						</li>
						<li><a href="${pageContext.request.contextPath}/intro/show.action"
							target="content">简介管理</a>
						</li>
					</ul>
				</div>
				<div class="menu-tit">系统管理</div>
				<div class="menu-list hide">
					<div class="top-line"></div>
					<ul class="nav-items">
						<li><a href="${pageContext.request.contextPath}/user/show.action"" target="content">用户管理</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="menu-bottom"></div>
		</div>
		<!--//#left-->
		<div id="right" >
			<table width="100%" height="96%" border="0" cellpadding="0" cellspacing="0" >
				<tr>
					<td class="index-table-top-left"></td>
					<td class="index-table-top-center">
						<div class="index-table-welcome-left"></div>
						<div class="index-table-welcome-center" id="index-title">
							欢迎登录</div>
						<div class="index-table-welcome-right"></div>
						<div class="clear"></div></td>
					<td class="index-table-top-right"></td>
				</tr>
				<tr>
					<td class="index-table-middle-left"></td>
					<td class="index-table-middle-center" valign="top"
						id="content-container">
						<div id="loading">
							<img src="${pageContext.request.contextPath}/images/loading.gif" alt="loading" border="0" />
						</div> 
						<script type="text/javascript">
							Index.OutputIframe();
						</script>
						</td>
					<td class="index-table-middle-right"></td>
				</tr>
				<tr>
					<td class="index-table-bottom-left"></td>
					<td class="index-table-bottom-center"></td>
					<td class="index-table-bottom-right"></td>
				</tr>
			</table>
		</div>
		<!--//#right-->
		<div class="clear"></div>
	</div>

</body>
</html>