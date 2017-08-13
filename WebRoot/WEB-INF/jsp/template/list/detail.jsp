<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../../admin/public/JSTL.jsp" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="UTF-8">
	<title>${news.title }--成都市实验外国语学校</title>
	<%@include file="../public/Css.jsp" %>
	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/newsContent.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/newsDetails.css">
  </head>
  <body>
  	<%@include file="../public/header.jsp" %>
  	<!--列表类新闻-->
<div class="second-titile"><p>${nav.name }</p></div>
<div class="main-details">
<div class="idea"><img src="<%=path %>/assets/images/idea.png">
</div>
<div class="aside-left">
<div class="details-position">
<p><img src="<%=path %>/assets/images/address.png">当前位置：<a href="<%=path%>/index"><span>首页</span></a> &gt; <a href="<%=path%>/list/${nav.link }-1.html"><span>${nav.name }</span></a></p>
</div>
<div class="" style="width:100%;">
<div class="main-content">
<p class="content-title">${news.title }</p>
<p class="content-message">
作者：<span>${news.author }</span>&nbsp;&nbsp;&nbsp;&nbsp;
  编辑：<span>${news.editor }</span>&nbsp;&nbsp;&nbsp;&nbsp;  
  点击次数：<span>${news.clickCount }</span>&nbsp;&nbsp;&nbsp;&nbsp;  
  发布时间：<span>${news.addTime }</span>	
</p>
<!--新闻内容-->
<div class="main-html">
${news.content }
</div>	
<!--新闻内容结束-->
</div>
</div>
</div>
<%@include file="../public/info.jsp" %>
<!--新闻列表结束-->
<%@include file="../public/footer.jsp" %>
<%@include file="../public/Js.jsp" %>
<script type="text/javascript" src="<%=path %>/assets/js/newsDetails.js"></script>
  </body>
</html>
