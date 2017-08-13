<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="UTF-8">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
  		<title>邮箱回复-成都市实验外国语学校附属小学后台管理系统</title>
  		<%@include file="../public/Css.jsp" %>
  		<%@include file="../public/Js.jsp" %>

  </head>
  
  <body>
  <%@include file="../public/top.jsp" %>
  	<%@include file="../public/left.jsp" %>
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
							<li><a href="<%=path%>/admin/mail/list">校长信箱管理</a></li>
							<li class="active">回复</li>
						</ul><!-- .breadcrumb -->
					</div>	
					<div class="table-responsive">
			<div class="panel panel-success">
  <div class="panel-body">
    校长信箱仅校长有权限回复！
  </div>
</div>		
                <table class="table table-bordered table-hover">  
 
                    <tbody>  
                        <tr>  
                            <td class="tdWidth">信件内容</td>  
                            <td>${mail.content }</td>   
                        </tr>  
                         <tr>  
                            <td class="tdWidth">姓名</td>  
                            <td>${mail.name }</td>   
                        </tr> 
                           <tr>  
                            <td class="tdWidth">手机</td>  
                            <td>${mail.call }</td>   
                        </tr> 
                          <tr>  
                            <td class="tdWidth">邮箱</td>  
                            <td>${mail.email }</td>   
                        </tr> 
                           <tr>  
                            <td class="tdWidth">时间</td>  
                            <td>${mail.date }</td>   
                        </tr>
                        <tr>  
                            <td class="tdWidth">回复内容</td>  
                            <td>
                            <form action="<%=path %>/admin/mail/reply" method="post" id="replyForm" >
                            <input type="hidden" value="${mail.id }" name="id" />
                             <input type="hidden" value="${pageNum}" name="pageNum" />
                            <textarea class="form-control" rows="3" name="reply">${mail.reply }</textarea>
                            </form>
                            </td>   
                        </tr>       
                    </tbody> 
                </table>    
<button type="button" class="btn btn-success Submit" >
					回复
				</button> 
<button class="btn btn-success">
					<a href="javascript:;" onClick="javascript:history.go(-1);">返回</a>
				</button> 	                   
                </div>     			
 </div>
 <script type="text/javascript">
 	$(".Submit").click(function(){
 		$("#replyForm").submit();
 	});
 </script>
  </body>
</html>
