<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/layuiadmin/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/layuiadmin/css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/view/layuiadmin/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/view/layuiadmin/js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="layui-card">

		<div class="x-nav">
			<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">考勤</a>
				<a> <cite>假期申请</cite></a>
			</span>
		</div>
		<div class="x-body">
		<!-- <button class="layui-btn"
				onclick="x_admin_show('添加假期申请','${pageContext.request.contextPath}/view/views/jiaqi/jiaqishenqing-add.jsp')">
				<i class="layui-icon"></i>假期申请
			</button> -->
			<span class="x-right" style="line-height: 40px">共有数据：${data.totalCount }
				条</span>
			</xblock>
			<table class="layui-table">
				<thead>
					<tr>
						<th>
							<div class="layui-unselect header layui-form-checkbox"
								lay-skin="primary">
								<i class="layui-icon">&#xe605;</i>
							</div>
						</th>
						<th>ID</th>
						<th>申请人</th>
						<th>开始时间</th>
						<th>结束时间</th>
						<th>时长</th>
						<th>假期类别</th>
						<th>原因</th>
						<th>审批人</th>
						<th>状态</th>
						<th>拒绝原因</th>
						<c:if test="${user.roleCode != 'worker' && user.roleCode != 'leader'}">
							<th>操作</th>
						</c:if>
				</thead>
				<tbody>
					<c:forEach items="${data.rows}" var="item">
						<tr>
							<td>
								<div class="layui-unselect layui-form-checkbox"
									lay-skin="primary">
									<i class="layui-icon">&#xe605;</i>
								</div>
							</td>
							<td>${item.id}</td>
							<td>${item.staffName}</td>
							<td>${item.kaishishijian}</td>
							<td>${item.jieshushijian}</td>
							<td>${item.shichang}天</td>
							<td>${item.jiaqileixing}</td>
							<td>${item.yuanyin}</td>
							<td>${item.auditor}</td>
							<td>
								<c:choose>
				   					<c:when test="${item.auditStatus == '0' }">
				   						<p style="color: yellow">待审批</p>
   									</c:when>
   									
				   					<c:when test="${item.auditStatus == '1' }">
				   						<p style="color: green">审批成功</p>
   									</c:when>
   									<c:otherwise>
   										<p style="color: red">审批失败</p>
   									</c:otherwise>
								</c:choose>
								
								</td>
							<td>${item.reason}</td>
								<c:choose>
				   					<c:when test="${user.roleCode == 'hr' }">
							<td class="td-manage">
				   						<c:if test="${item.auditStatus == '0'}">
											<a title="审批"
									onclick="x_admin_show('审批','${pageContext.request.contextPath}/view/views/jiaqi/jiaqishenqing-edit.jsp?id=${item.id}&staffName=${item.staffName }&kaishishijian=${item.kaishishijian}&jieshushijian=${item.jieshushijian}&shichang=${item.shichang}&jiaqileixing=${item.jiaqileixing}&yuanyin=${item.yuanyin}')"
									href="javascript:void(0);"> <i class="layui-icon">&#xe642;</i>
								</a> 
									</c:if>
									</td>
   									</c:when>
   									
				   					<c:when test="${user.roleCode == 'admin' }">
									<td class="td-manage">
										<c:if test="${item.auditStatus == '0'}">
											<a title="审批"
										onclick="x_admin_show('审批','${pageContext.request.contextPath}/view/views/jiaqi/jiaqishenqing-edit.jsp?id=${item.id}&staffName=${item.staffName }&kaishishijian=${item.kaishishijian}&jieshushijian=${item.jieshushijian}&shichang=${item.shichang}&jiaqileixing=${item.jiaqileixing}&yuanyin=${item.yuanyin}')"
										href="javascript:void(0);"> <i class="layui-icon">&#xe642;</i>
										</a> 
									</c:if>
				   					
				   						<a title="删除" onclick="member_del('${item.id}')"
									href="javascript:void(0);"> <i class="layui-icon">&#xe640;</i>
								</a>
									</td>
   									</c:when>
   									<c:otherwise>
   									</c:otherwise>
								</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page">
				<div>
					<c:if test="${pageBean.currentPage==1 }">
						<a class="layui-btn-disabled">&lt;&lt;</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=1 }">
						<a class="prev"
							href="${pageContext.request.contextPath}/vacation/list.do?currentPage=${pageBean.currentPage-1 }">&lt;&lt;</a>
					</c:if>
					<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
						<c:if test="${pageBean.currentPage==page }">
							<span class="current" href="javascript:void(0);">${page }</span>
						</c:if>
						<c:if test="${pageBean.currentPage!=page }">
							<a class="num"
								href="${pageContext.request.contextPath }/vacation/list.do?currentPage=${page }">${page }</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageBean.currentPage==pageBean.totalPage}">
						<a class="layui-btn-disabled">&gt;&gt;</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
						<a class="next"
							href="${pageContext.request.contextPath }/vacation/list.do?currentPage=${pageBean.currentPage+1 }">&gt;&gt;</a>
					</c:if>
				</div>
			</div>
		</div>

	</div>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem : '#start' //指定元素
			});

			//执行一个laydate实例
			laydate.render({
				elem : '#end' //指定元素
			});
		});

		/*用户-停用*/
		function member_stop(obj, id) {
			layer.confirm('确认要取消吗？', function(index) {

				if ($(obj).attr('title') == '同意') {

					//发异步把用户状态进行更改
					$(obj).attr('title', '不同意')
					$(obj).find('i').html('&#xe62f;');

					$(obj).parents("tr").find(".td-status").find('span')
							.addClass('layui-btn-disabled').html('不同意');
					layer.msg('不同意!', {
						icon : 5,
						time : 1000
					});

				} else {
					$(obj).attr('title', '同意')
					$(obj).find('i').html('&#xe601;');

					$(obj).parents("tr").find(".td-status").find('span')
							.removeClass('layui-btn-disabled').html('已同意');
					layer.msg('已同意!', {
						icon : 5,
						time : 1000
					});
				}

			});
		}

		/*用户-删除*/
		function member_del(id) {
			layer
					.confirm(
							'确认要删除吗？',
							function(index) {
								//发异步删除数据          
								layer.msg('已删除!', {
									icon : 1,
									time : 1000
								});
								setTimeout(
										function() {
											location.href = "${pageContext.request.contextPath}/vacation/delete.do?id="
													+ id;
										}, 1000);
							});
		}

		function delAll(argument) {

			var data = tableCheck.getData();

			layer.confirm('确认要删除吗？' + data, function(index) {
				//捉到所有被选中的，发异步进行删除
				layer.msg('删除成功', {
					icon : 1
				});
				$(".layui-form-checked").not('.header').parents('tr').remove();
			});
		}
	</script>

</body>

</html>