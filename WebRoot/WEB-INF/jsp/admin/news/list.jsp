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
							<li class="active">内容管理</li>
						</ul><!-- .breadcrumb -->
					</div>		
<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<ul class="nav nav-list">
						<li>
							<a href="javascript:;" class="dropdown-toggle">
								<i class="glyphicon glyphicon-briefcase"></i>
								<span class="menu-text">首页栏目内容</span>

								<b class="arrow glyphicon glyphicon-menu-down"></b>
							</a>

							<ul class="submenu">
								<c:if test="${!empty navList}">
								<c:forEach items="${navList}" var="varNav">
								<li>
									<a href="<%=path %>/admin/news/column?navId=${varNav.id }">
										<i class="glyphicon glyphicon-triangle-right"></i>
										${varNav.name }
									</a>
								</li>
								</c:forEach>
								</c:if>
							</ul>
						</li>	
					<li>
							<a href="javascript:;" class="dropdown-toggle">
								<i class="glyphicon glyphicon-folder-close
"></i>
								<span class="menu-text">导航条栏目内容</span>

								<b class="arrow glyphicon glyphicon-menu-down"></b>
							</a>

							<ul class="submenu">
							<c:if test="${!empty topList}">
							<c:forEach items="${topList }" var="varNav">
							<li>
									<a href='<c:if test="${empty varNav.children }"><%=path %>/admin/news/column?navId=${varNav.id }</c:if><c:if test="${!empty varNav.children }">javascript:;</c:if>' class="<c:if test='${! empty varNav.children }'>dropdown-toggle</c:if>">
										<c:if test='${!empty varNav.children }'><i class="glyphicon glyphicon-triangle-right"></i></c:if>
										${varNav.name}
										<b class="arrow glyphicon glyphicon-menu-down"></b>
									</a>
									
									<ul class="submenu">
										<c:forEach items="${varNav.children }" var="varCNav">
										<li>
											<a href="<%=path %>/admin/news/column?navId=${varCNav.id }">
												<i class="glyphicon glyphicon-paperclip"></i>
												${varCNav.name}
											</a>
										</li>
										</c:forEach>
									</ul>
									
								</li>
							</c:forEach>
							</c:if>
							</ul>
						</li>		
					</ul><!-- /.nav-list -->
				</div>
	<div class="main-content">
	<c:if test="${!empty nav }">
<!--表格栏目-->			
 <div class="panel-group">  
            <div class="panel panel-primary">  
                <div class="panel-heading">  
                    ${nav.name }  
                </div>  
                <div class="panel-body">  
                    <div class="list-op" id="list_op">  
                        <button type="button" class="btn btn-default btn-sm" onclick="window.location.href='<%=path%>/admin/news/toAdd?navId=${nav.id}'">  
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增  
                        </button>  
                    </div>  
                </div>  
                <!--多选框表单开始-->
                <form>
                <table class="table table-bordered table-hover">  
                    <thead>  
                        <tr class="success">  
                            <th>新闻名称</th>  
                            <th>添加时间</th>
                            <th>编辑</th>           
                            <th>审核状态</th>   
                            <th>排序</th>  
                        </tr>  
                    </thead>  
                    <tbody>  
                    <c:forEach items="${page.results}" var="varNews">
                        <tr> 
                            <td>${varNews.title}</td>  
                            <td>${varNews.addTime}</td>      
                            <td>${varNews.editor }</td>
                            <td class="${varNews.audit==2?'audited':'auditing'}"><c:if test="${varNews.audit==2}">审核通过</c:if><c:if test="${varNews.audit==1}">正在审核中</c:if><c:if test="${varNews.audit==3}">审核不通过</c:if></td>  
                            <td><button type="button" class="btn btn-default btn-sm" onclick="window.location.href='<%=path%>/admin/news/toEdit?id=${ varNews.id}&navId=${ nav.id}&pageNum=${page.pageNum }'">  
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改  
                        </button>  
                        <button type="button" class="btn btn-default btn-sm deleteNews" data-toggle="modal" data-id="${ varNews.id}" data-name="${ varNews.title}" >  
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除 
                        </button>  </td> 
                        </tr>   
                        </c:forEach>
                       	<c:if test="${empty page.results }"> 
                        <tr>
                        	<td colspan="5" align="center">数据为空</td>  
                        </tr>  
                        </c:if>
                    </tbody>  
                </table>  
                <!--多选框表单结束-->
            </div><!-- end of panel -->  
        </div> 
        <%@ include file="../public/page.jsp" %>
			<script type="text/javascript">
				function gotoPage(pageNum) {
					location.href= "<%=path%>/admin/news/column?navId=${nav.id}&pageNum="+pageNum;
				};
			</script>
			</c:if>
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
您确定要删除<span class="color NewsName">栏目一</span>吗？
  </div>
</div>						
<div class="modal-footer">
<!--删除表单开始-->
				<form > 
				<input type="hidden" value="" class="dataId" />
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				
				<button type="button" class="btn btn-primary deleteNews2">
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
	 $(".deleteNews").click(function(){
	 	$(".dataId").val($(this).attr("data-id"));
	 	$(".NewsName").html($(this).attr("data-name"));
	 	$("#deleteModal").modal();
	 });
 	$(".deleteNews2").click(function(){
 		var data ={id:$(".dataId").val()};
 		$.ajax({
						url : "<%=path%>/admin/news/remove",
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
