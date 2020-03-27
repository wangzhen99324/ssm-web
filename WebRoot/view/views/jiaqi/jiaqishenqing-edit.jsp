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
		<form class="layui-form">
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>ID
				</label>
				<div class="layui-input-inline">
					<input type="text" id="id" name="id" required=""
						readonly="readonly" value="<%=request.getParameter("id")%>"
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>申请人</label>
				<div class="layui-input-inline">
					<input type="text" id="staffName" name="staffName" required=""
						readonly="readonly" value="<%=request.getParameter("staffName")%>"
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>开始时间
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" readonly="readonly" placeholder="开始时间"
						name="kaishishijian"
						value="<%=request.getParameter("kaishishijian")%>"
						id="kaishishijian" required="" lay-verify="required"
						autocomplete="off" type="text">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>结束时间
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" readonly="readonly" placeholder="结束时间"
						name="jieshushijian"
						value="<%=request.getParameter("jieshushijian")%>"
						id="jieshushijian" required="" lay-verify="required"
						autocomplete="off" type="text">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>时长
				</label>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="day" name="day"
						required="" lay-verify="day" value="1" autocomplete="off"
						class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">天</div>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="hour" name="hour"
						required="" value="8" lay-verify="hour" autocomplete="off"
						class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">小时</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>假期类别</label>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="jiaqileixing"
						name="jiaqileixing" required="" readonly="readonly"
						value="<%=request.getParameter("jiaqileixing")%>"
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>原因
				</label>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="yuanyin" name="yuanyin"
						required="" value="<%=request.getParameter("yuanyin")%>"
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>审批人
				</label>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="auditor" name="auditor"
						required="" value="${user.userName}" lay-verify="required"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button type="button" class="layui-btn"
					onclick="audit('<%=request.getParameter("id")%>',1)">允许</button>

				<label for="L_repass" class="layui-form-label"> </label>
				<button type="button" class="layui-btn"
					onclick="audit('<%=request.getParameter("id")%>',2)">拒绝</button>
			</div>
		</form>
	</div>
	<script>
		layui.use([ 'form', 'layer', 'laydate' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;
			var laydate = layui.laydate;
			form.verify({

				day : [ /^\d+$/, '天数必须>=0' ],
				hour : [ /^[0-8]$/, '小时数在0-8之间' ]

			});
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
		});
		/*用户-审核 */
		function audit(id, auditStatus) {
			var title = "";
			var sid = $("#id").val();
			var auditor = $("#auditor").val();
			if (auditStatus == 1) {
				title = "确认要审批成功吗？";
			} else {
				title = "确认要拒绝审批吗？";
			}
			layer.confirm(
							title,
							function(index) {
								// 获得frame索引
								var index = parent.layer.getFrameIndex(window.name);
								//发异步删除数据          
								layer.msg('已更新!', {
									icon : 1,
									time : 1000
								});
								setTimeout(
										function() {
											location.href = "${pageContext.request.contextPath}/vacation/approval.do?id="
													+ id +"&auditStatus=" + auditStatus+"&auditor="+auditor;
										}, 1000);
								
								setTimeout(
										function() {
											//关闭当前frame
											parent.layer.close(index);
											parent.location.reload();
										}, 1500);
								
								
							});
		}
	</script>

</body>

</html>