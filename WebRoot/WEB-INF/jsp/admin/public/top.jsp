<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--顶部导航-->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">
        <img alt="Brand" src="<%=request.getContextPath() %>/assets/backstage/images/logo.png">
      </a>
      <p class="navbar-text navbar-right">实外附小后台管理系统</p>
  
    </div> 
 <ul class="nav navbar-nav">
  <li class="dropdown">
          <a href="<%=request.getContextPath() %>/admin/news/auditList" >待审核 <span class="badge">${auditNewsCount }</span></a>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">欢迎您,<small>${UserInfo.name }</small><span class="caret"></span></a>
          <ul class="dropdown-menu">
          <li class="lipadding"><a href="javascript:;">累计登录<span class="font-color">${UserInfo.count }</span>次</a></li>
            <li class="lipadding"><a href="<%=request.getContextPath()%>/admin/user/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 退出登录</a></li>
          </ul>
        </li>
      </ul>   
  </div>

</nav>

 <!--加载动画-->		
 <div class="modal fade" id="myModal">  
  <div class="modal-dialog modal-sm flash">  
      <img alt="" src="<%=request.getContextPath() %>/assets/images/flash.gif" />  
      
  </div><!-- /.modal-dialog -->  
</div><!-- /.modal --> 

