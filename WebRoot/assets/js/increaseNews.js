 $(function () {  
    $('#datetimepicker2').datetimepicker({  
        format: 'yyyy-mm-dd hh:ii',  
        locale: moment.locale('zh-cn'),
         minView:2,//最精准的时间选择为日期0-分 1-时 2-日 3-月 
            weekStart:0
    });
    $('#datetimepicker3').datetimepicker({  
        format: 'yyyy-mm-dd hh:ii',  
        locale: moment.locale('zh-cn'),
         minView:2,//最精准的时间选择为日期0-分 1-时 2-日 3-月 
            weekStart:0
    });  
});
