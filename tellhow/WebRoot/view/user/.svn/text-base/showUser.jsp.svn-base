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
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/js/index.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/ui/jquery.soui.store.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/ui/jquery.soui.paging.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/ui/jquery.soui.grid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/ui/jquery.soui.core.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/themes/base/jquery.ui.all.css">
	
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/ui/jquery.ui.core.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/ui/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/ui/jquery.ui.mouse.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/ui/jquery.ui.button.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/ui/jquery.ui.draggable.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/ui/jquery.ui.position.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/ui/jquery.ui.resizable.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/ui/jquery.ui.button.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/ui/jquery.ui.dialog.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/ui/jquery.ui.effect.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/scripts/jquery-ui-1.10.3.custom/development-bundle/demos/demos.css">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/resources/jquery.soui.all.css">
  </head>
  <script type="text/javascript">
  $(function(){
		var store = $.souiStore.create({
	        url: '${pageContext.request.contextPath}/user/ajaxShowList.action',
	        root: 'list',
	        success:function(data,text){
	        }
	    });
		var paging = $.souiPaging.create({
	        store: store,
	        limit: 15
	    });
		var grid = $("#grid-panel").souiGrid({
			title : "用户管理",
	        height: 220,
	        store: store,
	        columns: [
		        {label: "姓名", width: 150, key: 'name'},
		        {label: "注册时间", width: 250, key: 'date'},
		        {label: "类别", width: 250, key: 'role',renderer:function(data,v){
		        	if(v=='a'){
		        		return "管理员";
		        	}else {
		        		return "普通用户";
		        	}
		        }}
	        ],
	        paging: paging
	    });
	    
	    $("#addBtn").bind("click",function(){
	    	alert("add");
	    });
	    $("#queryBtn").bind("click",function(){
	    	var params = getParams();
	    	store.load(params);
	    });
	    
  	});
  	function getParams(){
  		var queryFrom = $("#query-panel input[type=text]");
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
  	<div id="query-panel" style="margin:25px 25px 25px 25px">
  		<label>用户名：</label>
  		<input type="text" id="name" name="user.name">
  		<button id="queryBtn">查询</button>
  	</div>
	<div id="grid-panel"></div>
</body>
</html>
