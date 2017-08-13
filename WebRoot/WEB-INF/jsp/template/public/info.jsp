<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="aside-column">
<aside class="aside-1 clearfix" id="nm_ul">
<ul class="tab_ul" id="tab_ul">
<li class="tab_ul_on">通知公告</li>
</ul>
<div id="contents">
<ul class="nm_ul show">
<c:forEach items="${tzgghList}" var="varNews">
<li><a href="<%=request.getContextPath()%>/detail/${varNews.id}.html" title="${varNews.title }">${varNews.title }</a></li>	
</c:forEach>
</ul>	
</aside> 	
</div>   
</div>      