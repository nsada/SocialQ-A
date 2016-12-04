<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="head">
	<title>个人信息</title>
</rapid:override>


<rapid:override name="content">
	<div class="col-md-10 column">
		<h2>基本信息</h2>
		<p>用户名: ${sessionScope.username}</p>
		<p>
			<a class="btn" href="#">View details »</a>
		</p>
	</div>
</rapid:override>



<%@include file="../../../base.jsp"%>
