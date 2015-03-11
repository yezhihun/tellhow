/**
 * jquery.soui.grid @version 1.0.0
 *  
 * @author Eric Chi
 */
(function($) {

$.fn.souiGrid = function(options) {
	var $this,
		msgPanel,
		coverPanel,
		lastWidth,
		totalWidth;
	$this = this;
	$this.children().remove();
	options.msgPanel = msgPanel;
	options.coverPanel = coverPanel;
	options.lastWidth = lastWidth;
	options.totalWidth = totalWidth;
	var opts = $.extend({}, $.fn.souiGrid.defaults, options);
	_init($this, opts);
	return $this;
}

function _init(wrapper, options) {
	if (options.autoHeight) {
		var parentHight = wrapper.parent().height();
		var gridHight = parentHight-document.getElementById(wrapper.attr("id")).offsetTop-10;
		options.height=gridHight;
	}
	_drawGridPanelTitle(wrapper, options);
	_drawGridPanelTBar(wrapper, options);
	var grid = $("<div></div>");
	wrapper.resize(function() {
		_refresh(grid, options);
	});
	options.id = "grid-" + wrapper.attr("id");
	wrapper.append(grid);
	_drawGridPanel(grid, options);
	_drawGridHeader(grid, options);
	_drawGridCover(grid, options);
	_drawGridBody(grid, options);
	_drawGridPaging(grid, options);
	wrapper.data("store", options.store);

}

function _drawGridPanelTitle(wrapper, options) {
	if (options.title && options.title.length > 0) {
		var titlebar = $("<div></div>");
		titlebar.addClass("grid-panel-title-ct");
		var title = $("<div></div>");
		title.addClass("title");
		title.append(options.title);
		titlebar.append(title);
		wrapper.append(titlebar);
	}
}

function _drawGridPanelTBar(wrapper, options) {
	if (options.tbar) {
		var tbar = $("<div></div>");
		tbar.addClass("grid-panel-tbar-ct");
		tbar.append(options.tbar);
		wrapper.append(tbar);
	}
}

function _drawGridPanel(grid, options) {
	grid.addClass("grid-panel grid-border-box");
	if (options.css) {
		grid.css(options.css);
	}
	if (options.width) {
		grid.width(options.width);
	} else {
		options.width = grid.width();
	}
	if (options.height) {
		grid.height(options.height);
	} else {
		options.height = grid.height();
	}
}

function _drawGridHeader(grid, options) {
	var container = $("<div></div>");
	container.attr("id", options.id + "-grid-panel-header-ct");
	container.addClass("grid-panel-header-ct grid-border-box")
	container.css({"width": options.width, "left": 0, "top": 0, "border-width": "1px"});
	var innerContainer = $("<div></div>");
	innerContainer.attr("id", options.id + "-grid-panel-header-innerct");
	innerContainer.addClass("grid-panel-header-innerct grid-border-box");
	container.append(innerContainer);
	var posLeft = 0;
	for (var index=0; index<options.columns.length; index++) {
		var column = options.columns[index];
		var box = $("<div></div>");
		box.addClass("grid-panel-header-box grid-border-box");
		box.css({"width": column.width-1, "height": options.headerHeight, "border-width": 1, "left": posLeft, "top": 0, "margin": 0});
		innerContainer.append(box);
		var titleContainer = $("<div></div>");
		titleContainer.css({"margin": "6px 0px 2px 0px", "padding": "0px 10px 0px 10px"});
		if (column.checkable) {
			var name = column.name || column.key;
			var checkbox = $("<input type='checkbox' name='cbx_" + name + "' value='cbx_" + index + "'/>");
			checkbox.bind("change", function(evt) {
				var checked = this.checked;
				var view = $("#" + options.id + "-grid-panel-body-view");
				if (view) {
					if (checked) {
						view.find("input[name='" + name + "']").each(function() {
							this.checked= true;
						});
					} else {
						view.find("input[name='" + name + "']").each(function() {
							this.checked= false;
						});
					}
				}
			});
			titleContainer.append(checkbox);
		}
		titleContainer.append(column.label);
		box.append(titleContainer);
		if (!column.width) {
			column.width = 0;
		}
		posLeft += column.width;
		if (index==options.columns.length-1 && posLeft<options.width) {
			options.lastWidth = options.width - posLeft + column.width;
			box.css("width", options.lastWidth);
			posLeft = options.width;
		}
	}
	innerContainer.css({"width": posLeft, "height": options.headerHeight});
	options.totalWidth = posLeft;
	grid.append(container);
}

function _drawGridBody(grid, options) {
	var pagingHeight = 0;
	if (options.paging) {
		pagingHeight = options.paging.height();
	}
	var container = $("<div></div>");
	container.attr("id", options.id + "-grid-panel-body-ct");
	container.addClass("grid-panel-body grid-border-box");
	container.css({"width": options.width, "height": (options.height - options.headerHeight - pagingHeight), "left": 0, "top": options.headerHeight});
	grid.append(container);
	var view = $("<div></div>");
	view.attr("id", options.id + "-grid-panel-body-view");
	view.addClass("grid-panel-body-view grid-border-box");
	if (options.width == options.totalWidth) {
		view.css({"width": (options.width), "height": (options.height - options.headerHeight - pagingHeight), "overflow-y": "auto", "overflow-x": "hidden"});
	} else {
		view.css({"width": (options.width), "height": (options.height - options.headerHeight - pagingHeight), "overflow-y": "auto", "overflow-x": "auto"});
	}
	container.append(view);
	var headerInnerContainer = grid.find("#" + options.id + "-grid-panel-header-innerct");
	var x = 0;
	view.scroll(function() {
		var tmp = $(this).scrollLeft();
		if (x != tmp) {
			headerInnerContainer.css("left", -tmp);
			x = tmp;
		}
	});
	view.html("<div style='height:1px;width:" + options.totalWidth + "px;'></div>");
	options.msgPanel = $("<div></div>");
	options.msgPanel.attr("id", options.id + "grid-panel-msg");
	options.msgPanel.css({"position": "absolute", "top": "0", "left": 0,"margin-top": 60, "width": options.width, "text-align": "center"});
	options.msgPanel.append(options.defaultMsg);
	options.msgPanel.hide();
	container.append(options.msgPanel);
	_bindSotre(grid, view, options);
	if (options.autoLoad) {
		options.store.load();
	} else {
		options.msgPanel.show();
	}
}

function _bindSotre(grid, view, options) {
	if (options.store) {
		options.store.bind("gridbeforeload", function(evt) {
			options.msgPanel.hide();
			options.coverPanel.show();
		});
		options.store.bind("gridafterload", function(evt, datas) {
			var headerint = grid.find("#" + options.id + "-grid-panel-header-innerct");
			headerint.css({"left": 0});
			if (!datas || datas.length == 0) {
				view.children().remove();
				view.html("<div style='height:1px;width:" + options.totalWidth + "px;'></div>");
				options.msgPanel.html(options.emptyMsg);
				options.msgPanel.css({"width": options.width});
				options.coverPanel.hide();
				options.msgPanel.show();
				return;
			}
			view.children().remove();
			view.scrollTop(0);
			view.scrollLeft(0);
			var buffer = [];
			var table = $("<table border=0 cellpadding=0 cellspacing=0 style='table-layout:fixed;word-break:break-all; border-collapse:collapse; text-align:center'></table>");
			table.css("width", options.totalWidth);
			for (var index=0; index<datas.length; index++) {
				var data = datas[index],
					len = options.columns.length;
				buffer.push("<tr>");
				for (var i=0; i<len; i++) {
					var col = options.columns[i];
					if (i==len-1 && options.lastWidth) {
						width = options.lastWidth;
					} else {
						width = col.width;
					}
					buffer.push("<td class='grid-panel-body-view-row' style='width:" + width + "px;'>");
					var v = data[col.key];
					if (col.checkable) {
						var name = col.name || col.key;
						buffer.push("<div style='margin:0;padding:0px 10px;'><input type='checkbox' name='"+name+"' value='"+v+"'/></div></td>");
					} else {
						if (col.renderer) {
							var text = col.renderer(data, v);
							if (!text || text.length == 0) {
								text = "&nbsp;";
							}
							buffer.push("<div style='margin:0;padding:0px 10px;'>"+text+"</div></td>");
						} else {
							if (!v || v.length == 0) {
								buffer.push("<div style='margin:0;padding:0px 10px;'>&nbsp;</div></td>");
							} else {
								buffer.push("<div style='margin:0;padding:0px 10px;'>"+v+"</div></td>");
							}
						}
					}
				}
				buffer.push("</tr>");
			}
			if (options.columnsummary) {
				buffer.push("<tr>");
				var size = options.columnsummary.length;
				for (var j=0;j<size;j++) {
					buffer.push("<td class='grid-panel-body-view-row' style='width:" + 100 + "px;'>");
					var coll = options.columnsummary[j];
					if (!coll.label || coll.label.length == 0) {
					}else{
						buffer.push("<div style='margin:0;padding:0px 10px;'>"+coll.label+"</div></td>");
					}
					if (!coll.key || coll.key.length == 0) {
					}else{
						var sum=0;
						for (var index=0; index<datas.length; index++) {
							var sdata = datas[index],
								slen = options.columns.length;
							for (var n=0;n<slen;n++) {
								   var c = options.columns[n];
								   if(c.key==coll.key){
									   sum = sum + parseFloat(sdata[c.key]);
								   }
							}
						}
						if (coll.toFixed && coll.toFixed!=""){
							sum = sum.toFixed(parseInt(coll.toFixed));
						}
						if (coll.endWidth && coll.endWidth!=""){
							sum = sum+coll.endWidth;
						}
						buffer.push("<div style='margin:0;padding:0px 10px;'>"+sum+"</div></td>");
						sum=0;
					}
				}
				buffer.push("</tr>");
			}
			table.html(buffer.join(''));
			view.append(table);
			var selectedtr;
			table.find("tr").bind("click", function(evt) {
				var tr = $(this);
				if (selectedtr) {
					selectedtr.css({background: "#FFFFFF", color: "#FFFFFF"});
				}
				tr.css({background: "#F6F9FB", color: "#006CBA"});
				selectedtr = tr;
			});
			options.coverPanel.hide();
		});
	}
}

function _drawGridCover(grid, options) {
	options.coverPanel = $("<div></div>");
	options.coverPanel.addClass("grid-panel-cover");
	options.coverPanel.attr("id", grid.attr("id") + "grid-cover");
	options.coverPanel.css({"width": options.width, "height": options.height});
	options.coverPanel.append("<div style='position: absolute;top: 50%; left: 0;text-align: center; width: "+options.width+"px;'>"+options.loadingMsg+"</div>");
	options.coverPanel.hide();
	grid.append(options.coverPanel);
}

function _drawGridPaging(grid, options) {
	var paging = options.paging;
	if (paging) {
		var h = $("#"+options.id+"-grid-panel-header-ct").height();
		paging.css({"top": h});
		grid.append(paging);
	}
}

function _refresh(grid, options) {
	var width = grid.width();
	var headerct = grid.find("#"+options.id+"-grid-panel-header-ct"),
		headerint = grid.find("#" + options.id + "-grid-panel-header-innerct"),
		bodyct = grid.find("#"+options.id+"-grid-panel-body-ct"),
		bodyview = grid.find("#"+options.id+"-grid-panel-body-view");
	bodyview.scrollLeft(0);
	headerint.css({"left": "0px"});
	headerct.css({"width": width});
	bodyct.css({"width": width});
	if (width == options.totalWidth) {
		bodyview.css({"width": width, "overflow-y": "auto", "overflow-x": "hidden"});
	} else {
		bodyview.css({"width": width, "overflow-y": "auto", "overflow-x": "auto"});
	}
	options.msgPanel.css({"width": width});
	options.coverPanel.css({"width": width});
	options.coverPanel.find("div").css({"width": width});
}

$.fn.souiGrid.defaults = {
	/*
	 * @width
	 */
	/*
	 * @height
	 */
	/*
	 * @columns
	 */
	headerHeight: 26,
	autoLoad: false,
	autoHeight: false,
	/*
	 * @store
	 */
	/*
	 * @paging
	 */
	/*
	 * @css
	 */
	defaultMsg: '&lt;请输入查询条件&gt;',
	emptyMsg: '&lt;无数据&gt;',
	loadingMsg: "正在加载,请稍后"
}

})(jQuery);

