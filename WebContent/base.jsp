
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css">

<html>  
   <rapid:block name="head">base_head</rapid:block>  
<body class="ui-selectable">  
	<br/>  
	<rapid:block name="content">base_content</rapid:block>  
	<br/>
	
	<%
		String username;
		if (session.getAttribute("username")!=null){
			username = session.getAttribute("username").toString();
		}else{
			username = "";
		}
	%>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigetion">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">SocialQ-A</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse-basepage">
            <ul class="nav navbar-nav">
                <li class="active" id="index"><a href="<%=request.getContextPath()%>/index">主页</a></li>
                <li id="InsertExam"><a href="<%=request.getContextPath()%>/InsertExam">我要出题</a></li>
                <li id="add_book"><a href="<%=request.getContextPath()%>/book/addBook">朋友圈</a></li>
                <li id="showPersonalCenter"><a href="<%=request.getContextPath()%>/user/showPersonalCenter">个人中心</a></li>      
            </ul>
            <ul class="nav navbar-nav navbar-right">

            	<%if (username==null || username==""){%>
                	<li><a href="<%=request.getContextPath()%>/user/regist">注册</a></li>
                	<li><a href="<%=request.getContextPath()%>/user/login">登录</a></li>                   			
	    		<%}else{%>
    				<li><p class="navbar-text">欢迎你&nbsp;&nbsp;<span id="base_name">${sessionScope.username}</span></p></li>
    				<li><a href="<%=request.getContextPath()%>/user/logout">注销</a></li>
    			<%}%>

            </ul>
        </div>
		</div>
	</nav>
</body>  
</html>  