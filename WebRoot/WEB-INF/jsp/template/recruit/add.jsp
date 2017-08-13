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
	<title>招聘教师-成都市实验外国语学校</title>
	<%@include file="../public/Css.jsp" %>
	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/newsDetails.css">	
	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/headmail.css">	
	<link rel="stylesheet" type="text/css" href="<%=path %>/assets/css/recruitForm.css">	
  </head>
  
  <body>
 	 <%@include file="../public/bg.jsp" %>
  	<%@include file="../public/header.jsp" %>
  	<!--列表类新闻-->
<div class="second-titile"><p>招聘填写</p></div>
<div class="main-details">
<div class="idea"><img src="<%=path %>/assets/images/idea.png">
</div>
<div class="aside-left">
<div class="details-position">
<p><img src="<%=path %>/assets/images/address.png">当前位置：<a href="<%=path %>/index"><span>首页</span></a> &gt; <span>教师招聘</span></p>
</div>
<div class="mail">
 <h1>温馨提示</h1>   
<p>
应聘生活教师需要有一定的工作经验，<span>限女性</span>。有意者请直接与我校生活部联系：<span> 13882086196</span> ，不用在此填写表格，谢谢！。
</p> 
</div>
<div  class="main-form">
<p class="message">信息填写</p>
<!--表单开始-->	
 <form class="demoform clearfix" novalidate="novalidate" id="jsForm">
 <input type="text" class="text text-f" placeholder="请填写您的姓名" required="" data-msg-required="姓名不能为空" name="name"></input>
 <div class="text">
 <span class="p">您的性别：</span>
 <label><input name="sex" type="radio" value="男" class="radio" checked><span>男</span></label> 
<label><input name="sex" type="radio" value="女" class="radio"><span>女</span></label>
</div> 
 <input type="text" class="text text-f" placeholder="请填写您的出生年月" required="" data-msg-required="出生年月不能为空" name="date"></input>
 <input type="text" class="text" placeholder="请填写您的政治面貌" name="politics"></input>
 <input type="text" class="text text-f" placeholder="请填写您的职称" name="title"></input>
  <input type="text" class="text" placeholder="请填写您的普通话"  required="" data-msg-required="普通话不能为空" name="pth"></input>
 <input type="text" class="text text-f" placeholder="请填写您的身体状况" name="health"></input>
<input type="text" class="text" placeholder="请填写您的英语等级"  required="" data-msg-required="英语等级不能为空" name="english"></input>
 <input type="text" class="text text-f" placeholder="请填写您的联系电话" required="" data-rule-mobile="true" data-msg-required="请输入手机号" data-msg-mobile="请输入正确格式" name="call"></input>
 <input type="text" class="text" placeholder="请填写您要谋求的职位"   required="" data-msg-required="职位不能为空" name="position"></input>
 <input type="text" class="text1" placeholder="请填写您的毕业院校系院及时间" name="time"></input>
 <input type="text" class="text1" placeholder="请填写您的现居住地址" name="address"></input>
 <textarea type="text" class="text2" placeholder="请填写您的个人简历" name="person"></textarea>  
 <textarea type="text" class="text2" placeholder="请填写您的获奖情况" name="winning"></textarea>
 <input type="text" class="text text-f" placeholder="请您输入验证码" name="vc"></input>
 <div class="text3"><img alt="" src="<%=path%>/vc/ma" style="margin-top:5px" onclick="this.src='<%=path%>/vc/ma?d='+Math.random();" title="点击更换" alt="验证码占位图"></div><br/>
 <input type="button" id="btn_sub" class="Submit" value="提 交" >         
 <input type="reset" class="submit1" value="重 置">               
</form> 
<!--表单结束-->        		
</div>
</div>
</div>
<!--新闻列表结束-->
  	
  	<%@include file="../public/footer.jsp" %>
  	<div id="wrap" class="wrap"><div><img src="<%=request.getContextPath() %>/assets/images/flash.gif"><span class="tipMsg">信息提交中...请稍后。</span></div></div>
	<%@include file="../public/Js.jsp" %>
	<script type="text/javascript" src="<%=path %>/assets/js/newsDetails.js"></script>
	<script type="text/javascript" src="<%=path %>/assets/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=path %>/assets/js/validate.js"></script>
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/assets/js/loading2.js"></script>
	<script>
		$(".Submit").click(function(){
			$("#jsForm").submit();
		});
		$(function(){
		    //jquery.validate
			$("#jsForm").validate({
				submitHandler: function() {
					loadingShow();
					//验证通过后 的js代码写在这里
					$.ajax({
						url : "<%=path%>/recruit/add",
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
