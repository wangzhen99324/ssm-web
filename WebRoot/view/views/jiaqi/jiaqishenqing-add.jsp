<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
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
	<div class="x-body">
		<form class="layui-form"
			action="${pageContext.request.contextPath}/vacation/saveVacation.do"
			method="post">
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>申请人</label>
				<div class="layui-input-inline">
					<input type="text" id="staffName" name="staffName" required="" value = "${user.userName }"
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>开始时间
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="开始时间" name="kaishishijian"
						id="kaishishijian" required="" lay-verify="required"
						autocomplete="off" type="text">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>结束时间
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="结束时间" name="jieshushijian"
						id="jieshushijian" required="" lay-verify="required"
						autocomplete="off" type="text">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>时长
				</label>
				<div class="layui-input-inline">
					<input type="text" id="day" name="day" required="" lay-verify="day"
						autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">天</div>
				<div class="layui-input-inline">
					<input type="text" id="hour" name="hour" required=""
						lay-verify="hour" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">小时</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>假期类别</label>
				<div class="layui-input-inline">
					<select name="jiaqileixing" required="" lay-verify="required">
						<option class="layui-input" value="" lay-skin="primary">请选择</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>原因
				</label>
				<div class="layui-input-inline">
					<input type="text" id="yuanyin" name="yuanyin" required=""
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button type="submit" class="layui-btn" lay-filter="add"
					lay-submit="">增加</button>
			</div>
		</form>
	</div>
	<script>
		layui.use([ 'form', 'layer', 'laydate' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;
			var laydate = layui.laydate;
	/* 		form.verify({

				day : [ /^\d+$/, '天数必须>=0' ],
				hour : [ /^[0-8]$/, '小时数在0-8之间' ],

			}); */
			//执行一个laydate实例
			laydate.render({
				elem : '#kaishishijian',
				type : 'datetime',
				done : function(value) {
					laydate.render({
						elem : '#jieshushijian',
						type : 'datetime',
						min : value
					});
				}
			});

			form.on('submit(add)', function(data) {
				console.log(data);
				layer.alert("增加成功", {
					icon : 6
				}, function() {
					// 获得frame索引
					var index = parent.layer.getFrameIndex(window.name);
					//关闭当前frame
					parent.layer.close(index);
					parent.location.reload();

				});

			});
			
			
			
			layer.ready(function() {
				$.get("${pageContext.request.contextPath}/vacation/getVacationTypeList.do?name=假期类别",
					function(data, status) {
						let userList = data;
						for (i = 0; i < userList.length; i++) {
							var value = userList[i].value;
							var id = userList[i].id;
							$('select[name = "jiaqileixing"]').append("<option value='" + value + "'>" + value + "</option>");
							form.render('select');
						}
					}, "json");
	});
		
		});
	</script>

</body>

</html>