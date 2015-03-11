(function($){
	$.fn.tyGrid = function(options){
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
		
		var opts = $.extend({},$.fn.tyGrid.defaults,options);
		_init($this,opts);
		return $this;
	}
	
	function _init(wrapper,options){
		_drawGridPanelTitle(wrapper,options);
		var grid = $("<div></div>");
		options.id = wrapper.attr("id");
		wrapper.append(gird);
		_drawGridPanel(grid, options);
		_drawGridHeader(grid,options);
		_drawGridCover(grid, options);
	}
	
	/**
	 * 创建标题
	 */
	function _drawGridPanelTitle(wrapper,options){
		if(options.title && options.title.length>0){
			var titleBar = $("<div></div>");
			var title = $("<div></div>");
			title.append(options.title);
			titleBar.append(title);
			wrapper.append(titleBar);
		}
	}
	
	/**
	 * 创建表头
	 */
	function _drawGridHeader(grid,options){
		var container = $("<div></div>");
		var innerContainer = $("<div></div>");
		container.append(innerContainer);
		var posLeft = 0;
		for(var index=0;index<options.columns.length;index++){
			var column = options.columns[index];
			var box = $("<div></div>");
			titleContainer.append(box);
			var titleContainer = $("<div></div>");
			titleContainer.append(column.label);
			box.append(titleContainer);
		}
	}
	
	/**
	 * grid 样式定义
	 */
	function _drawGridPanel(grid, options){
		if(options.css){
			grid.css(options.css);
		}
		if(options.width){
			grid.width(options.width);
		}else{
			options.width = grid.width();
		}
		if(options.height){
			grid.height(options.height);
		}else{
			options.height = grid.height();
		}
	}
	
	/**
	 * grid 默认参数
	 */
	$.fn.tyGrid.defaults = {
			headerHeight: 26,
			autoLoad: false,
			autoHeight: false,
			defaultMsg : "&lt;请输入查询条件&gt;",
			emptyMsg: "&lt;无数据&gt;",
			loadingMs: "正在加载,请稍后"
	}
	
})(jQuery);