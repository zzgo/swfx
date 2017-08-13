<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="news-page">
<div class="page">
<c:if test="${page.endPageIndex > 1 }">
<a href="javascript:;" <c:if test="${page.pageNum-page.beginPageIndex>=1}">onClick="gotoPage(${page.pageNum-1})"</c:if> class="nomargin ${page.pageNum-page.beginPageIndex<1?'disabled':''}">上一页</a>

<c:forEach begin="${page.beginPageIndex}" end="${page.endPageIndex}" varStatus="index">
	<a class="${index.index==page.pageNum?'active':'' }" href="javascript:;" onClick="gotoPage(${index.index})">${index.index}</a>
</c:forEach>

<a class="${page.endPageIndex-page.pageNum<1?'disabled':''}" href="javascript:;" <c:if test="${page.endPageIndex-page.pageNum>=1 }">onClick="gotoPage(${page.pageNum+1})"</c:if> >下一页</a>
</c:if>
</div>	
</div>
