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
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/js/DatePicker/WdatePicker.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/resources/jquery.soui.all.css">
  </head>
  <script type="text/javascript">
  $(function(){
	  	getAllDep();
	  	$("#date").val(getNowDate());
		$("#date").bind("click",function(){
			resetDate();
		});
		$("#dep").bind("change",function(){
			resetDoc();
		});
		var store = $.souiStore.create({
	        url: '${pageContext.request.contextPath}/duty/ajaxShowList.action',
	        root: 'list',
	        success:function(data,text){
	        }
	    });
		var paging = $.souiPaging.create({
	        store: store,
	        limit: 15
	    });
		var grid = $("#grid-panel").souiGrid({
			title : "值班表管理",
	        height: 220,
	        store: store,
	        columns: [
		        {label: "值班医生", width: 150, key: 'doctorName'},
		        {label: "科室", width: 150, key: 'departName'},
		        {label: "日期", width: 150, key: 'date'},
		        {label: "操作", width: 150, renderer: function(data){
		        	var updateUrl = "'${pageContext.request.contextPath}/duty/updateDuty.action?duty.id="+data.id+"'";
		        	var deleteUrl = "'${pageContext.request.contextPath}/duty/ajaxDeleteDuty.action?duty.id="+data.id+"'";
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
			  		var _url = "${pageContext.request.contextPath}/duty/ajaxUpdateDuty.action";
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
  				resetData(data.duty);
  			}
  		});
  	}
  	
  	function resetData(data){
  		$("#id").val(data.id);
  		$("#date").val(data.date);
  		$("#dep").val(data.departId);
  		$("#doc").val(data.doctorId);
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
  				resetDoc();
  			}
  		});
  	}
  	function resetDoc(){
  		var depId = $("#dep").val()
			$.ajax({
				url : "${pageContext.request.contextPath}/doctor/ajaxShowList.action",
				type: "post",
				data : {
					"doctor.depart.id":depId
				},
				success: function(data){
					var list = data.list;
					var dep = $("#doc");
					dep.empty();
					for(var i=0;i<list.length;i++){
						var op = "<option value='"+list[i].id+"'>"+list[i].name+"</option>";
						dep.append(op);
					}
				}
			});
  	}
  
  function resetDate(){
		WdatePicker({dateFmt:'yyyy-MM-dd',el:'date'})
	}
  
  function getNowDate(){
		var d = new Date();
		var vYear = d.getFullYear();
		var vMon = d.getMonth() + 1;
		var vDay = d.getDate();
		
		var s ;
			s = vYear + "-" + vMon + "-" + vDay;
		return s;
	}
  </script>
  
  <body>
  	<div id="query-panel" style="margin:25px 25px 25px 25px">
  		<label>级别：</label>
  		<input type="text" id="name" name="duty.doctor.name">
  		<button id="queryBtn">查询</button>
  		<button id="addBtn">新增</button>
  	</div>
	<div id="grid-panel"></div>
	<div id="dialog-form" title="编辑">
		<div id="query">
	  	<table>
	  		<tr>
	  			<td><span>日期</span><td>
	  			<td> <input type="text" id="date" name="duty.date" readonly="readonly"> <input id="id" name="duty.id"  type="text" style="display: none;" > <td> 
	  		</tr>
	  		<tr>
	  			<td><span>科室</span><td>
	  			<td>
	  			<select id="dep" name="duty.depart.id">
	  				
	  			</select> 
	  			<td>  
	  		</tr>
	  		<tr>
	  			<td><span>医生</span><td>
	  			<td>
	  			<select id="doc" name="duty.doctor.id">
	  				
	  			</select> 
	  			<td>
	  		</tr>
	  	</table>
  	</div>
	</div>
</body>
</html>
