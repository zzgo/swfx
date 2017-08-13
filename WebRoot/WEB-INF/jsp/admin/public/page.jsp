<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<nav aria-label="Page navigation">
  <ul class="pagination">
    <li class="${page.pageNum-page.beginPageIndex<1?'disabled':''} ">
      <a href="javascript:;"   <c:if test="${page.pageNum-page.beginPageIndex>=1}">onClick="gotoPage(${page.pageNum-1})"</c:if> aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <c:forEach begin="${page.beginPageIndex}" end="${page.endPageIndex}" varStatus="index">
    	<li class="${index.index==page.pageNum?'active':'' }"><a href="javascript:;" onClick="gotoPage(${index.index})">${index.index}</a></li>
    </c:forEach>
    
    
    <li class="${page.endPageIndex-page.pageNum<1?'disabled':''}" >
      <a href="javascript:;" <c:if test="${page.endPageIndex-page.pageNum>=1 }">onClick="gotoPage(${page.pageNum+1})"</c:if>  aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav> 
