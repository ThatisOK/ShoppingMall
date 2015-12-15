<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="good.GoodsDAO"%>
<%@ page import="good.Good"%>
<%
	String id = request.getParameter("id");
	GoodsDAO gd = new GoodsDAO();
	Good good = gd.getGood(Integer.parseInt(id));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//g.alicdn.com/??tm/detail/1.9.80/app.css,tm/detail/1.9.80/page/detail-3c.css" />
<title><%=good.getName()%></title>
</head>
<body background="static/img/background.jpg">
    <jsp:include page="headerTwo.jsp"/>
	<div class="row" >
		<div class="col-md-4">
		</div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail" style="background:transparent">
						<!--  <img src="http://img10.360buyimg.com/n1/jfs/t2503/30/882326252/32149/16a84c13/5631d227N94dd67f8.jpg" alt="">-->
						<img src="<%=good.getImg()%>" alt="">
						<div class="caption">
							<h3><%=good.getName()%></h3>
							<p>
							<dl class="tb-amount tm-clear">

								<dd id="J_Amount">
									<span class="tb-amount-widget mui-amount-wrap"> <input
										type="text" class="tb-text mui-amount-input" value="1"
										maxlength="8" title="请输入购买量" > <span
										class="mui-amount-btn"> <span
											class="mui-amount-increase"></span> <span
											class="mui-amount-decrease"></span>
									</span> <span class="mui-amount-unit">件</span>
									</span> <em id="J_EmStock" class="tb-hidden" style="display: inline;"></em>
									<span id="J_StockTips"> </span>
								</dd>
							</dl>
							<a href="#" class="btn btn-primary" role="button" id="add">加入购物车</a>
							</p>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input id='id' type="hidden" value=<%=id%>>


</body>
<script>
function operation(id, amount) {
	amount = typeof amount !== '' ? amount : 1;
	$.ajax({
		url : "ShoppingCartServlet",
		data : {
			id : id,
			amount : amount,
			operation : "add"
		},
		type : 'post',
		dataType : 'json',
		success : function(data) {
		}

	});

}
$('.mui-amount-increase').click(function() {
	$(".mui-amount-input").val(function(n, c) {
		return parseInt(c) + 1;
	})
})
$('.mui-amount-decrease').click(function() {
	$(".mui-amount-input").val(function(n, c) {
		if (parseInt(c) == 1)
			return parseInt(c)
		return parseInt(c) - 1;
	})
})
$('#add').click(function() {
	var amount = $(".mui-amount-input").val();
	var id = $('#id').val();
	operation(id, amount);
	window.location.href = "ViewCart.jsp";
})
$(".mui-amount-input").keyup(function() {
	var amount = $(this).val();
	var reg = /^[0-9]+$/;
	var regNum = /[^0-9]/g;
	if (!reg.test(amount) || (amount <= 0)) {
		$(this).val(function(n, c) {
			if (amount.replace(regNum, "") != "") {
				return amount.replace(regNum, "");
			}

			return 1;
		})
	}

})
	
</script>
</html>