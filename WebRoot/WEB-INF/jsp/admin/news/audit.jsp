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
  		<title>新闻审核-成都市实验外国语学校附属小学后台管理系统</title>
  		<%@include file="../public/Css.jsp" %>
  		<%@include file="../public/Js.jsp" %>
  		<script type="text/javascript" src="<%=path %>/assets/js/backstage.js"></script>

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
								<a href="<%=path %>/admin/index">首页</a>
							</li>
							<li><a href="<%=path %>/admin/news/auditList">新闻审核管理</a></li>
							<li class="active">审核详情</li>
						</ul><!-- .breadcrumb -->
					</div>	
					<div class="table-responsive">
			<div class="panel panel-success">
  <div class="panel-body">
    审核未通过请联系管理员！
  </div>
</div>		
					                <form method="post" >
                <table class="table table-bordered table-hover">  
 
                    <tbody>  
                        <tr>  
                            <td class="tdWidth">新闻标题</td>  
                            <td>${news.title }</td>   
                        </tr> 
                        <tr>  
                            <td class="tdWidth">新闻副标题</td>  
                            <td>${news.subTitle }</td>   
                        </tr> 
                         <tr>  
                            <td class="tdWidth">内容摘要</td>  
                            <td>${news.summary }</td>   
                        </tr> 
                        <tr>  
                            <td class="tdWidth">作者</td>  
                            <td>${news.author }</td>   
                        </tr> 
                        <tr>  
                            <td class="tdWidth">封面图片</td>  
                            <td><img src="<%=path %>${news.image }"></td>   
                        </tr>
                           <tr>  
                            <td class="tdWidth">信息来源</td>  
                            <td>${news.from }</td>   
                        </tr> 
                          <tr>  
                            <td class="tdWidth">编辑</td>  
                            <td>${news.editor }</td>   
                        </tr> 
                           <tr>  
                            <td class="tdWidth">新闻日期</td>  
                            <td>${news.addTime }</td>   
                        </tr>  
                        <tr>  
                            <td class="tdWidth">主要内容</td>  
                            <td>点击预览查看。</td>   
                        </tr>    
                    </tbody> 
                </table>                   
<button type="button" class="btn btn-success pass">
					通过
				</button>  
				<button type="button" class="btn btn-danger nopass">
					不通过
				</button> 
<button type="button" class="btn btn-success preLook">
					预览
				</button> 
<button type="button" class="btn btn-success">
					<a href="javascript:;" onClick="javascript:history.go(-1)">返回</a>
				</button> 	                   
</form>         			
                </div>     			
 </div>
 <script type="text/javascript">
 	$(".pass").click(function(){
 	showModal();
 		$.ajax({
						url : "<%=path%>/admin/news/audit?id=${news.id}&audit=2&pageNum=${pageNum}",
						data :'',
						type : "post",
						dataType : "json",
						beforeSend : function() {
						},
						success : function(result) {
							if (result && result.status != 200) {
								alert(result.message);
								return;
							} else {
								hideModal();
								setTimeout(function() {
								alert(result.message);
									//登录返回
									window.location.href = "<%=path%>"+result.backUrl;
								}, 500)
							}
						},
						error : function(e) {
							alert("抱歉，刪除失敗！");
						}
					});
 	});
 		$(".nopass").click(function(){
 		showModal();
 		$.ajax({
						url : "<%=path%>/admin/news/audit?id=${news.id}&audit=3&pageNum=${pageNum}",
						data :'',
						type : "post",
						dataType : "json",
						beforeSend : function() {
						},
						success : function(result) {
							if (result && result.status != 200) {
								alert(result.message);
								return;
							} else {
								hideModal();
								setTimeout(function() {
								alert(result.message);
									//登录返回
									window.location.href = "<%=path%>"+result.backUrl;
								}, 500)
							}
						},
						error : function(e) {
							alert("抱歉，刪除失敗！");
						}
					});
 	});
 		$(".preLook").click(function(){
 		 window.open("<%=path%>/detail/${news.id}.html","_blank"); 
 	});
 </script>
  </body>
</html>
