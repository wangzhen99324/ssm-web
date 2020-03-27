# ssm-web Java Web 工程脚手架
#### 项目架构 ####
1.前端框架 :
	LayUi
2.后端框架:
	Java Web 工程.
	SSM 框架,
	MySQL 数据库.
3.导入项目后,请更改 jdk  和 Tomcat 
	建议 : jdk1.8 + Tomcat 8 / Tomcat 8.5 
4.数据库使用了 timestamp类型 字段  可能在低版本MySQL中报错,
	建议: MySQL 5.7 

#### 使用说明 ####
1.使用时 请更换 jdbc.properties 的 数据库连接信息.

2.主页对应的文件 WebRoot/view/views/home/console.html
	更换项目访问名的时候,需要修改 "快捷方式" 里的 超链接.

3.只有 休假查询 和 修改密码 是 可以使用的. 其他都是假页面.

4.权限控制的实现方式 是在 jsp 页面 使用  <c:if test ="${user.role}"></c:if> 

5.Mybatis Generator 插件 待补充......

6.在线生成代码 （打开比较慢）:https://www.devtool.com/javacodegen.html

7.SpringMVC 的 接口 匹配地址 为 *.do 在接口调用 404 时留意.

8.代码生成.
	1.运行  com.core.generator Main 函数 (注意修改 Mybatis-gen.xml 的路径)
	2.修改 Mybatis-gen.xml 配置.
		1.MySQL 驱动包的路径.
		2.context 中的 id = "xxx" 建议改成项目名
		3.注意 分页 和 字段注释的 插件 包路径.
		4.修改数据库连接参数
		5.修改  生成之后的文件目录
		6.修改 table 改成你要生成的表
#### 其他说明 ####
1.修改项目名称.
	右键 -->  Refactor --> Rename 
	右键 -->  Properties --> Web Project Settings 
	
2.检查项目目录中的 .project 文件 的第三行的 name 标签

3.检查项目目录中的 .settings/org.eclipse.wst.common.component 文件.
	deploy-name / java-output-path / context-root

