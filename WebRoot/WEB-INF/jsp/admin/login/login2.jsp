<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="<%=path%>/assets/js/jquery.min.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<form action="">
		<input type="text" name="name" class="name"/>
		<input type="text" name="password" class="password"/>
		<input type="text" name="vc" class="vc"/><img alt="" src="<%=path%>/vc/ma" onclick="this.src='<%=path%>/vc/ma?d='+Math.random();"> 
		<input type="button" class="login" value="登陸"/>
	</form>
	<script type="text/javascript">
    
    	$(".login").click(function(){
    				var name = $('.name').val();
			        var password = $('.password').val();
			         var vc = $('.vc').val();
			        var data = {
				        name:name,
				        password:password,
				        vc:vc
			        };
					$.ajax({
						url : "<%=path%>/admin/user/login",
						data : data,
						type : "post",
						dataType : "json",
						beforeSend : function() {
							alert("开始登录");
						},
						success : function(result) {
							if (result && result.status != 200) {
								alert(result.message);
								return;
							} else {
								setTimeout(function() {
								alert(result.message);
									//登录返回
									window.location.href = "<%=path%>/"+result.backUrl;
								}, 1000)
							}
						},
						error : function(e) {
							alert("登录异常");
						}
					});
				})
	</script>
</body>
</html>
