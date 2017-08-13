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
  		<title>新闻管理-成都市实验外国语学校附属小学后台管理系统</title>
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
								<a href="<%=path %>/admin/index">首页</a>
							</li>
							<li class="active">校长信箱管理</li>
						</ul><!-- .breadcrumb -->
					</div>		
	
<div class="main-content none-margin-left">
<!--表格栏目-->	
	
 <div class="panel-group">  
            <div class="panel panel-primary">  
                <div class="panel-heading">  
                所有信件 
                </div>  
                <form>	 
                <table class="table table-bordered table-hover">  
                    <thead>  
                        <tr class="success">  
                            <th>信件内容</th>  
                            <th>姓名</th>
                            <th>手机</th>
                            <th>邮箱</th>            
                            <th>时间</th>   
                            <th>回复</th> 
                            <th>删除</th> 
                        </tr>  
                    </thead>  
                    <tbody>  
                    <c:forEach items="${page.results}" var="varMail">
                        <tr>  
                            <td>${varMail.content }${varMail.show==2?'<span class=\"replyTip\">已回复</span>':'<span class=\"noReplyTip\">未回复</span>' }</td>  
                            <td>${varMail.name }</td>  
                            <td>${varMail.call }</td>
                            <td>${varMail.email }</td>
                            <td>${varMail.date }</td>   
                            <td><a href="<%=path %>/admin/mail/toReply?id=${varMail.id }&pageNum=${pageNum}">回复</a></td>
                            <td><a href="javscript:;" data-id="${varMail.id}" data-name="${varMail.name }" class="deleteMail">删除</a></td>  
                        </tr>
                        </c:forEach>  
                    </tbody>  
                </table>  
                 </form>  
            </div><!-- end of panel -->  
        </div> 
        <%@ include file="../public/page.jsp" %>
			<script type="text/javascript">
				function gotoPage(pageNum) {
					location.href= "<%=path%>/admin/mail/list?pageNum="+pageNum;
				};
			</script>
 <!-- 模态框（Modal） -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				删除栏目
				</h4>
			</div>
			<div class="modal-body">
<div class="panel panel-default">
  <div class="panel-body massage">
您确定要删除<span class="color MailName">栏目一</span>吗？
  </div>
</div>						
<div class="modal-footer">
<!--删除表单开始-->
				<form > 
				<input type="hidden" value="" class="dataId" />
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				
				<button type="button" class="btn btn-primary deleteMail2">
					删除
				</button>
                </form>
				<!--删除表单结束-->
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>  
 </div>     
 <script type="text/javascript">
	 $(".deleteMail").click(function(){
	 	$(".dataId").val($(this).attr("data-id"));
	 	$(".MailName").html($(this).attr("data-name"));
	 	$("#deleteModal").modal();
	 });
 	$(".deleteMail2").click(function(){
 		var data ={id:$(".dataId").val()};
 		$.ajax({
						url : "<%=path%>/admin/mail/delete",
						data : data,
						type : "post",
						dataType : "json",
						beforeSend : function() {
							
						},
						success : function(result) {
							if (result && result.status != 200) {
								$(".massage").html(result.message);
								window.location.reload();
								return;
							} else {
								$(".massage").html("<p style='color:green'>"+result.message+"</p>");
								setTimeout(function() {
									window.location.reload();
								}, 1000)
							}
						},
						error : function(e) {
							$(".massage").html("删除异常");
							window.location.reload();
						}
					});
 	});
 </script> 
  </body>
</html>
