$(function(){
	$(".menu-tit").bind("click",function(){
		$(".menu-tit + div").attr("class","menu-list hide");
		$(this).next().attr("class","menu-list");
	});
});

function getParams(panel){
	var queryFrom = $("#"+panel+" input[type=text]");
	var params = {};
	for(var i=0;i<queryFrom.length;i++){
		var name = queryFrom[i].name;
		var val = queryFrom[i].value;
		params[name]=val;
	}
	return params;
}

window.onunload = function() {
	if (window.opener) {
		var listGrid = window.opener.$("#grid-panel");
		if (listGrid && listGrid.length>0) {
			var store = listGrid.data("store");
			store.load();
		}
	}
} 

function storeLoad(){
	var listGrid = $("#grid-panel");
	if (listGrid && listGrid.length>0) {
		var store = listGrid.data("store");
		store.load();
	}
	
}