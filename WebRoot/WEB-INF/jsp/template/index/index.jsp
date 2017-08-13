<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../../admin/public/JSTL.jsp" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>成都市实验外国语学校</title>                    
	<%@include file="../public/Css.jsp" %>
</head>
<body>
	<%@include file="../public/header.jsp" %>
	<div class="banner" id="banner">
<ul class="clearfix" id="change">
	<c:forEach items="${lbtList }" var="varNews">
		<li><img src="<%=path %>${varNews.image}"><p>${varNews.title }</p></li>
	</c:forEach>
	</ul>
<a href="javascript:;" class="right-arrow" id="rightArrow"><img src="<%=path %>/assets/images/left.png"></a>
<a href="javascript:;" class="left-arrow" id="leftArrow"><img src="<%=path %>/assets/images/right.png"></a>		
</div>
<div class="article">
<p><img src="<%=path %>/assets/images/alert_horn.png" class="icon">校园头条<span>Campus headlines</span><a href="<%=request.getContextPath() %>/list/${xygg.link }-1.html">更多&gt;&gt;</a></p>
<div>
<c:forEach items="${xyggList }" var="varNews">
<div class="box">
<div class="time"><p id="time1">${varNews.threeDay }</p><p id="time4">${varNews.threeYear }-${varNews.threeMonth }</p></div>
<div class="title"><a href="<%=path%>/detail/${varNews.id}.html">${varNews.title }</a></div>
<div class="text">${varNews.summary }</div>	
</div>
</c:forEach>

</div>
</div>
<div class="aside">
<div class="setup">
<div class="setup-top">新闻资讯<img src="<%=path %>/assets/images/news.png" class="icon"><span>News information</span><a href="<%=request.getContextPath() %>/list/${xwzx.link }-1.html"><img src="<%=path %>/assets/images/arrowl.png" class="more"></a></div>
<c:forEach items="${xwzxList }" var="varNews" varStatus="status">
<c:if test="${status.index==0 }">
<div class="mainImage" onclick="javascript:location.href='<%=path%>/detail/${varNews.id}.html'"><img src="<%=path %>${varNews.image }" id="mainImage"><p class="opacity"></p><p class="mainImageText">${varNews.title }</p></div>
</c:if>
</c:forEach>
<div class="setup-text">
<ul id="campusNews">
<c:forEach items="${xwzxList }" var="varNews">
		<li><span><i id="time7">${varNews.threeDay}-${varNews.threeMonth }</i><b>.</b><b id="time13">${varNews.threeYear}</b></span><a href="<%=path%>/detail/${varNews.id}.html">${varNews.title}</a></li>
</c:forEach>
	</ul>	
</div>	
</div>	
</div>
<!--经典美读和二课掠影栏目-->
<div class="section">
<div class="beauty">
<div class="beauty-top">经典美读<img src="<%=path %>/assets/images/book.png" class="icon"><span>Classic beauty reading</span><a href="<%=request.getContextPath() %>/list/${jdmd.link }-1.html"><img src="<%=path %>/assets/images/arrowl.png" class="more"></a></div>
<div class="beauty-text">
<ul>
	<c:forEach items="${jdmdList }" var="varNews">
		<li><a href="<%=path%>/detail/${varNews.id}.html">${varNews.title}</a><span>${varNews.threeYear}-${varNews.threeMonth}-${varNews.threeDay}</span></li>
		</c:forEach>
	</ul>	
</div>	
</div>	
<div class="second">
<div class="second-top">校本课程<img src="<%=path %>/assets/images/blackboard.png" class="icon"><span>School-based Curriculum</span><a href="<%=request.getContextPath() %>/list/${xbkc.link }-1.html"><img src="<%=path %>/assets/images/arrowl.png" class="more"></a></div>
<div class="second-image">
<c:forEach items="${xbkcList }" var="varNews" varStatus="status">
<c:if test="${status.index<2 }">
<div class="second-image${ status.index+1}" onclick="javascript:location.href='<%=path%>/detail/${varNews.id}.html'"><img src="<%=path %>${varNews.image}"><p class="opacity"></p><p class="mainImageText">${varNews.title}</p></div>
</c:if>
</c:forEach>
</div>
<div class="second-text">
<ul>
<c:forEach items="${xbkcList }" var="varNews" varStatus="status">
	<c:if test="${status.index>=2 }">
		<li><a href="<%=path%>/detail/${varNews.id}.html">${varNews.title}</a><span>${varNews.threeYear}-${varNews.threeMonth}-${varNews.threeDay}</span></li>
		</c:if>
	</c:forEach>
	</ul>	
</div>	
</div>
</div>
<!--学生发展中心栏目-->
<div class="students">
<div class="students-left">
<div class="students-left-top">学生发展中心<span>Student development center</span></div>	
<div class="students-left-content">
<ul>
<c:forEach items="${xsfzzxList }" var="varNews" >
		<li><div class="students-date"><div class="date-top"><p class="month">${varNews.threeMonth }</p><p class="date">${varNews.threeDay }</p></div><div class="date-bottom"><p class="week">${varNews.threeWeek }</p></div></div><div class="students-content"><div class="students-content-title"><p onclick="javascript:location.href='<%=path%>/detail/${varNews.id}.html'">${varNews.title }</p></div><div class="students-content-text"><p>${varNews.summary }</p></div></div></li>
	</c:forEach>
	</ul>	
</div>
</div>
<div class="students-center">
<div class="center-top"><div class="center-top-title"><p>翰墨飘香<span>Calligraphy In The Breeze</span></p></div><div class="center-top-img"><img src="<%=path %>/assets/images/hmpx.jpg" onclick="javascript:location.href='<%=request.getContextPath() %>/list/${hmpx.link }-1.html'"></div></div>	
<div class="center-bottom"><div class="center-bottom-img"><img src="<%=path %>/assets/images/english.jpg" onclick="javascript:location.href='<%=request.getContextPath() %>/list/${yyj.link }-1.html'"></div><div class="center-bottom-title"><p>英语角<span>English Cornor</span></p></div></div>
</div>
<div class="students-right">
<div class="students-right-top">国旗下讲话<span>Speech Under National Flag</span></div>	
<div class="students-right-content">
<ul>
	<c:forEach items="${gqxjhList }" var="varNews" >
		<li><div class="students-r-content"><div class="students-r-content-title"><p onclick="javascript:location.href='<%=path%>/detail/${varNews.id}.html'">${varNews.title }</p></div><div class="students-r-content-text"><p>${varNews.summary }</p></div></div><div class="students-img"><img src="<%=path %>${varNews.image }"></div></li>
	</c:forEach>
	</ul>	
</div>
</div>
</div>

<div class="teacher">
<p><img src="<%=path %>/assets/images/teacher.png" class="icon">名师风采<span>Teacher elegant demeanour</span></p>
<div class="teacherMessage">
<c:forEach items="${msfcList }" var="varNews" >
	<div class="info" onclick="javascript:location.href='<%=path%>/detail/${varNews.id}.html'">
	<img src="<%=path %>${varNews.image}">
	<div class="name">${varNews.title}</div>
	<div class="position">${varNews.subTitle}</div>
	<div class="info-text">${varNews.summary}</div>	
	</div>
	</c:forEach>
</div>              
</div>
<%@include file="../public/footer.jsp" %>
<%@include file="../public/Js.jsp" %>
</body>
</html>