(function($, window, undefined) {
	'$:nomunge';
	var elems = $([]),
	jq_resize = $.resize = $.extend($.resize, {}),
	timeout_id,
	str_setTimeout = 'setTimeout', str_resize = 'resize', str_data = str_resize
			+ '-special-event', str_delay = 'delay', str_throttle = 'throttleWindow';
	jq_resize[str_delay] = 100;
	jq_resize[str_throttle] = true;
	$.event.special[str_resize] = {
		setup : function() {
			if (!jq_resize[str_throttle] && this[str_setTimeout]) {
				return false;
			}
			var elem = $(this);
			elems = elems.add(elem);
			$.data(this, str_data, {
				w : elem.width(),
				h : elem.height()
			});
			if (elems.length === 1) {
				loopy();
			}
		},
		teardown : function() {
			if (!jq_resize[str_throttle] && this[str_setTimeout]) {
				return false;
			}
			var elem = $(this);
			elems = elems.not(elem);
			elem.removeData(str_data);
			if (!elems.length) {
				clearTimeout(timeout_id);
			}
		},
		add : function(handleObj) {
			if (!jq_resize[str_throttle] && this[str_setTimeout]) {
				return false;
			}
			var old_handler;
			function new_handler(e, w, h) {
				var elem = $(this), data = $.data(this, str_data);
				data.w = w !== undefined ? w : elem.width();
				data.h = h !== undefined ? h : elem.height();
				old_handler.apply(this, arguments);
			};
			if ($.isFunction(handleObj)) {
				old_handler = handleObj;
				return new_handler;
			} else {
				old_handler = handleObj.handler;
				handleObj.handler = new_handler;
			}
		}
	};
	function loopy() {
		timeout_id = window[str_setTimeout](function() {
			elems.each(function() {
				var elem = $(this), width = elem.width(), height = elem
						.height(), data = $.data(this, str_data);
				if (width !== data.w || height !== data.h) {
					elem.trigger(str_resize,
							[ data.w = width, data.h = height ]);
				}
			});
			loopy();
		}, jq_resize[str_delay]);
	};
})(jQuery, this);
