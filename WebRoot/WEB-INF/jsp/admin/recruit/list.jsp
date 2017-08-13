<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>招聘信息管理-成都市实验外国语学校附属小学后台管理系统</title>
<%@include file="../public/Css.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/assets/css/bootstrap-datetimepicker.min.css">
<%@include file="../public/Js.jsp"%>
<script type="text/javascript" src="<%=path%>/assets/js/moment.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/assets/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/assets/js/increaseNews.js"></script>

</head>

<body>
	<%@include file="../public/top.jsp"%>
	<%@include file="../public/left.jsp"%>
	<div class="main-content">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

			<ul class="breadcrumb">
				<li><i class="glyphicon glyphicon-home home-icon"></i> <a
					href="<%=path%>/admin/index">首页</a></li>
				<li class="active">招聘信息管理</li>
			</ul>
			<!-- .breadcrumb -->
		</div>
		<div class="table-responsive">
			<div class="panel panel-success">
				<div class="panel-body">成都市实验外国语学校附属小学招聘信息表</div>
			</div>
			
			<div class="">
				<div class="rec_prev">
					<div class="row" >
									<div class='col-sm-12'>
										<div class="form-group">
											<label>开始时间</label>
											<!--指定 date标记-->
											<div class='input-group date' id='datetimepicker2'>
												<input type='text' class="form-control" name="startTime" id="startTime" /> <span class="input-group-addon">
													<span class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
									</div>
								</div>
				</div>
				<div class="rec_middle">
					<div class="row" >
									<div class='col-sm-12'>
										<div class="form-group">
											<label>结束时间</label>
											<!--指定 date标记-->
											<div class='input-group date' id='datetimepicker3'>
												<input type='text' class="form-control" name="endTime" id="endTime" /> <span class="input-group-addon">
													<span class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
									</div>
								</div>
					
				</div>
				<div class="rec_suffix">
					<button type="button" class="btn btn-success" id="Submit">
					导出</button>
				</div>
			</div>
			
			<table class="table table-bordered table-hover">

				<tbody>
					<c:if test="${!empty page }">
					<c:forEach items="${page.results }" var="varRec">
						<tr>
							<td class="tdWidth">姓名</td>
							<td>${varRec.name }</td>
						</tr>
						<tr>
							<td class="tdWidth">姓别</td>
							<td>${varRec.sex }</td>
						</tr>
						<tr>
							<td class="tdWidth">出生年月</td>
							<td>${varRec.date }</td>
						</tr>
						<tr>
							<td class="tdWidth">政治面貌</td>
							<td>${varRec.politics }</td>
						</tr>
						<tr>
							<td class="tdWidth">职称</td>
							<td>${varRec.title }</td>
						</tr>
						<tr>
							<td class="tdWidth">普通话</td>
							<td>${varRec.pth }</td>
						</tr>
						<tr>
							<td class="tdWidth">英语等级</td>
							<td>${varRec.english }</td>
						</tr>
						<tr>
							<td class="tdWidth">电话</td>
							<td>${varRec.call }</td>
						</tr>
						<tr>
							<td class="tdWidth">谋求职位</td>
							<td>${varRec.position }</td>
						</tr>
						<tr>
							<td class="tdWidth">毕业校系及时间</td>
							<td>${varRec.time }</td>
						</tr>
						<tr>
							<td class="tdWidth">居住地址</td>
							<td>${varRec.address }</td>
						</tr>
						<tr>
							<td class="tdWidth">个人简介</td>
							<td>${varRec.person }</td>
						</tr>
						<tr>
							<td class="tdWidth">获奖情况</td>
							<td>${varRec.winning }</td>
						</tr>
						<tr>
							<td class="tdWidth">登记时间</td>
							<td>${varRec.createTime }</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty page }">
						<tr>
							<td colspan="14">暂无数据</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="../public/page.jsp"%>
	<script type="text/javascript">
				function gotoPage(pageNum) {
					location.href= "<%=path%>/admin/recruit/list?pageNum=" + pageNum;
		};
		$("#Submit").click(function(){
			var endTime = $("#endTime").val();
			var startTime = $("#startTime").val();
			alert(endTime);
			alert(startTime);
			location.href="<%=path%>/admin/recruit/daoExcel?endTime="+endTime+"&startTime="+startTime;
		});
		
	</script>
	
	
</body>
</html>
