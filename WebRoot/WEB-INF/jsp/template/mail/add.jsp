<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../../admin/public/JSTL.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta charset="UTF-8">
	<title>成都市实验外国语学校</title>
	<%@include file="../public/Css.jsp" %>
	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/newsDetails.css">	
	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/headmail.css">	
	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/mainform.css">	
  </head>
  
  <body>
  <%@include file="../public/bg.jsp" %>
  <%@include file="../public/header.jsp" %>
  <!--列表类新闻-->
<div class="second-titile"><p>校长信箱</p></div>
<div class="main-details">
<div class="idea"><img src="<%=path %>/assets/images/idea.png">
</div>
<div class="aside-left">
<div class="details-position">
<p><img src="<%=path %>/assets/images/address.png">当前位置：<a href="<%=path%>/index"><span>首页</span></a> &gt; <span>校长信箱</span></p>
</div>
<div class="mail">
 <h1>温馨提示</h1>   
<p>
 ★注：这里采取了较为可靠的<span>安全措施</span>，系统会自动将信息发给校长，而<span>不会出现在这里</span>；只有一些普遍性的问题，才会显示在这里并得到集中解答。当然，即便需要显示，<span>您的联系方式也不会被显示</span>。
</p> 
</div>
<div  class="main-form">
<!--表单开始-->	
 <form novalidate="novalidate" id="jsForm">
                <table class="table table-bordered table-hover">  
 
                    <tbody>  
                        <tr>  
                            <td class="tdWidth">姓名</td>  
                            <td><input type="text" class="form-control" placeholder="请填写您的姓名" required="" data-msg-required="不能为空" name="name"></td>   
                        </tr>  
                        <tr>  
                            <td class="tdWidth">手机</td>  
                            <td><input type="text" class="form-control" value=""   placeholder="请填写您的手机"  required="" data-rule-mobile="true" data-msg-required="请输入手机号" data-msg-mobile="请输入正确格式" name="call"></td>   
                        </tr>
                         <tr>  
                            <td class="tdWidth">邮箱</td>  
                            <td><input type="text" class="form-control" id="exampleInputNmae2" placeholder="请填写您的邮箱" required="" data-rule-email="true" data-msg-required="请输入email地址" name="email" data-msg-email="请输入正确的email地址" name="1"></td>   
                        </tr>  
                        <tr>  
                            <td class="tdWidth">主要内容</td>  
                            <td><textarea class="form-control" rows="4"  required="" name="content"></textarea></td>   
                        </tr>  
                         <tr>  
                            <td class="tdWidth">验证码</td>  
                            <td><input type="text" class="form-control" id="exampleInputNmae3" placeholder="验证码" style="float:left;width:100px" name="vc"><img alt="" src="<%=path%>/vc/ma" style="float:left;margin-top:18px" onclick="this.src='<%=path%>/vc/ma?d='+Math.random();" title="点击更换" alt="验证码占位图"></td>   
                        </tr>   
                    </tbody> 
            
                </table>           
<button type="button" class="btn btn-success" id="Submit">
					提交
				</button> 
<button type="reset" class="btn btn-danger">
					重置
				</button>                   
</form> 
<!--表单结束-->        		
</div>
</div>
</div>
<!--新闻列表结束-->
  	<%@include file="../public/footer.jsp" %>
  	<div id="wrap" class="wrap"><div><img src="<%=request.getContextPath() %>/assets/images/flash.gif"><span class="tipMsg">正在留言中...请稍后</span></div></div>
	<%@include file="../public/Js.jsp" %>
	<script type="text/javascript" src="<%=path %>/assets/js/newsDetails.js"></script>
	<script type="text/javascript" src="<%=path %>/assets/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=path %>/assets/js/validate.js"></script>
		<script type="text/javascript"
	src="<%=request.getContextPath()%>/assets/js/loading2.js"></script>
	<script>
		$("#Submit").click(function(){
			$("#jsForm").submit();
		});
		$(function(){
		    //jquery.validate
			$("#jsForm").validate({
				submitHandler: function() {
					loadingShow();
					//验证通过后 的js代码写在这里
					$.ajax({
						url : "<%=path%>/mail/add",
						data :$('#jsForm').serialize(),
						type : "post",
						dataType : "json",
						beforeSend : function() {
						},
						success : function(result) {
							if (result && result.status != 200) {
								loadingHide();
								alert(result.message);
								return;
							} else {
								setTimeout(function() {
								loadingHide();
								alert(result.message);
								window.location.reload();
								}, 500)
							}
						},
						error : function(e) {
							loadingHide();
							alert("抱歉，操作失敗！");
						}
					});
				}
			})
				
		});
</script>
  </body>
</html>
