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
<title>高校职工考勤管理系统</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css"
	media="all">
<link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">

<script>
	/^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
</script>
</head>
<body class="layui-layout-body">

	<div id="LAY_app">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<!-- 头部区域 -->
				<ul class="layui-nav layui-layout-left">
					<li class="layui-nav-item layadmin-flexible" lay-unselect><a
						href="javascript:;" layadmin-event="flexible" title="侧边伸缩"> <i
							class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
					</a></li>
					<li class="layui-nav-item" lay-unselect><a href="javascript:;"
						layadmin-event="refresh" title="刷新"> <i
							class="layui-icon layui-icon-refresh-3"></i>
					</a></li>
				</ul>
				<ul class="layui-nav layui-layout-right"
					lay-filter="layadmin-layout-right">
					<li class="layui-nav-item" lay-unselect><a href="javascript:;">
							<p>${user.userName}</p>
					</a>
						<dl class="layui-nav-child">
							<!-- 
							<dd>
								<a lay-href="set/user/info.html">基本资料</a>
							</dd>
							<dd>
								<a lay-href="set/user/password.html">修改密码</a>
							</dd>
							<hr>
							 -->

							<ddstyle="text-align:center;"> <a
								href="${pageContext.request.contextPath}/view/views/login.jsp">退出</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item" lay-unselect><a href="javascript:;">
							<p>${user.roleName }</p>
					</a></li>
				</ul>
			</div>

			<!-- 侧边菜单 -->
			<div class="layui-side layui-side-menu">
				<div class="layui-side-scroll">
					<div class="layui-logo" lay-href="home/console.html">
						<span>高校职工考勤管理系统</span>
					</div>

					<ul class="layui-nav layui-nav-tree" lay-shrink="all"
						id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
						<li data-name="home" class="layui-nav-item"><a
							href="javascript:;" lay-tips="主页" lay-direction="2"> <i
								class="layui-icon layui-icon-home"></i> <cite>主页</cite>
						</a>
							<dl class="layui-nav-child">
								<dd data-name="console" class="layui-this">
									<a lay-href="home/console.html">控制台</a>
								</dd>
							</dl></li>
						<li data-name="component" class="layui-nav-item"><a
							href="javascript:;" lay-tips="考勤" lay-direction="2"> <i
								class="layui-icon layui-icon-component"></i> <cite>考勤</cite>
						</a>
							<dl class="layui-nav-child">
								<dd data-name="button">
									<a
										lay-href="${pageContext.request.contextPath}/attendanceRecord/list.do">考勤记录</a>
								</dd>

								<dd data-name="nav">
									<a
										lay-href="${pageContext.request.contextPath}/vacation/list.do">假期管理</a>
								</dd>

								<dd data-name="badge">
									<a
										lay-href="${pageContext.request.contextPath}/attendanceRecord/queryAttendanceList.do">考勤查询</a>
								</dd>
							</dl></li>

						<c:if test="${user.roleCode != 'worker' }">
							<li data-name="user" class="layui-nav-item"><a
								href="javascript:;" lay-tips="员工" lay-direction="2"> <i
									class="layui-icon layui-icon-user"></i> <cite>职工</cite>
							</a>
								<dl class="layui-nav-child">
									<dd>
										<a
											lay-href="${pageContext.request.contextPath}/worker/list.do">职工管理</a>
									</dd>

								</dl></li>

							<li data-name="user" class="layui-nav-item"><a
								href="javascript:;" lay-tips="人事管理" lay-direction="2"> <i
									class="layui-icon layui-icon-user"></i> <cite>人事</cite>
							</a>
								<dl class="layui-nav-child">
									<dd>
										<a lay-href="${pageContext.request.contextPath}/hr/list.do">人事管理</a>
									</dd>
								</dl></li>

							<li data-name="user" class="layui-nav-item"><a
								href="javascript:;" lay-tips="部门管理" lay-direction="2"> <i
									class="layui-icon layui-icon-user"></i> <cite>部门</cite>
							</a>
								<dl class="layui-nav-child">
									<dd>
										<a lay-href="${pageContext.request.contextPath}/dept/list.do">部门管理</a>
									</dd>
								</dl></li>

							<c:if
								test="${user.roleCode == 'leader' || user.roleCode == 'admin' }">
								<li data-name="user" class="layui-nav-item"><a
									href="javascript:;" lay-tips="校领导管理" lay-direction="2"> <i
										class="layui-icon layui-icon-user"></i> <cite>校领导</cite>
								</a>
									<dl class="layui-nav-child">
										<dd>
											<a
												lay-href="${pageContext.request.contextPath}/leader/list.do">校领导管理</a>
										</dd>

									</dl></li>
							</c:if>
						</c:if>

						<li data-name="set" class="layui-nav-item"><a
							href="javascript:;" lay-tips="设置" lay-direction="2"> <i
								class="layui-icon layui-icon-set"></i> <cite>设置</cite>
						</a>
							<dl class="layui-nav-child">
								<dd>
									<a href="javascript:;">我的设置</a>
									<dl class="layui-nav-child">
										<dd>
											<a lay-href="set/user/password.jsp">修改密码</a>
										</dd>
									</dl>
								</dd>
							</dl></li>

					</ul>
				</div>
			</div>

			<!-- 页面标签 -->
			<div class="layadmin-pagetabs" id="LAY_app_tabs">
				<div class="layui-icon layadmin-tabs-control layui-icon-prev"
					layadmin-event="leftPage"></div>
				<div class="layui-icon layadmin-tabs-control layui-icon-next"
					layadmin-event="rightPage"></div>
				<div class="layui-icon layadmin-tabs-control layui-icon-down">
					<ul class="layui-nav layadmin-tabs-select"
						lay-filter="layadmin-pagetabs-nav">
						<li class="layui-nav-item" lay-unselect><a
							href="javascript:;"></a>
							<dl class="layui-nav-child layui-anim-fadein">
								<dd layadmin-event="closeThisTabs">
									<a href="javascript:;">关闭当前标签页</a>
								</dd>
								<dd layadmin-event="closeOtherTabs">
									<a href="javascript:;">关闭其它标签页</a>
								</dd>
								<dd layadmin-event="closeAllTabs">
									<a href="javascript:;">关闭全部标签页</a>
								</dd>
							</dl></li>
					</ul>
				</div>
				<div class="layui-tab" lay-unauto lay-allowClose="true"
					lay-filter="layadmin-layout-tabs">
					<ul class="layui-tab-title" id="LAY_app_tabsheader">
						<li lay-id="home/console.html" class="layui-this"><i
							class="layui-icon layui-icon-home"></i></li>
					</ul>
				</div>
			</div>


			<!-- 主体内容 -->
			<div class="layui-body" id="LAY_app_body">
				<div class="layadmin-tabsbody-item layui-show">
					<iframe src="home/console.html" frameborder="0"
						class="layadmin-iframe"></iframe>
				</div>
			</div>

			<!-- 辅助元素，一般用于移动设备下遮罩 -->
			<div class="layadmin-body-shade" layadmin-event="shade"></div>
		</div>
	</div>
	<script src="../layuiadmin/layui/layui.js"></script>
	<script>
		layui.config({
			base : '../layuiadmin/' //静态资源所在路径
		}).extend({
			index : 'lib/index' //主入口模块
		}).use('index');
	</script>
</body>
</html>


