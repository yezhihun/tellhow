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
	        url: '${pageContext.request.contextPath}/depart/ajaxShowList.action',
	        root: 'list',
	        success:function(data,text){
	        }
	    });
		var paging = $.souiPaging.create({
	        store: store,
	        limit: 15
	    });
		var grid = $("#grid-panel").souiGrid({
			title : "科室管理",
	        height: 220,
	        store: store,
	        columns: [
		        {label: "科室", width: 150, key: 'name'},
		        {label: "描述", width: 150, key: 'info'},
		        {label: "操作", width: 150, renderer: function(data){
		        	var updateUrl = "'${pageContext.request.contextPath}/depart/updateDepart.action?depart.id="+data.id+"'";
		        	var deleteUrl = "'${pageContext.request.contextPath}/depart/ajaxDeleteDepart.action?depart.id="+data.id+"'";
		        	var updateLink = '<a href="javascript:update('+updateUrl+')">修改</a>';
		        	var deleteLink = '<a href="javascript:delet('+deleteUrl+')">删除</a>';
		        	return updateLink+"&nbsp;&nbsp;&nbsp;"+deleteLink;
		        }}
	        ],
	        paging: paging
	    });
	    
	    $("#dialog-form").dialog({
			autoOpen: false,
			height: 300,
			width: 350,
			modal: true,
			buttons: {
				"OK": function() {
					var name = $("#newname").val();
					var id = $("#id").val();
					var info = $("#info").val();
					var params = getParams("query");
			  		var _url = "${pageContext.request.contextPath}/depart/ajaxUpdateDepart.action";
			  		var params = getParams("query");
			  		$.ajax({
			  			url: _url,
			  			type: "post",
			  			data: params,
			  			success: function(data){
			  				$( "#dialog-form" ).dialog( "close" );
			  				storeLoad();
			  			}
			  		});
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
			}
		});
	    
	    $("#addBtn").bind("click",function(){
	    	$("#id").val("");
	  		$("#info").val("");
	  		$("#newname").val("");
			$( "#dialog-form" ).dialog( "open" );
	    	
	    });
	    $("#queryBtn").bind("click",function(){
	    	var params = getParams();
	    	store.load(params);
	    });
	    
  	});
  	function update(_url){
  		$.ajax({
  			type: "post",
  			url: _url,
  			success:function(data){
  				resetData(data.depart);
  			}
  		});
  	}
  	
  	function resetData(data){
  		$("#id").val(data.id);
  		$("#info").val(data.info);
  		$("#newname").val(data.name);
  		$("#dialog-form").dialog( "open" );
  	}
  	function getParams(panel){
  		var queryFrom ;
  		if(!panel){
  			queryFrom = $("#query-panel input[type=text]")
  		}else{
  			queryFrom = $("#"+panel+" input[type=text]");
  		}
		
		var params = {};
		for(var i=0;i<queryFrom.length;i++){
			var name = queryFrom[i].name;
			var val = queryFrom[i].value;
			params[name]=val;
		}
		return params;
	}
  	
  	function delet(_url){
  		$.ajax({
  			type: "post",
  			url: _url,
  			success:function(data){
  				alert(data.message);
  				storeLoad();
  			}
  		});
  	}
  </script>
  
  <body>
  	<div id="query-panel" style="margin:25px 25px 25px 25px">
  		<label>科室：</label>
  		<input type="text" id="name" name="depart.name">
  		<button id="queryBtn">查询</button>
  		<button id="addBtn">新增</button>
  	</div>
	<div id="grid-panel"></div>
	<div id="dialog-form" title="编辑">
	<form>
	<fieldset id="query">
		<label>科室</label><input type="text" id="id" name="depart.id" style="display: none;">
		<input type="text" name="depart.name" id="newname"  /><br>
		<label>描述</label>
		<input type="text" name="depart.info" id="info">
	</fieldset>
	</form>
	</div>
</body>
</html>
