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
  		<title>${action=='admin/nav/add'?'添加栏目':'修改栏目' }</title>
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
							<li><a href="<%=path %>/admin/nav/list">栏目管理</a></li>
							<li class="active">新增栏目</li>
						</ul><!-- .breadcrumb -->
					</div>	
					<div class="table-responsive">
			<div class="panel panel-success">
  <div class="panel-body">
    请认真填写以下内容，确定新增栏目的有效性
  </div>
</div>

<!--表单开始-->

<form action="<%=path%>/${ action}" method="post" id="navFormSubmit">
<input type="hidden"  value="${nav.id }" name="${action=='admin/nav/add'?'':'id' }"/>
<table class="table table-bordered table-hover">  
 
<tbody>  
<tr>  
                            <td class="tdWidth">${action=='admin/nav/add'?'新增':'修改' }栏目名称</td>  
                            <td><input type="text" class="form-control" id="exampleInputName" placeholder="请填写${action=='admin/nav/add'?'新增':'修改' }栏目" name="name" value="${nav.name }"></td>   
                        </tr>  
                         <tr>  
                            <td class="tdWidth">栏目链接</td>  
                            <td><input type="text" class="form-control" id="exampleInputNmae1" placeholder="栏目链接" name="link" value="${nav.link }"></td>   
                        </tr> 
                           <tr>  
                            <td class="tdWidth">所属一级导航</td>  
                            <td>
<select class="form-control" name="parentId">
<option value="0" ${nav.parentId==0?'selected':'' }>顶级栏目</option>
<c:forEach items="${topList }" var="varNav">
  <option value="${varNav.id }" ${nav.parentId==varNav.id?'selected':'' }>${varNav.name }</option>
  </c:forEach>
</select></td>   
                        </tr>
                       <tr><td class="tdWidth">是否隐藏</td><td>
                       <label class="radio-inline">
  <input type="radio" name="show" id="inlineRadio1" value="0" ${nav.show==0?'checked':'' }> 是
</label>
<label class="radio-inline">
  <input type="radio" name="show" id="inlineRadio2" value="1" ${nav.show==1?'checked':''} ${action=='admin/nav/add'?'checked':'' } > 否
</label>	
                       </td></tr>  
 <tr>  
                            <td class="tdWidth">栏目模板</td>  
                            <td>
<select class="form-control" name="tempId">
  <option value="1" ${nav.tempId==1?'selected':'' }>列表模板</option>
  <option value="2" ${nav.tempId==2?'selected':'' }>图文模板</option>
</select></td>   
                        </tr>
                        <tr>  
                            <td class="tdWidth">说明</td>  
                            <td>  <textarea class="form-control" rows="3" name="description" >${nav.description }</textarea> </td>   
                        </tr>  
                        <tr>  
                            <td class="tdWidth">排序（数字小靠前）</td>  
                            <td><input type="number" min="1" class="form-control" id="exampleInputNmae1" placeholder="排序" name="order" value="${nav.order>=1?nav.order:999}"></td>   
                        </tr>   
                    </tbody> 
            
                </table>       
        
<button type="button" class="btn btn-success" id="Submit">
					提交
				</button> 
<button type="reset" class="btn btn-danger">
					重置
				</button> 
<button type="button" class="btn btn-success">
					<a href="javascript:;" onClick="javascript:history.go(-1);">返回</a>
				</button> 	
</form> 
<!--表单结束-->
                </div>     			
 </div>	
<script type="text/javascript">
	
 $("#Submit").click(function(){   
    //测试加载动画调用showModal方法
    showModal();   
    //验证
    var name = $("input[name='name']").val();
    if(name==''||name==null){
    	alert("栏目名称不能为空！");
    	hideModal();              
    	return;
   }
 		$.ajax({
						url : "<%=path%>/${ action}",
						data :$('#navFormSubmit').serialize(),
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
 </script>
  </body>
</html>
