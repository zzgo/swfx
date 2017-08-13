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
<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/main.css">	
<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/normalize.css">	
<link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/backstage/images/logo.png" type="image/x-icon" />
</head>
<body>
<div class="top-nav">
<nav class="top">
<ul class="clearfix">
		<li>家校通登录</li>
		<li>网络硬盘</li>
		<li>教籍系统</li>
		<li>资源中心</li>
	</ul>	
</nav>	
</div>
<header>
<div class="content clearfix">
<img src="<%=path %>/assets/images/bg2.png" class="contentBg1">
<img src="<%=path %>/assets/images/logo1.png" class="logo">	
<img src="<%=path %>/assets/images/bg1.png" class="contentBg">
<form name="search">
<input type="text" placeholder="请输入内容">
<a href="javascript:;">搜索</a>
</form>
</div>
</header>
<div class="nav" id="nav">
<ul class="navUl">
		<li class="nav_on"><a href="<%=path%>/index">网站首页</a></li>
		<c:forEach items="${navList }" var="varNav">
		<li><c:if test="${! empty varNav.children }"><a href="javascript:;">${varNav.name }</a></c:if>
		<c:if test="${empty varNav.children }"><a href="<%=path %>/column/list/${varNav.link }">${varNav.name }</a></c:if>
			<c:if test="${! empty varNav.children }">
			<dl id="childNav">
				<c:forEach items="${varNav.children }" var="varNav">
				<dt><a href="<%=path %>/column/list/${varNav.link }">${varNav.name }</a></dt>
				</c:forEach>
			</dl>
			</c:if>
		</li>
</c:forEach>
	</ul>	
</div>

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
<p><img src="<%=path %>/assets/images/alert_horn.png" class="icon">校园头条<span>Campus headlines</span><a>更多&gt;&gt;</a></p>
<div>
<c:forEach items="${xyggList }" var="varNews">
<div class="box">
<div class="time"><p id="time1">${varNews.threeDay }</p><p id="time4">${varNews.threeYear }-${varNews.threeMonth }</p></div>
<div class="title"><a href="<%=path%>/content/detail/${varNews.id}">${varNews.title }</a></div>
<div class="text">${varNews.summary }</div>	
</div>
</c:forEach>

</div>
</div>
<div class="aside">
<div class="setup">
<div class="setup-top">新闻资讯<img src="<%=path %>/assets/images/news.png" class="icon"><span>News information</span><img src="<%=path %>/assets/images/arrowl.png" class="more"></div>
<c:forEach items="${xwzxList }" var="varNews" varStatus="status">
<c:if test="${status.index==0 }">
<div class="mainImage"><img src="<%=path %>${varNews.image }" id="mainImage"><p class="opacity"></p><p class="mainImageText">${varNews.title }</p></div>
</c:if>
</c:forEach>
<div class="setup-text">
<ul id="campusNews">
<c:forEach items="${xwzxList }" var="varNews">
		<li><span><i id="time7">${varNews.threeDay}-${varNews.threeMonth }</i><b>.</b><b id="time13">${varNews.threeYear}</b></span><a href="#">${varNews.title}</a></li>
</c:forEach>
	</ul>	
</div>	
</div>	
</div>
<!--经典美读和二课掠影栏目-->
<div class="section">
<div class="beauty">
<div class="beauty-top">经典美读<img src="<%=path %>/assets/images/book.png" class="icon"><span>Classic beauty reading</span><img src="<%=path %>/assets/images/arrowl.png" class="more"></div>
<div class="beauty-text">
<ul>
	<c:forEach items="${jdmdList }" var="varNews">
		<li><a href="#">${varNews.title}</a><span>${varNews.threeYear}-${varNews.threeMonth}-${varNews.threeDay}</span></li>
		</c:forEach>
	</ul>	
</div>	
</div>	
<div class="second">
<div class="second-top">校本课程<img src="<%=path %>/assets/images/blackboard.png" class="icon"><span>School-based Curriculum</span><img src="<%=path %>/assets/images/arrowl.png" class="more"></div>
<div class="second-image">
<c:forEach items="${xbkcList }" var="varNews" varStatus="status">
<c:if test="${status.index<2 }">
<div class="second-image${ status.index+1}"><img src="<%=path %>${varNews.image}"><p class="opacity"></p><p class="mainImageText">${varNews.title}</p></div>
</c:if>
</c:forEach>
</div>
<div class="second-text">
<ul>
<c:forEach items="${xbkcList }" var="varNews" varStatus="status">
	<c:if test="${status.index>=2 }">
		<li><a href="#">${varNews.title}</a><span>${varNews.threeYear}-${varNews.threeMonth}-${varNews.threeDay}</span></li>
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
		<li><div class="students-date"><div class="date-top"><p class="month">${varNews.threeMonth }</p><p class="date">${varNews.threeDay }</p></div><div class="date-bottom"><p class="week">${varNews.threeWeek }</p></div></div><div class="students-content"><div class="students-content-title"><p>${varNews.title }</p></div><div class="students-content-text"><p>${varNews.summary }</p></div></div></li>
	</c:forEach>
	</ul>	
