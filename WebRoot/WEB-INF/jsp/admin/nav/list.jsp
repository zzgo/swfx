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
  		<title>栏目列表-成都市实验外国语学校附属小学后台管理系统</title>
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
							<li class="active">栏目管理</li>
						</ul><!-- .breadcrumb -->
					</div>	
<!--表格栏目-->			
 <div class="panel-group">  
            <div class="panel panel-primary">  
                <div class="panel-heading">  
                    列表  
                </div>  
                <div class="panel-body">  
                    <div class="list-op" id="list_op">  
                        <button type="button" class="btn btn-default btn-sm" onclick="window.location.href='<%=path %>/admin/nav/toAdd'">  
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增  
                        </button>  
                    </div>  
                </div>
                <!--选择表单开始-->
                <form> 
                <table class="table table-bordered table-hover">  
                    <thead>  
                        <tr class="success">  
                            <th>栏目名称</th>  
                            <th>类别组</th>           
                            <th>状态</th>  
                            <th>说明</th> 
                            <th>操作</th>  
                        </tr>  
                    </thead>  
                    <tbody>  
                        <c:forEach items="${navList }" var="varNav">
                        <tr>  
                            <td>${varNav.name }</td>  
                            <td>${varNav.parentName }</td>  
                            <td>有效</td>  
                            <td>${varNav.description }</td>  
                            <td><button type="button" class="btn btn-default btn-sm" onclick="window.location.href='<%=path%>/admin/nav/toEdit?id=${varNav.id }'">  
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改  
                        </button>  
                        <button type="button" class="btn btn-default btn-sm deleteNav"   data-id="${varNav.id }"  data-name="${varNav.name}" >  
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除  
                        </button> </td>  
                        </tr>   
                        </c:forEach>
                    </tbody>  
                </table>  
               </form>  
            </div><!-- end of panel -->  
        </div>   
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
您确定要删除<span class="color navName">栏目一</span>吗？
  </div>
</div>						
<div class="modal-footer">
<!--删除表单开始-->
				<form > 
				<input type="hidden" value="" class="dataId" />
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				
				<button type="button" class="btn btn-primary deleteNav2">
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
	 $(".deleteNav").click(function(){
	 	$(".dataId").val($(this).attr("data-id"));
	 	$(".navName").html($(this).attr("data-name"));
	 	$("#deleteModal").modal();
	 });
 	$(".deleteNav2").click(function(){
 		var data ={id:$(".dataId").val()};
 		$.ajax({
						url : "<%=path%>/admin/nav/delete",
						data : data,
						type : "post",
						dataType : "json",
						beforeSend : function() {
							
						},
						success : function(result) {
							if (result && result.status != 200) {
								$(".massage").html(result.message);
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
						}
					});
 	});
 </script>
  </body>
</html>
