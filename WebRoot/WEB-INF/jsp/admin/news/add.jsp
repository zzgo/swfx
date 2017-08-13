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
<title>${action=='admin/news/add'?'添加新闻':'修改新闻' }</title>
<%@include file="../public/Css.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/assets/css/bootstrap-datetimepicker.min.css">
<%@include file="../public/Js.jsp"%>
<script type="text/javascript" src="<%=path%>/assets/js/moment.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/assets/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/assets/js/increaseNews.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/assets/css/bootstrap-datetimepicker.min.css">
<script charset="utf-8"
	src="<%=path%>/assets/ckeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="<%=path%>/assets/ckeditor/lang/zh-CN.js"></script>
<script charset="utf-8"
	src="<%=path%>/assets/ckeditor/plugins/code/prettify.js"></script>
<script src="<%=path%>/assets/js/jquery.form.js"></script>
<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
				uploadJson : '<%=path%>/assets/ckeditor/jsp/upload_json.jsp',
				fileManagerJson : '<%=path%>/assets/ckeditor/jsp/file_manager_json.jsp',
									allowFileManager : true,
									afterBlur: function(){this.sync();},//同步数据到textarea Very Key
									afterCreate : function() {
										var self = this;
										K.ctrl(document, 13, function() {
											self.sync();
											document.forms['example'].submit();
										});
										K.ctrl(self.edit.doc, 13, function() {
											self.sync();
											document.forms['example'].submit();
										});
									}
								});
				prettyPrint();
			});
