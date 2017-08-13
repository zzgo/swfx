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
  		<title>垃圾箱-成都市实验外国语学校附属小学后台管理系统</title>
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
								<a href="<%=path%>/admin/index">首页</a>
							</li>
							<li class="active">栏目管理</li>
						</ul><!-- .breadcrumb -->
					</div>	
<!--表格栏目-->			
 <div class="panel-group">  
            <div class="panel panel-primary">  
                <div class="panel-heading">  
                    列表  
                </div>  
                <table class="table table-bordered table-hover">  
                    <thead>  
                        <tr class="success">  
                            <th>新闻名称</th>  
                            <th>添加时间</th>           
                            <th>状态</th>   
                            <th>操作</th>  
                        </tr>  
                    </thead>  
                    <tbody>  
                    <c:forEach items="${page.results }" var="varNews">
                        <tr>  
                            <td>${varNews.title }</td>  
                            <td>${varNews.addTime }</td>  
                            <td>无效</td>   
                            <td> <button type="button" class="btn btn-default btn-sm reNews" data-name="${varNews.title }" data-id="${varNews.id }">  
                            <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>还原  
                        </button>  
                        <button type="button" class="btn btn-default btn-sm deNews" data-name="${varNews.title }" data-id="${varNews.id }">  
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>删除  
                        </button> </td>  
                        </tr> 
                       </c:forEach> 
                    </tbody>  
                </table>  
            </div><!-- end of panel -->  
        </div> 
        <%@ include file="../public/page.jsp" %>
			<script type="text/javascript">
				function gotoPage(pageNum) {
					location.href= "<%=path%>/admin/news/binList?pageNum="+pageNum;
				};
			</script>
    <!-- 模态框（Modal） -->
<div class="modal fade" id="optModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				<span class="tip">删除</span>新闻
				</h4>
			</div>
			<div class="modal-body">
<div class="panel panel-default">
  <div class="panel-body massage">
您确定要<span class="tip">删除</span><span class="color NewsName">栏目一</span>吗？
  </div>
</div>						
<div class="modal-footer">
<!--删除表单开始-->
				<form > 
				<input type="hidden" value="" class="dataId" />
				<input type="hidden" value="" class="dataSta" />
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				
				<button type="button" class="btn btn-primary optNews2">
					<span class="tip">删除</span>
				</button>
                </form>
				<!--删除表单结束-->
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>  
 </div> 	
 <script type="text/javascript">
 	 $(".reNews").click(function(){
	 	$(".dataId").val($(this).attr("data-id"));
	 	$(".NewsName").html($(this).attr("data-name"));
	 	$(".tip").html("还原");
	 	$(".dataSta").val(1);
	 	$("#optModal").modal();
	 });
	 
	  $(".deNews").click(function(){
	 	$(".dataId").val($(this).attr("data-id"));
	 	$(".dataSta").val(2);
	 	$(".tip").html("删除");
	 	$(".NewsName").html($(this).attr("data-name"));
	 	$("#optModal").modal();
	 });
	 
	 
	 $(".optNews2").click(function(){
 		var data ={id:$(".dataId").val(),status:$(".dataSta").val()};
 		$.ajax({
						url : "<%=path%>/admin/news/drNew",
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
