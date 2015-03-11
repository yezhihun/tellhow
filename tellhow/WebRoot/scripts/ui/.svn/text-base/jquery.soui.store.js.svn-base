/**
 * @author Eric
 */
(function($) {
jQuery.souiStore = {
	create: function(options) {
		var store = $(new Object);
		var isLoaded = false; 
		store.defaults = {
			/*
			 * @url
			 */
			type: 'POST',
			root: 'list',
			current: 1,
			limit: 15,
			pageParam: 'page.currentPage',
			limitParam: 'page.recordsPerPage',
			totalProperty: 'page.totalRecords',
			timeout: 5000,
			async: true,
			before: function(request) {},
			cache: false,
			//after: function(request, text) {},
			contentType: 'application/x-www-form-urlencoded',
			/*
			 * @params
			 */
			dataType: 'json',
			error: function(request, text, errorThrown) {},
			global: true,
			ifModified: false,
			processData: true,
			success: function(data, text) {}
		};
		var opts = $.extend({}, store.defaults, options);
		store.load = function(params) {
			params = params || new Object;
			params["_romdom"] = Math.random()*16+1;
			if (params.current && params.limit) {
				var tmp = new Object;
				tmp[opts.pageParam] = params.current;
				tmp[opts.limitParam] = params.limit;
				opts.current = params.current;
				opts.limit = params.limit;
				params = $.extend({}, params, tmp);
				delete params.current;
				delete params.limit;
				store.trigger("pagingbeforeload", [params]);
			} else if (params[opts.pageParam] && params[opts.limitParam]) {
				opts.current = params[opts.pageParam];
				opts.limit = params[opts.limitParam];
			} else {
//				if (!isLoaded) {
//					return;
//				}
//				var tmp = new Object;
//				tmp[opts.pageParam] = opts.current;
//				tmp[opts.limitParam] = opts.limit;
//				params = $.extend({}, params, tmp);
			}
			isLoaded = true;
			$.ajax({
				url: opts.url,
				type: opts.type,
				timeout: opts.timeout,
				async: opts.async,
				beforeSend: store.before,
				cache: opts.cache,
				complete: opts.after,
				contentType: opts.contentType,
				data: $.extend({}, opts.params, params),
				dataType: opts.dataType,
				error: opts.error,
				global: opts.global,
				ifModified: opts.ifModified,
				processData: opts.processData,
				success: store.success
			});
		};
		store.setParams = function(params) {
			opts.params = params;
		}
		store.success = function(json, text) {
			var data;
			if (!opts.root || opts.root.length == 0) {
				data = json;
			} else {
				data = getRoot(json, opts.root);
			}
			store.trigger("gridafterload", [data]);
			var total = getRoot(json, opts.totalProperty);
			if (!total) {
				total = 0;
			}
			store.trigger("pagingafterload", [total]);
			opts.success(json, text);
		};
		store.before = function(request) {
			store.trigger("gridbeforeload");
			opts.before(request);
		};
		return store;
	}
}
})(jQuery);
