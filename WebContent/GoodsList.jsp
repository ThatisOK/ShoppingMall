<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="shop.GoodsDAO"%>
<%@ page import="shop.Good"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>GoodsList</title>

<style type="text/css">
table input[type=text] {
	width: 32px;
}
</style>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body background="static/img/background.jpg">
	<jsp:include page="header.jsp"/>
	<form action="ShopCar.jsp" methd="post">
		<div >
			<table id="PriceTable" class="table table-bordered">
				<tr>
					<td>物品名称</td>
					<td>价格</td>
				</tr>
				<%
					GoodsDAO gd = new GoodsDAO();
					ArrayList<Good> goods = new ArrayList<Good>();
					goods = gd.getGoods();
					for (int i = 0; i < goods.size(); i++) {
				%>
				<tr>

					<td><a href='ShowGood.jsp?id=<%=goods.get(i).getId()%>' /><%=goods.get(i).getName()%></td>
					<td><%=goods.get(i).getPrice()%></td>

				</tr>
				<%
					}
				%>

			</table>
		</div>
	</form>
</body>
</html>