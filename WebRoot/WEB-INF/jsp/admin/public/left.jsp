<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../public/JSTL.jsp" %>
<!--侧边导航-->
<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<ul class="nav nav-list">
						<li class="${active==1?'active':'' }">
							<a href="<%=request.getContextPath() %>/admin/index">
								<i class="glyphicon glyphicon-stats"></i>
								<span class="menu-text"> 首页 </span>
							</a>
						</li>
						<li class="${active==2?'active':'' }">
							<a href="<%=request.getContextPath() %>/admin/nav/list">
								<i class="glyphicon glyphicon-blackboard"></i>
								<span class="menu-text">栏目管理</span>
							</a>
						</li>
								<li class="${active==3?'active':'' }">
									<a href="<%=request.getContextPath() %>/admin/newsleft/list">
										<i class="glyphicon glyphicon-th-large"></i>
										内容管理
									</a>
								</li>
								<c:if test="${UserInfo.type==1 }">
								<li class="${active==4?'active':'' }">
									<a href="<%=request.getContextPath() %>/admin/news/auditList">
										<i class="glyphicon glyphicon-refresh"></i>
										新闻审核管理
									</a>
								</li>
								</c:if>
								<li class="${active==5?'active':'' }">
									<a href="<%=request.getContextPath() %>/admin/mail/list">
										<i class="glyphicon glyphicon-envelope"></i>
										校长信箱管理
									</a>
								</li>

                                <li class="${active==6?'active':'' }">
									<a href="<%=request.getContextPath() %>/admin/recruit/list">
										<i class="glyphicon glyphicon-leaf"></i>
										招聘信息管理
									</a>
								</li>
								<li class="${active==7?'active':'' }">
									<a href="<%=request.getContextPath() %>/admin/news/binList">
										<i class="glyphicon glyphicon-trash"></i>
										回收站管理
									</a>
								</li>
					<li class="${active==8?'active':'' }">
									<a href="<%=request.getContextPath() %>/admin/user/list">
										<i class="glyphicon glyphicon-user"></i>
										用户管理
									</a>
								</li>
					</ul><!-- /.nav-list -->
				</div>	
<!--侧边导航-->	
