<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
			String username = "";
	        if (session.getAttribute("user") == null) {
	    %>
	    <script type="text/javascript">
			alert("您还没有登录，请登录...");
			window.location.href = "Login.html"
		</script>
		<%
			}else{
				username = (String) session.getAttribute("user");	
			}
		%>
	<div class="row" >
	  <div class="col-lg-2">
	  	 
	  </div>
	  <div class="col-lg-2">
	  	  <span class="input-group-btn">
	        <button class="btn btn-link" type="button" id="username"><%=username%></button>
	      </span>
	  </div>
	   <div class="col-lg-2">
	  	  <span class="input-group-btn">
	        <button class="btn btn-link" type="button" id="mainPage">首页</button>
	      </span>
	  </div>
	  <div class="col-lg-2">
	  	  <span class="input-group-btn">
	        <button class="btn btn-link" type="button" id="viewcar">购物车</button>
	      </span>
	  </div>
	  <div class="col-lg-3">
	    <div class="input-group">
	      <input type="text" class="form-control" placeholder="Search for..." style="background:transparent">
	      <span class="input-group-btn">
	        <button class="btn btn-primary" type="button">搜索</button>
	      </span>
	    </div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
	  <div class="col-lg-1">
	  	  <span class="input-group-btn">
	        <button class="btn btn-link" type="button" id="logout">退出</button>
	      </span>
	  </div>
	</div><!-- /.row -->
<script>
$('#logout').click(function() {
	$.ajax({
		url : "UserServlet",
		data : {
			action : "signOut"
		},
		type : 'post',
		dataType : 'json',
		success : function(data) {
			window.location.href = "SignIn.html";
		}

	});
})
$('#viewcar').click(function() {
	window.location.href = "ViewCart.jsp";
})
$("#mainPage").click(function() {
	window.location.href = "GoodsList.jsp";
})
</script>
	
