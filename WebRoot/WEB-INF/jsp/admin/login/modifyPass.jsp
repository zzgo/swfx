<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>成都市实验外国语学校附属小学网站后台登录</title>
	<link href="<%=path %>/assets/css/login.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/backstage/images/logo.png" type="image/x-icon" /> 
 	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/loading.css">
  </head>
  
  <body>
  	<div id="tab">
  <div class="tab_box"> 
    <!-- 登录开始 -->
    <p>欢迎登录实外附小网站后台管理系统</p>
    <div>
      <div class="stu_error_box"></div>
      <form novalidate="novalidate" id="jsForm">
        <div >
          <label>原密码：</label>
          <input type="password" name="oldPss" class="oldPass" value="" placeholder="原密码" data-msg-required="不能为空" required="" >
        </div>
        <div >
          <label>新密码：</label>
          <input type="password" name="newPass" class="newPass" value="" placeholder="新密码" data-msg-required="不能为空" required="" >
        </div>
        <div >
          <label>确认密码：</label>
          <input type="password" name="reNewPass" class="reNewPass" value="" placeholder="新密码" data-msg-required="不能为空" required="" >
        </div>
        <div id="login">
          <button type="button" id="Submit">修改密码</button>
        </div>
      </form>
    </div>
   <!-- 登录结束-->
  </div>
</div>

<div class="screenbg">
  <ul>
    <li><a href="javascript:;"><img src="<%=path %>/assets/images/backbg.jpg"></a></li>
  </ul>
</div>
<div id="wrap" class="wrap"><div><img src="<%=request.getContextPath() %>/assets/images/flash.gif"><span class="tipMsg">正在登录中...请稍后</span></div></div>
<script type="text/javascript" src="<%=path %>/assets/js/jquery.min.js"></script>	
<script type="text/javascript" src="<%=path %>/assets/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/validate.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/assets/js/loading2.js"></script>
<script type="text/javascript">
$(function(){
	$(".screenbg ul li").each(function(){
		$(this).css("opacity","0");
	});
	$(".screenbg ul li:first").css("opacity","1");
	var index = 0;
	var t;
	var li = $(".screenbg ul li");	
	var number = li.size();
	function change(index){
		li.css("visibility","visible");
		li.eq(index).siblings().animate({opacity:0},3000);
		li.eq(index).animate({opacity:1},3000);
	}
	function show(){
		index = index + 1;
		if(index<=number-1){
			change(index);
		}else{
			index = 0;
			change(index);
		}
	}
	t = setInterval(show,8000);
	//根据窗口宽度生成图片宽度
	var width = $(window).width();
	$(".screenbg ul img").css("width",width+"px");
});
$(function(){
	$("#Submit").click(function(){
		$("#jsForm").submit();
	});
    //jquery.validate
	$("#jsForm").validate({
		submitHandler: function() {
			loadingShow();
			//验证通过后 的js代码写在这里
			var name = $('.name').val();
			        var oldPass = $('.oldPass').val();
			         var newPass = $('.newPass').val();
			          var reNewPass = $('.reNewPass').val();
			          if(newPass!=reNewPass){
			           alert("两次密码不一致");
			           loadingHide();
			          	return;
			          }
			        var data = {
				        oldPass:oldPass,
				        newPass:newPass,
				        userId:'${userId}'
			        };
					$.ajax({
						url : "<%=basePath%>admin/user/updatePass",
						data : data,
						type : "post",
						dataType : "json",
						beforeSend : function() {
						},
						success : function(result) {
							if (result && result.status != 200) {
								loadingHide();
								alert(result.message);
								window.reload();
								return;
							} else {
								setTimeout(function() {
								loadingHide();
								alert(result.message);
									//登录返回
									window.location.href = "<%=basePath%>"+result.backUrl;
								}, 1000)
							}
						},
						error : function(e) {
							loadingHide();
							alert("登录异常");
						}
					});
		}
	})
		
})
</script>
  </body>
</html>
