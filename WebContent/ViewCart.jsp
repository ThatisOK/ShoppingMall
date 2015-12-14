<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="shop.GoodsDAO"%>
<%@ page import="shop.Good"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
</style>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//g.alicdn.com/??tm/detail/1.9.80/app.css,tm/detail/1.9.80/page/detail-3c.css" />
<title>ShoppingCart</title>
</head>
<body background="static/img/background.jpg">
	<jsp:include page="header.jsp"/>
	<table class="table">
		<tr>
			<td><input type="checkbox" id="selectAllUp" >全选</td>
			<td>物品名称</td>
			<td>数量</td>
			<td>单价(元)</td>
			<td>金额(元)</td>
			<td>操作</td>
		</tr>
		<%
			GoodsDAO gd = new GoodsDAO();
			Good good;
			int num = 0;
			for (Enumeration<String> goods = session.getAttributeNames(); goods.hasMoreElements();) {
				String s = goods.nextElement();	
				if (!s.equals("user")) {
					num = (Integer) session.getAttribute(s);
					good = gd.getGood(Integer.parseInt(s));
		%>
		<tr id="<%=good.getId()%>tr">
			<td><input type="checkbox" name='selectFlag' id="select"></td>
			<td><%=good.getName()%></td>
			<td>
				<dl class="tb-amount tm-clear">

					<dd id="J_Amount">
						<span class="tb-amount-widget mui-amount-wrap"> <input
							type="text" class="tb-text mui-amount-input" value="<%=num%>"
							maxlength="8" id="<%=good.getId()%>input" style="background:transparent" > <span
							class="mui-amount-btn"> <span class="mui-amount-increase"
								id="<%=good.getId()%>"></span> <span
								class="mui-amount-decrease" id="<%=good.getId()%>"></span>
						</span> <span class="mui-amount-unit">件</span>
						</span> <em id="J_EmStock" class="tb-hidden" style="display: inline;"></em>
						<span id="J_StockTips"> </span>
					</dd>
				</dl>
			</td>
			<td><span id="<%=good.getId()%>price"><%=good.getPrice()%></span></td>
			<td><span id="<%=good.getId()%>money"><%=num * good.getPrice()%></span></td>
			<td><button type="button" id="<%=good.getId()%>delete" class="btn btn-link">删除</button></td>
		</tr>
		<%
			}

			}
		%>
	<tr>
			<td><input type="checkbox" id="selectAllDown" >全选</td>
			<td><button type="button" id="deleteAll" class="btn btn-link">删除</button></td>
			<td id="selectedAmount">已选商品0件</td>
			<td id="selectedMoney">合计:0.0</td>
			<td><input type="button" class="btn btn-link" value="返回购物"
				id="ReturnList"></td>
			<td><input type="button" class="btn btn-link" value="立即结算"
				id="Clearing" data-toggle="modal" data-target="#confirmModal" data-whatever="@mdo"></td>
		</tr>
	</table>
	<!--此为确认订单信息弹出框  -->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="exampleModalLabel">确认购物信息</h4>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="form-group">
	            <label for="recipient-name" class="control-label">收件人:</label>
	            <input type="text" class="form-control" id="recipient-name">
	          </div>
	          <div class="form-group">
	            <label for="message-text" class="control-label">电话:</label>
	            <input type="text" class="form-control" id="recipient-name">
	          </div>
	          <div class="form-group">
	            <label for="message-text" class="control-label">地址:</label>
	            <textarea class="form-control" id="message-text"></textarea>
	          </div>
	          <div class="form-group">
	            <label for="message-text" class="control-label">留言:</label>
	            <textarea class="form-control" id="message-text"></textarea>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="return">返回修改</button>
	        <button type="button" class="btn btn-primary" id="confirm">确认订单</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--此为确认订单信息弹出框  end-->
	<script >

	
	function operation(id, operation, amount){
		amount = typeof amount !== 'undefined' ?  amount : 1;
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
		
	}
		/* 
		 *点击增大按钮
		 */
		$('.mui-amount-increase').click(
				function() {
					var id = $(this).attr('id');
					var obj = $('#' + id + "input");
					obj.val(function(n, c) {
						return parseInt(c) + 1;
					})
					var money = $('#' + id + "money");
					money.text(function(i, text) {
						return parseInt(obj.val())
								* parseInt($('#' + id + "price").text());
					})
					operation(id, "update", parseInt(obj.val()));

				})
		/*  
		 *点击减小按钮 
		 */
		$('.mui-amount-decrease').click(
				function() {
					var id = $(this).attr('id');
					var obj = $('#' + id + "input");
					obj.val(function(n, c) {
						if (parseInt(c) >= 2)
							return parseInt(c) - 1;
						else
							return parseInt(c)
					})
					var money = $('#' + id + "money");
					money.text(function(i, text) {
						return parseInt(obj.val())
								* parseInt($('#' + id + "price").text());
					})
					
					operation(id, "update", parseInt(obj.val()));
				})
		/*
		 *禁止输入非数字，比如字母，小数点
		 *如果为空，则显示0
		 */
		$(".mui-amount-input").keyup(
				function() {
					var amount = $(this).val();
					var id = $(this).attr('id').replace(/[^\d.]/g, "");
					var obj = $('#' + id + "money");
					var reg = /^[0-9]+$/;
					var regNum = /[^0-9]/g;
					if (!reg.test(amount) || (amount <= 0)) {
						$(this).val(function(n, c) {
							if(amount.replace(regNum, "") != "")
								return amount.replace(regNum, "");
							return 1;
						})
						obj.text(function(i, text) {
							return parseInt(amount.replace(regNum, ""))
									* $('#' + id + "price").text();
						})
					}

					obj.text(function(i, text) {
						if (amount == "")
							return 0;
						return parseInt(amount.replace(regNum, ""))
								* $('#' + id + "price").text();
					})
					operation(id, "update", parseInt(amount));

				})
		/*
		 *返回购物界面
		 */
		$("#ReturnList").click(function() {
			window.location.href = "GoodsList.jsp";
		})
		
		$("[id$='delete']").click(function() {
			if(confirm("确认删除？")){
				var id = $(this).attr('id').replace(/[^\d.]/g, "");
				$(this).parent("td").parent("tr").remove(); 
				operation(id,"delete");
			}
			
		})
		// 全选
		$("#selectAllUp").click(function(){
			if (this.checked) {  
                $("input:checkbox").each(function() { //遍历所有的name为selectFlag的 checkbox  
                	$(this).prop("checked", true);  
                 })  
            } else {   //反之 取消全选   
                $("input:checkbox").each(function() { //遍历所有的name为selectFlag的 checkbox  
                	$(this).prop("checked", false);  
                            //alert("f");  
                })  
            }  
        }) 
        $("#selectAllUp").click(function(){
			if (this.checked) {  
                $("input:checkbox").each(function() { //遍历所有的name为selectFlag的 checkbox  
                	$(this).prop("checked", true);  
                 })  
            } else {   //反之 取消全选   
                $("input:checkbox").each(function() { //遍历所有的name为selectFlag的 checkbox  
                	$(this).prop("checked", false);  
                            //alert("f");  
                })  
            }  
        }) 
        
        var countChecked = function() {
			alert($(this).attr("checked"));
			var n = $( "input:checked[name='selectFlag']" ).length;
			var sum = 0;
			$("#selectedAmount" ).text( "已选商品"+n+"件"  );
			$("input:checked[name='selectFlag']").each(function() { //遍历所有的name为selectFlag的 checkbox  
				alert($(this).attr("checked"));
				if($(this).attr("checked") == true){
            		sum += parseInt($("span[id$='money']").text());
            		$("#selectedMoney" ).text( "合计:¥"+sum);
            	}
             })  
				
		}; 
		
		$( "input[type=checkbox]" ).on( "click", countChecked );
		
		$("#confirm").click(function(){
			alert("Confim");
		})
		
		
	</script>
</body>
</html>