<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clearing</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body background="static/img/background.jpg">
<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron" style="width:800px; margin:2% 0 0 15%">
			<h2>购买成功</h2>
			<p>欢迎您再次购物</p>
			<p><a class="btn btn-primary btn-lg" href="#" role="button">返回</a></p>
		</div>
	</div>
	<script>
		$(document).ready(function () {
			$.ajax({
				  url: "ShoppingCartServlet",
				  data: {
			          id:id ,
			          amount:amount,
			          operation:operation
			        },
				  type:'post',
				  dataType: 'json',
				  success: function (data) {}
				  
				});
			
		})
		$(".btn").click(function(){
			window.location.href="GoodsList.jsp";
		})
	</script>
</body>
</html>