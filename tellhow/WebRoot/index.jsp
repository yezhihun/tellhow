<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>医院首页</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
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
</head>
 <script type="text/javascript">
 	$(function(){
 		getAllDesc();
 		getAllDep();
 		$("#dep").bind("change",function(){
			resetDoc();
		});
		$("#date").val(getNowDate());
		$("#date").bind("click",function(){
			resetDate();
		});
 		$("#shouye").bind("click",function(){
 			$(".content01").attr("style","display:online;");
 		});
 		$("#yuyue").bind("click",function(){
 			$(".content01").attr("style","display:none;");
 		});
 		
 		$("#dialog-form-yuyue").dialog({
			autoOpen: false,
			height: 300,
			width: 350,
			modal: true,
			buttons: {
				"OK": function() {
					var userName = $("#u").val();
					var date = $("#date").val();
					var departId = $("#dep").val();
					var doctorId = $("#doc").val();
					if(!doctorId){
						alert("暂无值班医生，不可预约");
						return ;
					}
			  		$.ajax({
			  			url : "${pageContext.request.contextPath}/register/ajaxUpdateRegister.action?register.userName="+userName+"&register.regTime="+date+"&register.depart.id="+departId+"&register.doctor.id="+doctorId,
			  			type: "post",
			  			success: function(data){
			  				alert(data.message);
			  				$("#dialog-form-yuyue").dialog( "close" );
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
 		
 		$("#dialog-form").dialog({
			autoOpen: false,
			height: 300,
			width: 350,
			modal: true,
			buttons: {
				"OK": function() {
			  		var name = $("#name").val();
			  		var pass1 = $("#password1").val();
			  		var pass2 = $("#password2").val();
			  		if(pass1 != pass2){
			  			alert("两次密码不一致，请重新输入");
			  			return;
			  		}
			  		$.ajax({
			  			url : "${pageContext.request.contextPath}/login/register.action?user.name="+name+"&user.password="+pass1,
			  			type: "post",
			  			success: function(data){
			  				alert(data.message);
			  				$("#dialog-form").dialog( "close" );
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
  	});
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
  	function getNowDate(){
		var d = new Date();
		var vYear = d.getFullYear();
		var vMon = d.getMonth() + 1;
		var vDay = d.getDate();
		
		var s ;
			s = vYear + "-" + vMon + "-" + vDay;
		return s;
	}
  	function resetDoc(){
  		var depId = $("#dep").val();
  		var date = $("#date").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/duty/ajaxShowList.action",
				type: "post",
				data : {
					"duty.depart.id":depId,
					"duty.date":date
				},
				success: function(data){
					var list = data.list;
					var dep = $("#doc");
					dep.empty();
					for(var i=0;i<list.length;i++){
						var op = "<option value='"+list[i].doctorId+"'>"+list[i].doctorName+"</option>";
						dep.append(op);
					}
				}
			});
  	}
  	function resetDate(){
		WdatePicker({dateFmt:'yyyy-MM-dd',el:'date'})
	}
  	function getAllDesc(){
  		var _url = "login/ajaxGetAllDesc.action";
  		$.ajax({
  			url : _url,
  			type : "post",
  			success: function(data){
  				var news = data.news;
 				var intro = data.intro;
 				var gonggao = data.gonggao;
 				if(news && news.length>0){
 					resetNews(news);
 				}
 				if(intro){
 					$("#intro").empty()
 					$("#intro").append(intro.info);
 				}
 				if(gonggao && gonggao.length>0){
 					resetGongGao(gonggao);
 				}
  			}
  		});
  	}
  	
 	function login(){
 		var name = $("#userName").val();
 		var password = $("#password").val();
 		$.ajax({
 			url: "login/ajaxLogin.action?user.name="+name+"&user.password="+password+"&user.role="+"u"+"&user.flag="+"front",
 			type : "post",
 			success: function(data){
 				var role = data.role;
 				var result = data.result;
 				if(result == 'n'){
 					alert("登录失败！");
 					return;
 				}
 				if(role == 'a'){
 					window.open("view/index.jsp","_blank");
 				}else{
 					$(".tj_main_user").attr("style","display:online;")
 					$(".tj_main").attr("style","display:none;");
 					$("#user").append("["+data.user.name+"]");
 					$("#u").val(data.user.name);
 				}
 			}
 		});
 	}
 	
 	function resetGongGao(news){
 		var ns = $("#gonggao");
 		ns.empty();
 		for(var i=0;i<news.length;i++){
 			var li = $("<li class='nli' name='"+news[i].id+"'>"+news[i].title+"</li>");
 			var info = news[i].info;
 			var title = news[i].title;
 			li.bind("click",function(data){
	 			window.open("view/detail.jsp?desc="+info+"&title="+title,"_blank");
	 		});
 			ns.append(li);
 		}
 	}
 	
 	function resetIntro(news){
 		var ns = $("#intro");
 		ns.empty();
 		for(var i=0;i<news.length;i++){
 			var li = $("<li class='nli' name='"+news[i].id+"'>"+news[i].title+"</li>");
 			var info = news[i].info;
 			var title = news[i].title;
 			li.bind("click",function(data){
	 			window.open("view/detail.jsp?desc="+info+"&title="+title,"_blank");
	 		});
 			ns.append(li);
 		}
 	}
 	
 	function resetNews(news){
 		var ns = $("#news");
 		ns.empty();
 		for(var i=0;i<news.length;i++){
 			var li = $("<li class='nli' name='"+news[i].id+"'>"+news[i].title+"</li>");
 			var info = news[i].info;
 			var title = news[i].title;
 			li.bind("click",function(data){
	 			window.open("view/detail.jsp?desc="+info+"&title="+title,"_blank");
	 		});
 			ns.append(li);
 		}
 	}
 	
 	function reg(){
 		$( "#dialog-form" ).dialog( "open" );
 	}
 	function yuyue(){
 		$( "#dialog-form-yuyue" ).dialog( "open" );
 	}
 </script>
<body>
<div id="main">
   
   <!-- logo-->
   <div class="logo">
     <img src="images/1.jpg" width="100%" height="100%" />
  </div>
  <div class="menu_bg">
	 <div class="menu">
	 <ul>
	 <li id="shouye">首 页</li>
<!--	 <li id="yuyue">挂号预约</li>-->
	 </ul>
	 </div>	 
	 </div>
    <!-- menu结束-->
	<!-- 主页1 -->
  <div class="content01">
	<!-- 主页的左边 -->
	<div class="content01_left">
	<!-- 主页的左边第一个 -->
	<div class="content01_left01">
	   <div class="left01_bg">用户登录</div><input type="hidden" id="u"/>
	   <div class="left01_main">
        <div class="tj_main">
		     <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tr>
                  <td align="right" width="70" height="40" style="font-size: 11px;">用户名：</td>
                  <td align="left"><input class="input" id="userName" title="用户名不能为空" size="14" name="userName" type="text" style=" width:150px"/></td>
                </tr>
                <tr>
                  <td align="right" width="70" height="40" style="font-size: 11px;">密　码：</td>
                  <td align="left"><input class="input" title="密码不能为空" type="password" size="16" id="password" name="userPw" style=" width:150px"/></td>
                </tr>

                <tr>
                  <td align="center" colspan="2" height="40">
                     <input type="button" value="登  录" onclick="login()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
                     <input type="button" value="注  册" onclick="reg()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
                  </td>
                </tr>
	        </table>  
	     </div>
	       <div class="tj_main_user" style="display: none;">
		     <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tr >
                  <td  align="right" width="70" height="80" style="font-size: 11px; text-align: center">登陆用户</td>
                </tr>
                <tr>
                  <td style="text-align: center" id="user" ></td>
                </tr>
                <tr>
                  <td style="text-align: center" ><a href="javascript:yuyue();">挂号预约</a> </td>
                </tr>
	        </table>  
	     </div>			    
        </div>	
      </div>
	<!-- 主页的左边第一个结束 -->
	<!-- 主页的左边第二个 -->
	<div class="content01_left02">
	   <div class="left01_bg">
	   <div class="msh">通知</div>
	   </div>
	   
	   <div class="left02_main">
		 <ul id="gonggao">
		 <li>名师专访：优学部张朋</li>
		 <li>名师专访：天道酬勤——马越</li>
		 <li>名师专访：优学部马超</li>
		 <li>名师专访：高考复读部彭汉伟</li>
		 </ul>
	   </div>	
      </div>
	<!-- 主页的左边第二个结束 -->
    
    
    <!-- 主页的左边第二个 -->
	<div class="content01_left02">
	   <div class="left01_bg">
	   <div class="msh">新闻</div>
	   </div>
	   
	   <div class="left02_main">
		 <ul id="news">
		 <li>名师专访：优学部张朋</li>
		 <li>名师专访：天道酬勤——马越</li>
		 <li>名师专访：优学部马超</li>
		 <li>名师专访：高考复读部彭汉伟</li>
		 </ul>
	   </div>	
		 
		 	
      </div>
	
	</div>
	<!-- 主页的中间 -->
	<div class="content01_mid">
	<!-- 主页的中间第一部分 -->
	<div class="content01_mid01"><img src="images/2.jpg" width="100%" height="100%" style="width: 728px;"/></div>
	<!-- 主页的中间第一部分结束 -->
	
	
	<!-- 主页的中间第二部分 -->
	<div class="content01_mid02">
	<div class="mid_main">
	<div class="mid_head">医院简介</div>
    <p id="intro">2012年石景山区高考探花刘睿祺专访2012年石景山区高考探花刘睿祺专访2012年石景山区高考探花刘睿祺专访</p>
	</div>
	</div>	
	<!-- 主页的中间第二部分结束 -->
	</div>
	<div class="clear"></div>  
  </div>
	<!-- bottom -->
    <div class="bottom">
       
    </div>
    
    <!-- bottom结束 -->
<div id="dialog-form" title="注册">
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
</div>

<div id="dialog-form-yuyue" title="预约">
	<div id="yy">
	  	<table title="预约">
	  		<tr>
	  			<td><span>科室</span><td>
	  			<td>
	  			<select id="dep" name="duty.depart.id">
	  				
	  			</select> 
	  			<td>  
	  		</tr>
	  		<tr>
	  			<td><span>时间</span><td>
	  			<td><input name="date" id="date" type="text" readonly="readonly"> <td> 
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

</div>
</body>
</html>
