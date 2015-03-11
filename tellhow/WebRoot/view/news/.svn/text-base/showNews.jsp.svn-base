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
<!--	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/js/jquery-1.4.2.min.js"></script>-->
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
	        url: '${pageContext.request.contextPath}/news/ajaxShowList.action',
	        root: 'list',
	        success:function(data,text){
	        }
	    });
		var paging = $.souiPaging.create({
	        store: store,
	        limit: 15
	    });
		var grid = $("#grid-panel").souiGrid({
			title : "新闻管理",
	        height: 220,
	        store: store,
	        columns: [
		        {label: "新闻", width: 150, key: 'info'},
		        {label: "标题", width: 150, key: 'title'},
		        {label: "日期", width: 250, key: 'date'},
		        {label: "操作", width: 150, renderer: function(data){
		        	var updateUrl = "'${pageContext.request.contextPath}/news/updateNews.action?news.id="+data.id+"'";
		        	var deleteUrl = "'${pageContext.request.contextPath}/news/ajaxDeleteNews.action?news.id="+data.id+"'";
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
			  		var _url = "${pageContext.request.contextPath}/news/ajaxUpdateNews.action";
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
	  		$("#newtitle").val("");
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
  				resetData(data.news);
  			}
  		});
  	}
  	
  	function resetData(data){
  		$("#id").val(data.id);
  		$("#info").val(data.info);
  		$("#newtitle").val(data.title);
  		$("#dialog-form").dialog( "open" );
  	}
  	
  	function getParams(panel){
  		var queryFrom ;
  		if(!panel){
  			queryFrom = $("#query-panel input[type=text]")
  		}else{
  			queryFrom = $("#"+panel+" input[type=text]");
  		}
		var querySe = $("#"+panel+" textarea");
		var params = {};
		for(var i=0;i<queryFrom.length;i++){
			var name = queryFrom[i].name;
			var val = queryFrom[i].value;
			params[name]=val;
		}
		for(var i=0;i<querySe.length;i++){
			var name = querySe[i].name;
			var val = querySe[i].value;
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
  		<label>标题：</label>
  		<input type="text" id="title" name="news.title">
  		<button id="queryBtn">查询</button>
  		<button id="addBtn">新增</button>
  	</div>
  	<div id="grid-panel"></div>
	<div id="dialog-form" title="编辑">
	<form>
	<fieldset id="query">
		<label>标题</label><input type="text" id="id" name="news.id" style="display: none;">
		<input type="text" name="news.title" id="newtitle"  /><br>
		<label>正文</label>
		<textarea rows="5" cols="30" name="news.info" id="info"></textarea>
	</fieldset>
	</form>
	</div>
</body>
</html>
