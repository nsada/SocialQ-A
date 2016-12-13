<%@page import="tencentApi.globalVar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<title>
			跳转页面
		</title>
		<script src="https://code.jquery.com/jquery.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				window.location.href = "<%=request.getContextPath()%>/<%=request.getAttribute("redirect_url")%>?login_result=<%=request.getAttribute("login_result")%>&regist_result=<%=request.getAttribute("regist_result")%>";
			})	
		</script>

	</head>
	<body>
		界面跳转中，请稍后.......
	</body>
</html>