<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--防强值跳转 --%>
<%
	if (session.getAttribute("user") == null) {
		out.println("<script>alert('登录超时，请先登录！');window.location.href='login.jsp';</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>设置我的密码</title>
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
</head>
<body>

	<div class="layui-fluid">
		<form class="layui-form">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md12">
					<div class="layui-card">
						<div class="layui-card-header">修改密码</div>
						<div class="layui-card-body" pad15>

							<div class="layui-form" lay-filter="">
								<div class="layui-form-item">
									<label class="layui-form-label">当前密码</label>
									<div class="layui-input-inline">
										<input type="password" name="oldPassword"
											lay-verify="required" lay-verType="tips" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">新密码</label>
									<div class="layui-input-inline">
										<input type="password" name="password" lay-verify="pass"
											lay-verType="tips" autocomplete="off" id="LAY_password"
											class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">确认新密码</label>
									<div class="layui-input-inline">
										<input type="password" name="repassword" lay-verify="repass"
											lay-verType="tips" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn" lay-submit lay-filter="setmypass">确认修改</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script>
		layui.use([ 'form', 'layer', ], function() {
			$ = layui.jquery;
			var form = layui.form;
			form.on('submit(setmypass)', function(data) {
				console.log(data.field)
				if (data.field.password != data.field.repassword) {
					layer.msg('两次密码输入不一致');
					return false;
				}
				if (data.field.password == data.field.oldPassword) {
					layer.msg('新旧密码不能输入不一致');
					return false;
				}
				
				$.ajax({
					url : "/ssm-kaoqin/user/modifyPassword.do",
					async : false,
					type : "POST",
					dataType : "json",
					data : data.field,
					success : function(data) {
						var status = data.status
						if (status == '0') {
							console.log("修改成功")
							layer.msg('修改成功 - 页面即将跳转 至 重新登录');
							setTimeout(
									function() {
										window.top.location.href= "/ssm-kaoqin/view/views/login.jsp";
									}, 1000);
							
						} else if (status == '1') {
							var msg = data.msg;
							layer.msg('修改失败 : ' + msg);
						}
					}
				})
				return false; 
			});
			
			
		});
	</script>

</body>
</html>