</div>
</div>
<div class="students-center">
<div class="center-top"><div class="center-top-title"><p>翰墨飘香<span>Calligraphy In The Breeze</span></p></div><div class="center-top-img"><img src="<%=path %>/assets/images/mainImage.jpg"></div></div>	
<div class="center-bottom"><div class="center-bottom-img"><img src="<%=path %>/assets/images/mainImage.jpg"></div><div class="center-bottom-title"><p>英语角<span>English Cornor</span></p></div></div>
</div>
<div class="students-right">
<div class="students-right-top">国旗下讲话<span>Speech Under National Flag</span></div>	
<div class="students-right-content">
<ul>
	<c:forEach items="${gqxjhList }" var="varNews" >
		<li><div class="students-r-content"><div class="students-r-content-title"><p>${varNews.title }</p></div><div class="students-r-content-text"><p>${varNews.summary }</p></div></div><div class="students-img"><img src="<%=path %>${varNews.image }"></div></li>
	</c:forEach>
	</ul>	
</div>
</div>


</div>

<div class="teacher">
<p><img src="<%=path %>/assets/images/teacher.png" class="icon">名师风采<span>Teacher elegant demeanour</span></p>
<div class="teacherMessage">
<c:forEach items="${msfcList }" var="varNews" >
	<div class="info">
	<img src="<%=path %>/${varNews.image}">
	<div class="name">${varNews.title}</div>
	<div class="position">${varNews.subTitle}</div>
	<div class="info-text">${varNews.summary}</div>	
	</div>
	</c:forEach>
</div>
</div>
<div class="footer">
<ul>
		<li class="footer-title"><img src="<%=path %>/assets/images/list.png"> 学校概况</li>
		<li><a href="#">学校简介</a></li>
		<li><a href="#">校长致辞</a></li>
		<li><a href="#">现任领导</a></li>
		<li><a href="#">组织机构</a></li>		
</ul>	
<ul>
		<li class="footer-title"><img src="<%=path %>/assets/images/graduation_cap.png"> 学术发展</li>
		<li><a href="#">课程介绍</a></li>
		<li><a href="#">师资力量</a></li>
		<li><a href="#">教学特色</a></li>
		<li><a href="#">杰出人才</a></li>		
</ul>
<ul>
		<li class="footer-title"><img src="<%=path %>/assets/images/telephone.png"> 入学咨询</li>
		<li><a>028-66666666</a></li>
		<li><a href="#">招生信息</a></li>
		<li><a href="#">费用及奖学金</a></li>
		<li><a href="#">常见问题</a></li>		
</ul>
<ul>
		<li class="footer-title"><img src="<%=path %>/assets/images/chain.png"> 友情链接</li>
		<li><a href="#">成都市实验外国语学校</a></li>
		<li><a href="#">成都外国语学校</a></li>
		<li><a href="#">成都外国语学校附属小学</a></li>
		<li><a href="#">四川外国语大学成都学院</a></li>		
</ul>
<ul class="lastUl">
<li class="footer-title"><img src="<%=path %>/assets/images/wechat.png"> 关注我们</li>	
<div class="wechat" id="wechat"><img src="<%=path %>/assets/images/wechat.png"></div>	
</ul>
</div>
<div class="copyright">
<div class="adress">
<p>电话咨询：028-66666666&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮编：611130</p>
<p class="pmargin">学校地址：成都市温江区花都大道一段4xx号成都市实验外国语学校附属小学</p>
</div>	
<div class="adress">
<p>蜀ICP备52545464646-1号</p>
<p class="pmargin">版权所有&copy;成都市实验外国语学校附属小学</p>
</div>
</div>
<a class="backTop" href="javascript:;" id="backTop" title="回到顶部" alt="回到顶部"></a>
<script type="text/javascript" src="<%=path %>/assets/js/jquery.min.js"></script>	
<script type="text/javascript" src="<%=path %>/assets/js/main.js"></script>
</body>
</html>