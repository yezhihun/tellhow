/**
 * @author Eric
 */
(function($) {
jQuery.souiPaging = {
	create: function(options) {
		var paging = $("<div></div>");
		paging.addClass("paging-panel");
		paging.css({"height": 29});
		paging.defaults = {
			/*
			 * @store
			 */
			start: 1,
			limit: 15,
			current: 1,
			totalSize: 0,
			totalPages: 1,
			pageParam: 'page.currentPage',
			limitParam: 'page.recordsPerPage'
		};
		var render = function() {
			if (opts.start == opts.totalPages || opts.totalPages == 0) {
				first.addClass("disable");
				pre.addClass("disable");
				last.addClass("disable");
				next.addClass("disable");
				return;
			}
			if (opts.current == opts.start) {
				first.addClass("disable");
				pre.addClass("disable");
				last.removeClass("disable");
				next.removeClass("disable");
			} else if (opts.current == opts.totalPages) {
				first.removeClass("disable");
				pre.removeClass("disable");
				last.addClass("disable");
				next.addClass("disable");
			} else {
				first.removeClass("disable");
				pre.removeClass("disable");
				last.removeClass("disable");
				next.removeClass("disable");
			}
		};
		var opts = $.extend({}, paging.defaults, options),
			pageParam = opts.pageParam,
			limitParam = opts.limitParam,
			start = opts.start,
			limit = opts.limit,
			store = opts.store;
		var first = $("<a>首页</a>");
		first.css({"margin-right": 10});
		first.bind("click", function() {
			if (opts.current <= start) {
				return;
			}
			opts.current = start;
			var params = new Object;
			params[pageParam] = start;
			params[limitParam] = opts.limit;
			store.load(params);
		});
		var last = $("<a>尾页</a>");
		last.css({"margin-right": 10});
		last.bind("click", function() {
			if (opts.current >= opts.totalPages) {
				return;
			}
			var totalPages = opts.totalPages;
			opts.current = opts.totalPages;
			var params = new Object;
			params[pageParam] = totalPages;
			params[limitParam] = opts.limit;
			store.load(params);
		});
		var pre = $("<a>上一页</a>");
		pre.css({"margin-right": 10});
		pre.bind("click", function() {
			var current = opts.current;
			if (current <= start) {
				return;
			}
			opts.current = current - 1;
			var params = new Object;
			params[pageParam] = current -1;
			params[limitParam] = opts.limit;
			store.load(params);
		});
		var next = $("<a>下一页</a>");
		next.css({"margin-right": 10});
		next.bind("click", function() {
			var current = opts.current;
			if (current >= opts.totalPages) {
				return;
			}
			opts.current = current + 1;
			var params = new Object;
			params[pageParam] = current +1;
			params[limitParam] = opts.limit;
			store.load(params);
		});
		var cur = $("<a>第 <input type='text' value='1' style='width:40px;'/> 页</a>");
		cur.css({"margin-right": 10});
		cur.find("input").bind("keypress", function(evt) {
			if (evt.keyCode == '13') {
				var val = cur_input.val();
				if(!parseInt(val,10) || val.indexOf(".")>0 || val<0) {
					alert("页码只允许输入正整数");
					cur_input.val(opts.current);
					return;
				}
				if(opts.totalPages ==0 && val == 1 ){
					return ;
				}
				if (val < start || val > opts.totalPages) {
					alert("输入的页码不存在");
					cur_input.val(opts.current);
					return;
				} else {
					opts.current = parseInt(val,10);
				}
				var params = new Object;
				params[pageParam] = val;
				params[limitParam] = opts.limit;
				store.load(params);
			}
		});
		var cur_input = cur.find(":input");
		var tol = $("<a></a>");
		tol.css({"margin-right": 10});
		tol.html("共0页 0条记录");
		var loadbtn = $("<input type='button' value='刷新'/>");
		loadbtn.css({"margin-right": 10});
		loadbtn.bind("click", function() {
			var val = cur_input.val();
			if(!parseInt(val,10) || val.indexOf(".")>0 || val<0) {
				alert("页码只允许输入正整数");
				cur_input.val(opts.current);
				return;
			}
			if(opts.totalPages ==0 ){
				return ;
			}
			if (val < start || val > opts.totalPages) {
				alert("输入的页码不存在");
				cur_input.val(opts.current);
				return;
			} else {
				opts.current = parseInt(val,10);
			}
			var params = getParams();
			params[pageParam] = val;
			params[limitParam] = opts.limit;
			store.load(params);
		});
		store.bind("pagingbeforeload", function(evt, data) {
			opts.current = data[pageParam];
			opts.limit = data[limitParam];
			cur_input.val(opts.current);
		})
		store.bind("pagingafterload", function(evt, total) {
			opts.totalSize = total;
			opts.totalPages = Math.ceil(opts.totalSize/opts.limit);
			cur_input.val(opts.current);
			tol.html("共"+opts.totalPages+"页 "+total+"条记录");
			render();
		});
		render();
		paging.append(first);
		paging.append(pre);
		paging.append(cur);
		paging.append(tol);
		paging.append(next);
		paging.append(last);
		paging.append(loadbtn);
		paging.setCss = function (css) {
			paging.css(css);
		}
		return paging;
	}
}
})(jQuery);
function getParams(){
	var result = {};
	var array = $("form").serializeArray();
	$.each(array, function(i, c) {
		var reg = /.*[\u4e00-\u9fa5]+.*$/;
		if (c.value != "") {
			if (!result[c.name] || result[c.name] == null || typeof(result[c.name]) == 'undefined') {
				if(reg.test(c.value)){
					result[c.name] = encodeURIComponent(String(c.value));
				}else{
					result[c.name]=c.value;
				}
			} else if (isArray(result[c.name])) {
				if(reg.test(c.value)){
					result[c.name].push(encodeURIComponent(String(c.value)));
				}else{
					result[c.name].push(c.value);
				}
			}
		}
	});
	return result;
}