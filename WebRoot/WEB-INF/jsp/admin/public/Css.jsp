<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 公共样式 -->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/backstage/images/logo.png" type="image/x-icon" /> 
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/normalize.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/ace.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/backstage.css">
<style>
	.replyTip{
		border:1px black solid;margin-left:10px;font-size:10px;padding:2px;color:green;
	}
	.noReplyTip{
		border:1px black solid;margin-left:10px;font-size:10px;padding:2px;color:red;
	}
</style>
