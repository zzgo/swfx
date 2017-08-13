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
	<title>成都市实验外国语学校</title>
	<%@include file="../public/Css.jsp" %>
	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/newsDetails.css">	
	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/newsDetailsImage.css">
  </head>
  
  <body>
  <%@include file="../public/bg.jsp" %>
  	 <%@include file="../public/header.jsp" %>
  	 
  	 <!--列表类新闻-->
<div class="second-titile"><p>${nav.name }</p></div>
<div class="main-details">
<div class="idea"><img src="<%=path %>/assets/images/idea.png">
</div>
<div class="aside-left">
<div class="details-position">
<p><img src="<%=path %>/assets/images/address.png">当前位置：<a href="<%=path%>/index"><span>首页</span></a> &gt; <a href="<%=path%>/list/${nav.link }_1.html"><span>${nav.name }</span></a></p>
</div>
<%@include file="../public/page.jsp" %>
<script type="text/javascript">
				function gotoPage(pageNum) {
					location.href= "<%=path%>/list/${nav.link}-"+pageNum+".html";
				};
</script>
<div class="article">
<c:forEach items="${page.results }" var="varNews">
<!--主要内容填充-->
<div class="article-box">
<figure>
<img src="<%=path %>${ varNews.image}">	
</figure>	
<ul id="title">
<li class="news-t"><a href="<%=path%>/detail/${varNews.id}.html">${ varNews.title}</a></li>
<li class="news-content">${ varNews.summary}</li>
<li>
<time>${ varNews.oneTime}</time>
</li>
</ul>
</div>
<!--主要内容填充-->
</c:forEach>
</div>
</div>
<%@include file="../public/info.jsp" %>
<%@include file="../public/footer.jsp" %>
<%@include file="../public/Js.jsp" %>
<script type="text/javascript" src="<%=path %>/assets/js/newsDetails.js"></script>
<!--新闻列表结束-->
  </body>
</html>
