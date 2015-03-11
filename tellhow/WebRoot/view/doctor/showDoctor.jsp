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
	        url: '${pageContext.request.contextPath}/doctor/ajaxShowList.action',
	        root: 'list',
	        success:function(data,text){
	        }
	    });
		var paging = $.souiPaging.create({
	        store: store,
	        limit: 15
	    });
		var grid = $("#grid-panel").souiGrid({
			title : "医生管理",
	        height: 220,
	        store: store,
	        columns: [
		        {label: "姓名", width: 150, key: 'name'},
		        {label: "年龄", width: 150, key: 'age'},
		        {label: "性别", width: 150, data: 'sex',renderer:function(data){
		        	if(data.sex==0){
		        		return "男";
		        	}
		        	return "女";
		        }},
		        {label: "级别", width: 150, key: 'levle',renderer: function(data){
		        	return data.level.name;
		        }},
		        {label: "科室", width: 150, data: 'depart',renderer:function(data){
		        	return data.depart.name;
		        }},
		        {label: "操作", width: 150, renderer: function(data){
		        	var updateUrl = "'${pageContext.request.contextPath}/doctor/updateDoctor.action?doctor.id="+data.id+"'";
		        	var deleteUrl = "'${pageContext.request.contextPath}/doctor/ajaxDeleteDoctor.action?doctor.id="+data.id+"'";
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
			  		var _url = "${pageContext.request.contextPath}/doctor/ajaxUpdateDoctor.action";
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
	  		$("#age").val("");
	  		$("#newname").val("");
	  		$("#dep").val("");
	  		$("#lev").val("");
	  		getAllDep();
  			getAllLevel();
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
  				resetData(data.doctor);
  			}
  		});
  	}
  	
  	function resetData(data){
  		$("#id").val(data.id);
  		$("#age").val(data.age);
  		$("#newname").val(data.name);
  		$("#dep").val(data.depart.id);
  		$("#lev").val(data.level.id);
  		getAllDep();
  		getAllLevel();
  		$("#dialog-form").dialog( "open" );
  	}
  	function getParams(panel){
  		var queryFrom ;
  		if(!panel){
  			queryFrom = $("#query-panel input[type=text]")
  		}else{
  			queryFrom = $("#"+panel+" input[type=text]");
  		}
		var querySe = $("#"+panel+" select");
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
  	function getAllLevel(){
  	var _url = "${pageContext.request.contextPath}/level/ajaxShowList.action";
  		$.ajax({
  			url: _url,
  			type: "post",
  			success: function(data){
  				var dep = $("#lev");
  				for(var i=0;i<data.list.length;i++){
  					var d = data.list[i];
  					var op = '<option value="'+d.id+'">'+d.name+'</option>';
  					dep.append(op);
  				}
  			}
  		});
  }
  
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
  </script>
  
  <body>
  	<div id="query-panel" style="margin:25px 25px 25px 25px">
  		<label>姓名：</label>
  		<input type="text" id="name" name="doctor.name">
  		<button id="queryBtn">查询</button>
  		<button id="addBtn">新增</button>
  	</div>
	<div id="grid-panel"></div>
	<div id="dialog-form" title="编辑">
	<div id="query">
	  	<table>
	  		<tr>
	  			<td><span>姓名</span><td>
	  			<td> <input type="text" id="newname" name="doctor.name" value="${doctor.name}"> <input id="id" name="doctor.id" value="${doctor.id}" type="text" style="display: none;" > <td> 
	  		</tr>
	  		<tr>
	  			<td><span>性别</span><td>
	  			<td> 
	  			<select id="sex" name="doctor.sex">
	  				<option value="0">男</option>
	  				<option value="1">女</option>
	  			</select> 
	  			 <td> 
	  		</tr>
	  		<tr>
	  			<td><span>年龄</span><td>
	  			<td> <input type="text" id="age" name="doctor.age" value="${doctor.age}"> <td> 
	  		</tr>
	  		<tr>
	  			<td><span>级别</span><td>
	  			<td> 
	  			<select id="lev" id="lev" name="doctor.level.id">
	  				
	  			</select> 
	  			 <td> 
	  		</tr>
	  		<tr>
	  			<td><span>科室</span><td>
	  			<td>
	  			<select id="dep" id="dep" name="doctor.depart.id">
	  				
	  			</select> 
	  			<td> 
	  		</tr>
	  	</table>
  	</div>
	</div>
</body>
</html>
