<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="top-nav">
<nav class="top">
<ul class="clearfix">
		<li><a href="javascript:;">家校通登录</a></li>
		<li><a href="<%=request.getContextPath()%>admin/user/toLogin">管理系统</a></li>
		<li><a href="javascript:;">教籍系统</a></li>
		<li><a href="javascript:;">资源中心</a></li>
	</ul>	
</nav>	
</div>
<header>
<div class="content clearfix">
<img src="<%=request.getContextPath() %>/assets/images/bg2.png" class="contentBg1">
<img src="<%=request.getContextPath() %>/assets/images/logo1.png" class="logo">	
<img src="<%=request.getContextPath() %>/assets/images/bg1.png" class="contentBg">
</div>
</header>
<div class="nav" id="nav">
<ul class="navUl">
		<li class=""><a href="<%=request.getContextPath()%>/index.html">网站首页</a></li>
		<c:forEach items="${navList }" var="varNav">
		<li class="<c:if test='${nav.id==varNav.id || nav.parentId==varNav.id }'>nav_on</c:if>" ><c:if test="${! empty varNav.children }"><a href="javascript:;">${varNav.name }</a></c:if>
		<c:if test="${empty varNav.children }"><a href="<%=request.getContextPath() %>/list/${varNav.link }-1.html">${varNav.name }</a></c:if>
			<c:if test="${! empty varNav.children }">
			<dl id="childNav">
				<c:forEach items="${varNav.children }" var="varNav">
				<dt><a href="<%=request.getContextPath() %>/list/${varNav.link }-1.html">${varNav.name }</a></dt>
				</c:forEach>
			</dl>
			</c:if>
		</li>
</c:forEach>
	</ul>	
</div>
