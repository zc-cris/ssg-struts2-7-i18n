<%@ page language="java" contentType="text/html; charset="UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<s:debug></s:debug>
	<!-- 从国际化资源中读取value值 -->
	<s:text name="time">
		<!-- 从值栈中获取date属性填充占位符 -->
		<s:param value="date"></s:param>
	</s:text>
	<br>
	<a href="testI18n.action?request_locale=en_US">english</a>
	<br>
	<a href="testI18n.action?request_locale=zh_CN">中文</a>
	<br>
	<!-- 直接访问国际化资源文件带占位符的value值，前提是资源文件中已经设置了ognl表达式获取值栈中的属性值 -->
	<s:text name="time2"></s:text>
	<br>
	<s:form action="" theme="simple">
	
		<!-- xhtml默认主题下：如果使用label属性， 一般都是写死了的，必须使用 %{getText('username')} 这样的方式才可以从国际化资源文件中获取value值
			 因为此时在对象栈中有 DefaultTextProvider 的一个实例，该对象中提供了访问国际化资源文件的getText方法，同时需要通过struts2框架
			 当前label属性放入的不是字符串，而是一个ognl表达式，所以使用%{}的形式将getText方法包装起来，以强制性进行ognl解析
		-->
		<!-- 如果是simple主题，即直接使用<s:text name=""/>标签来直接访问国际化标签里的value值，作为 s:textfield 标签里的label属性的替代
		-->
		<s:text name="username"/>:  <s:textfield name="username" label="%{getText('username')}"></s:textfield>
		
		<!-- xhtml默认主题下：key 的方式可以直接去资源文件中获取value值，并且当做label属性 -->	
		<s:text name="username"/>:  <s:textfield name="username" key="username"></s:textfield>
		<s:text name="password"/>:  <s:password name="password" key="password"></s:password>
		<s:submit key="submit" value="%{getText('submit')}"></s:submit>
	</s:form>
</body>
</html>