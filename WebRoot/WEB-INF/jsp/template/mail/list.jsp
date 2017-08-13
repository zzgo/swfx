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
	<title>${nav.name }--成都市实验外国语学校</title>
	<%@include file="../public/Css.jsp" %>
 	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/newsDetails.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/headmail.css">	
  </head>
  <body>
  <%@include file="../public/bg.jsp" %>
  	<%@include file="../public/header.jsp" %>
  	<!--列表类新闻-->
<div class="second-titile"><p>校长信箱</p></div>
<div class="main-details">
<div class="idea"><img src="<%=path %>/assets/images/idea.png">
</div>
<div class="aside-left">
<div class="details-position">
<p><img src="<%=path %>/assets/images/address.png">当前位置：<a href="<%=path%>/index"><span>首页</span></a> &gt; <span>校长信箱</span></p>
</div>
<div class="mail">
 <h1>温馨提示</h1>   
<p>
      亲爱的朋友：<br>
感谢您对实外附小的关注、支持和帮助！您对学校工作的任何建议，都可以通过这个平台与我们进行交流。为便于校长及时向您反馈信息，<span>建议您尽量留下有效的联系方式</span>，谢谢！
让我们心怀爱心与坦诚，共同描绘成外附小更美好的明天！
</p> 
</div>
<a class="leaving-button" href="<%=path%>/mail/toAdd.html">我要留言</a>
<div id="main-mail-content" class="main-mail-content">
<c:forEach items="${page.results }" var="varMail">
<!--留言主体内容-->
<div class="mail-content clearfix">
<div class="mail-time">
<p class="h3">${varMail.threeMonth }-${varMail.threeDay }</p>
<p class="h5">${varMail.threeYear }</p>
</div>
<div class="mail-message">
<p class="question"><b>${varMail.name }</b>：<img src="<%=path %>/assets/images/question.png">&nbsp;&nbsp;<span>校长您好：${varMail.content }</span></p>
<p class="answer"><b>答</b>：<img src="<%=path %>/assets/images/answer.png">&nbsp;&nbsp;<span>家长您好：${varMail.reply }</span></p>	
</div>	
</div>
<!--留言主体内容-->
</c:forEach>
</div>
<div class="mail-page">
<div class="mail-page">
<c:if test="${page.endPageIndex > 1 }">
<a href="javascript:;" <c:if test="${page.pageNum-page.beginPageIndex>=1}">onClick="gotoPage(${page.pageNum-1})"</c:if> class="nomargin ${page.pageNum-page.beginPageIndex<1?'disabled':''}">上一页</a>

<c:forEach begin="${page.beginPageIndex}" end="${page.endPageIndex}" varStatus="index">
	<a class="${index.index==page.pageNum?'active':'' }" href="javascript:;" onClick="gotoPage(${index.index})">${index.index}</a>
</c:forEach>

<a class="${page.endPageIndex-page.pageNum<1?'disabled':''}" href="javascript:;" <c:if test="${page.endPageIndex-page.pageNum>=1 }">onClick="gotoPage(${page.pageNum+1})"</c:if> >下一页</a>
</c:if>
</div>	
</div>
  <script type="text/javascript">
				function gotoPage(pageNum) {
					location.href= "<%=path%>/list/${nav.link}-"+pageNum+".html";
				};
</script>
</div>
</div>
<!--新闻列表结束-->
<%@include file="../public/footer.jsp" %>
<%@include file="../public/Js.jsp" %>
<script type="text/javascript" src="<%=path %>/assets/js/newsDetails.js"></script>
  </body>
</html>
