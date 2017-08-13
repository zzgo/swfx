<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     	<meta charset="UTF-8">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
  		<title>成都市实验外国语学校附属小学后台管理系统</title>
  		<%@include file="../public/Css.jsp" %>
  		<%@include file="../public/Js.jsp" %>
  </head>
  
  <body>
  <%@include file="../public/top.jsp" %>
  <%@include file="../public/left.jsp" %>
  <div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li class="active">首页</li>
						</ul><!-- .breadcrumb -->
					</div>
<div class="panel panel-default">
  <div class="panel-body">
  上次登录时间：<span>${UserInfo.lastLoginTime }</span>
  </div>
</div>
<div class="alert alert-warning alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 欢迎使用成都市实验外国语学校附属小学后台管理系统！
</div>	
<div >
<img src="<%=path %>/assets/images/introduce.jpg" style="margin-left:2%;">
</div>				
 </div>
  </body>
</html>