</script>
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
				<li><a href="<%=path%>/admin/news/column?navId=${navId}">内容管理</a></li>
				<li class="active">添加新闻</li>
			</ul>
			<!-- .breadcrumb -->
		</div>
		<div class="table-responsive">
			<div class="panel panel-success">
				<div class="panel-body">请认真填写以下内容，确定新闻的有效性</div>
			</div>
			<!--表单开始-->
			<form action="<%=path %>/${ action}" method="post" id="newsForm">
				<input type="hidden" name="navId" value="${navId }" /> <input
					type="hidden" name="pageNum" value="${pageNum }" /> <input
					type="hidden" name="${empty news?'':'id' }" value="${news.id }" />
				<table class="table table-bordered table-hover">

					<tbody>
						<tr>
							<td class="tdWidth">新闻标题</td>
							<td><input type="text" class="form-control"
								id="exampleInputName" placeholder="请填写新闻标题" name="title"
								value="${news.title }"></td>
						</tr>
						<tr>
							<td class="tdWidth">新闻副标题</td>
							<td><input type="text" class="form-control"
								id="exampleInputName" placeholder="请填写新闻副标题" name="subTitle"
								value="${news.subTitle }"></td>
						</tr>
						<tr>
							<td class="tdWidth">内容摘要</td>
							<td><textarea class="form-control" rows="3"
									placeholder="内容摘要" name="summary">${news.summary }</textarea></td>
						</tr>
						<tr>
							<td class="tdWidth">作者</td>
							<td><input type="text" class="form-control"
								id="exampleInputNmae2" placeholder="作者名称" name="author"
								value="${news.author }"></td>
						</tr>
						<tr>
						<tr>
							<td class="tdWidth">封面图片</td>
							<td><input type="text" class="form-control"
								id="exampleInputNmae2" name="image" value="${news.image }"><br />
							<button type="button" class="btn btn-primary" id="img">
									上传图片</button></td>
						</tr>
						<tr>
							<td class="tdWidth">信息来源</td>
							<td><input type="text" class="form-control"
								id="exampleInputNmae3" placeholder="信息来源" name="from"
								value="${news.from }"></td>
						</tr>
						<tr>
							<td class="tdWidth">编辑</td>
							<td><input type="text" class="form-control"
								id="exampleInputNmae4" placeholder="请填写编辑者名称" name="editor"
								value="${news.editor }"></td>
						</tr>
						</tr>
						<tr>
							<td class="tdWidth">新闻日期</td>
							<td><div class="row">
									<div class='col-sm-6'>
										<div class="form-group">
											<label>选择日期+时间：</label>
											<!--指定 date标记-->
											<div class='input-group date' id='datetimepicker2'>
												<input type='text' class="form-control" name="addTime"
													value="${news.addTime }" /> <span class="input-group-addon">
													<span class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
									</div>
								</div></td>
						</tr>
						<tr>
							<td class="tdWidth">主要内容</td>
							<td><textarea class="form-control" name="content"
									style="width:1000px;height:700px;visibility:hidden;">${news.content}</textarea>
							</td>
						</tr>
					</tbody>

				</table>
				<button type="button" class="btn btn-success" id="preLook">
					预览</button>
				<button type="button" class="btn btn-success" id="Submit">
					提交</button>
				<button type="reset" class="btn btn-danger">重置</button>
				<button type="button" class="btn btn-success">
					<a href="javascript:;" onClick="javascript:history.go(-1)">返回</a>
				</button>
			</form>
			<!--表单结束-->
		</div>
	</div>
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog modal-sm flash">
			<div class="modal-content">
				<div class="modal-body">
					<div class="panel panel-default panel-bg">
						<div class="panel-body">
							<span class="color">请您上传图片</span>
						</div>
					</div>
					<form action="#" enctype="multipart/form-data" method="post"
						id="imgForm">
						<!--上传图片开始-->
						<input id="lefile" type="file" name="image" style="display:none">
					</form>
					<div class="input-append">
						<input id="photoCover" class="input-large" type="text"
							style="height:35px;">
						<button class="btn btn-style"
							onclick="$('input[id=lefile]').click();">选择文件</button>
						<button class="btn btn-style btn-success" type="button"
							id="imgSubmit">上传</button>
						<button class="btn btn-style btn-success" type="button"
							id="cancel">取消</button>
						<!--上传图片结束-->

					</div>
				</div>
			</div>
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<script type="text/javascript">
 	$("#Submit").click(function(){
 		showModal();
 		$.ajax({
						url : "<%=path%>/${ action}",
						data :$('#newsForm').serialize(),
						type : "post",
						dataType : "json",
						beforeSend : function() {
						},
						success : function(result) {
							if (result && result.status != 200) {
								alert(result.message);
								hideModal();
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
							alert("抱歉，操作失敗！");
							hideModal();
						}
					});
 		
 		
 		
 	});
 	$("#preLook").click(function(){
 		$("#newsForm").attr("action","<%=path%>/admin/news/preLook");
 		$("#newsForm").attr("target","_blank");
 		//重置表单
 		$("#newsForm").submit();
 	});
 	  //图片上传
$('input[id=lefile]').change(function() { 
$('#photoCover').val($(this).val()); 
});  
 	//隐藏加载动画函数
function hideModal2() {
	$('#myModal2').modal('hide');
}
// 显示加载动画函数
function showModal2() {
	$('#myModal2').modal({
		backdrop : 'static',
		keyboard : false
	});
}
    var imgText;
  $("#img").click(function(){
	  imgText = $(this).prev().prev();
	  showModal2();
  });
  $("#cancel").click(function(){
  		hideModal2();	
  });
    $("#imgSubmit").click(function(){
   			hideModal2();
   			showModal();
    		var url = "<%=path%>/admin/news/upload";
			var args = {
				"time" : new Date()
			};                      
			var ajaxFormOption = {
				type : "post", //提交方式  
				dataType : "json", //数据类型  
				data : args,//自定义数据参数，视情况添加
				url : url, //请求url  
				success : function(data) { //提交成功的回调函数  
				if(data.status && data.status!=200){
					hideModal();
					alert(data.message);
					return;
				} else if(data.status && data.status==200){
					imgText.val(data.backImgUrl);
					hideModal();
					alert(data.message);
					$("#imgForm input[type='file']").val("");
					return;
				}
				}
			};
			$("#imgForm").ajaxSubmit(ajaxFormOption);
			return false;
		});
	</script>
</body>
</html>
