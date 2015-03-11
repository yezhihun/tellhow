/**
 * @author Eric
 */

function isArray(value) {
	if (value instanceof Array || 
		(!(value instanceof Object) && 
		(Object.prototype.toString.call((value)) == '[object Array]') || 
		value &&
		value.lenght &&
		typeof value.length == 'number' && 
		typeof value.splice != 'undefined' && 
		typeof value.propertyIsEnumerable != 'undefined' && 
		!value.propertyIsEnumerable('splice'))) { 
		return true; 
	} 
}

function getRoot(data, expr) {
	var arr = expr.split("\."),
		result = data;
	for (var i=0; i<arr.length; i++) {
		var tmp = result[arr[i]];
		if (!tmp || tmp == null) {
			return;
		}
		result = result[arr[i]];
	}
	return result;
}

function validDate(from,to) {
	var date1 = new Date();
	var fromDate = from.split(' ')[0];
	var fromTime =  from.split(' ')[1];
    var fromYear =  fromDate.split('-')[0];
    var fromMonth = fromDate.split('-')[1];
    var fromDay = fromDate.split('-')[2];
    date1.setFullYear(parseInt(fromYear,10));
    date1.setMonth(parseInt(fromMonth,10)-1);
    date1.setDate(parseInt(fromDay,10));
    date1.setSeconds(0);
    if(fromTime){
	    var fromHour = fromTime.split(':')[0];
	    var fromMinutes = fromTime.split(':')[1];
	    date1.setHours(parseInt(fromHour,10));
	    date1.setMinutes(parseInt(fromMinutes,10));
    }else{
	    date1.setHours(0);
	    date1.setMinutes(0);
    }
	var date2 = new Date();
	var toDate = to.split(' ')[0];
	var toTime =  to.split(' ')[1];
    var toYear =  toDate.split('-')[0];
    var toMonth = toDate.split('-')[1];
    var toDay = toDate.split('-')[2];
    date2.setFullYear(parseInt(toYear,10));
    date2.setMonth(parseInt(toMonth,10)-1);
    date2.setDate(parseInt(toDay,10));
    date2.setSeconds(0);
    if(toTime){
	    var toHour = toTime.split(':')[0];
	    var toMinutes = toTime.split(':')[1];
	    date2.setHours(parseInt(toHour,10));
	    date2.setMinutes(parseInt(toMinutes,10));
    }else{
	    date2.setHours(0);
	    date2.setMinutes(0);
    }
    if(date1>date2){
    	return false;
    }
    return true;
}

function initDate(options) {
	var from = new Date(),
		to = new Date(),
		fromstr = "",
		tostr = "";
	if (options.unit && options.unit == "year") {
		from.setFullYear(from.getFullYear()-1);
	} else if (options.unit && options.unit == "day") {
		    from.setDate(to.getDate()-10);
		    to.setDate(to.getDate()-1);
		} else {
			from.setMonth(from.getMonth()-1);
		
	}
	fromstr = from.getFullYear()+"-"; 
	if((from.getMonth()+1)<10){
		fromstr = fromstr + "0" + (from.getMonth()+1) + "-";
	}else{
		fromstr = fromstr + (from.getMonth()+1) + "-";
	}
	if (options.unit && options.unit == "year") {
		fromstr = fromstr+"01";
	} else {
		if(from.getDate()<10){
			fromstr = fromstr + "0" + from.getDate();
		}else{
			fromstr = fromstr + from.getDate();
		}
	}

	tostr = to.getFullYear()+"-"; 
	if((to.getMonth()+1)<10){
		tostr = tostr + "0" + (to.getMonth()+1) + "-";
	}else{
		tostr = tostr + (to.getMonth()+1) + "-";
	}
	if (options.unit && options.unit == "year") {
		tostr = tostr+"01";
	} else {
		if(to.getDate()<10){
			tostr = tostr + "0" + to.getDate();
		}else{
			tostr = tostr + to.getDate();
		}
	}

	$("#"+options.from).val(fromstr);
	$("#"+options.to).val(tostr);
	if(options.fromTime && options.fromTimeName && options.toTime && options.toTimeName){
		if($("#"+options.fromTime).val()!=""){
			$("input[name='"+options.fromTimeName+"']").val( fromstr + " " + $("#"+options.fromTime).val() + ":00");
		}else{
			$("input[name='"+options.fromTimeName+"']").val( fromstr+ " 00:00:00");
		}
		if($("#"+options.toTime).val()!=""){
			$("input[name='"+options.toTimeName+"']").val( tostr + " " + $("#"+options.toTime).val() + ":00");
		}else{
			$("input[name='"+options.toTimeName+"']").val( tostr+ " 23:59:00");
		}
	}
}

/**
 * 
 * 比较日期相差月份是否满12个月
 *   form:'yyyy-mm-dd'
 *     to:'yyyy-mm-dd'
 * return:true-大于12个月,false-小于等于12个月
 * */
function compareDate(options) {
	var from = $("#"+options.from).val();
	var to = $("#"+options.to).val();
	var fromYear = parseInt(from.substr(0,4),10);
	var toYear = parseInt(to.substr(0,4),10);
	var fromMonth = parseInt(from.substr(5,2),10);
	var toMonth = parseInt(to.substr(5,2),10);
	var months=12*(toYear-fromYear)+(toMonth-fromMonth);
	var result = false;
	if(months>12){
		result =  true;
	}
    return result;
}

/**
 * 
 * 比较日期相差天数是否满10天
 *   form:'yyyy-mm-dd'
 *     to:'yyyy-mm-dd'
 * return:true-大于10天,false-小于等于10天
 * */
function compareDay(options) {
	var from = $("#"+options.from).val().replace(/-/g, "/");;
	var to = $("#"+options.to).val().replace(/-/g, "/");;
	var fromDate = new Date(from);
	var toDate = new Date(to);
	var time = toDate.getTime() - fromDate.getTime();
	var days = parseInt(time/(1000 * 60 * 60 * 24),10)+1;
	var result = false;
	if(days>10){
		result =  true;
	}
    return result;
}
