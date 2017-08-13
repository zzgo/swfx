<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>这个页面没有找到</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/404.css">	
		<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/assets/backstage/images/logo.png"
	type="image/x-icon" />
	</head>
	<body>
		<div id="mother">
			<div id="errorBox">
				<div id="errorText">
					<h1>Sorry..页面没有找到！</h1>
					<p>
						似乎你所寻找的网页已移动或丢失了。
						<p>或者也许你只是键入错误了一些东西。</p>
						我们建议你返回首页官网进行浏览
					</p>

					<p>
						或者请与管理员联系，谢谢！
					</p>
				</div>
				<a href="<%=request.getContextPath()%>/index.html" title="返回首页">
					<div class="link" id="home"></div>
				</a>
				<a href="javascript:;" title="联系管理员">
					<div class="link" id="contact"></div>
				</a>
			</div>
		</div>
  </body>
</html>
