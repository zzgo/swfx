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
  		<title>新闻管理-成都市实验外国语学校附属小学后台管理系统</title>
  		<%@include file="../public/Css.jsp" %>
  		<%@include file="../public/Js.jsp" %>

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
								<a href="<%=path %>/admin/index">首页</a>
							</li>
							<li class="active">用户管理</li>
						</ul><!-- .breadcrumb -->
					</div>	
<!--表格栏目-->			
 <div class="panel-group">  
            <div class="panel panel-primary">  
                <div class="panel-heading">  
                    列表  
                </div>   
                <form>
                <table class="table table-bordered table-hover">  
                    <thead>  
                        <tr class="success">  
                            <th>角色ID</th>  
                            <th>角色名</th>           
                            <th>角色权限</th>   
                            <th>上次登陆时间</th> 
                        </tr>  
                    </thead>  
                    <tbody>  
                    <c:forEach items="${userList }" var="varUser">
                        <tr>  
                            <td>${varUser.id }</td>  
                            <td>${varUser.name }</td>  
                            <td>${varUser.type==1?'超级管理员':'普通管理员' }</td>
                            <td>${varUser.lastLoginTime }</td>   
                        </tr>  
                        </c:forEach>
                        <c:if test="${empty userList}">
                        <tr>  
                            <td colspan="5">暂无数据</td>  
                        </tr>  
                        </c:if>
                    </tbody>  
                </table> 
                </form>  
            </div><!-- end of panel -->  
        </div>   
 </div>	
  </body>
</html>
