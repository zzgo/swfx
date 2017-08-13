<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../public/JSTL.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="UTF-8">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
  		<title>新闻审核-成都市实验外国语学校附属小学后台管理系统</title>
  		<%@include file="../public/Css.jsp" %>
  		<%@include file="../public/Js.jsp" %>
  		<script type="text/javascript" src="<%=path %>/assets/js/backstage.js"></script>

  </head>
  
  <body>
     <%@include file="../public/top.jsp" %>
  	<%@include file="../public/left.jsp" %>
  	<!--侧边导航-->			
	<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="glyphicon glyphicon-home home-icon"></i>
								<a href="<%=path%>/admin/index">首页</a>
							</li>
							<li class="active">新闻审核管理</li>
						</ul><!-- .breadcrumb -->
					</div>		
	
<div class="main-content none-margin-left">
<!--表格栏目-->			
 <div class="panel-group">  
            <div class="panel panel-primary">  
                <div class="panel-heading">  
                    未审核新闻  
                </div>   
                <table class="table table-bordered table-hover">  
                    <thead>  
                        <tr class="success">  
                            <th>新闻名称</th>  
                            <th>添加时间</th>
                            <th>编辑</th>           
                            <th>审核状态</th>   
                            <th>操作</th>  
                        </tr>  
                    </thead>  
                    <tbody>  
                    	<c:forEach items="${page.results }" var="varNews">
                        <tr>  
                            <td>${varNews.title }</td>  
                            <td>${varNews.addTime }</td>  
                            <td>${varNews.editor }</td>
                            <td class="auditing">未审核</td>  
                            <td><a href="<%=path%>/admin/news/toAudit?id=${varNews.id}&pageNum=${page.pageNum}">审核</a></td>  
                        </tr> 
                        </c:forEach> 
                        	<c:if test="${empty page.results }"> 
                        <tr>
                        	<td colspan="5" align="center">数据为空</td>  
                        </tr>  
                        </c:if>
                    </tbody>  
                </table>  
            </div><!-- end of panel --> 
        </div> 
         <%@ include file="../public/page.jsp" %>
			<script type="text/javascript">
				function gotoPage(pageNum) {
					location.href= "<%=path%>/admin/news/auditList?pageNum="+pageNum;
				};
			</script>
  </body>
</html>
