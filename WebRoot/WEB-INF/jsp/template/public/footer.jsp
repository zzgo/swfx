<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="footer">
<ul>
		<li class="footer-title"><img src="<%=request.getContextPath() %>/assets/images/list.png"> 学校概况</li>
		<c:forEach items="${xxgkList }" var="varNews" >
			<li><a href="<%=request.getContextPath()%>/detail/${varNews.id}.html">${varNews.title}</a></li>
		</c:forEach>
</ul>	
<ul>
		<li class="footer-title"><img src="<%=request.getContextPath() %>/assets/images/graduation_cap.png"> 学术发展</li>
		<c:forEach items="${xsfzList }" var="varNews" >
			<li><a href="<%=request.getContextPath()%>/detail/${varNews.id}.html">${varNews.title}</a></li>
		</c:forEach>		    
</ul>
<ul>
		<li class="footer-title"><img src="<%=request.getContextPath() %>/assets/images/telephone.png"> 入学咨询</li>
		<li><a>028-66666666</a></li>
		<c:forEach items="${rxzxList }" var="varNews" >
			<li><a href="<%=request.getContextPath()%>/detail/${varNews.id}.html">${varNews.title}</a></li>
		</c:forEach>	
</ul>
<ul class="media768">
		<li class="footer-title"><img src="<%=request.getContextPath() %>/assets/images/chain.png"> 友情链接</li>
		<li><a href="http://www.cefls.cn/">成都市实验外国语学校</a></li>
		<li><a href="http://www.cfls.net.cn/">成都外国语学校</a></li>
		<li><a href="http://www.cwfx.com/">成都外国语学校附属小学</a></li>
		<li><a href="http://www.cisisu.edu.cn/">四川外国语大学成都学院</a></li>		
</ul>
<ul class="lastUl">
<li class="footer-title"><img src="<%=request.getContextPath() %>/assets/images/wechat.png"> 关注我们</li>	
<div class="footer-wechat"><img src="<%=request.getContextPath() %>/assets/images/wechat.jpg"></div>	
</ul>
</div>
<div class="copyright">
<div class="adress">
<p>电话咨询：028-66666666&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮编：611130</p>
<p class="pmargin">学校地址：成都市温江区花都大道一段489号成都市实验外国语学校附属小学</p>
</div>	
<div class="adress">
<p><a href="http://www.miitbeian.gov.cn/">蜀ICP备52545464646-1号</a></p>
<p class="pmargin">版权所有&copy;成都市实验外国语学校附属小学</p>
</div>
</div>
<a class="backTop" href="javascript:;" id="backTop" title="回到顶部" alt="回到顶部"></a>
