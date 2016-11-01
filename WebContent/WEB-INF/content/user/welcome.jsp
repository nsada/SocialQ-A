<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  

<rapid:override name="head">  
    <title>操作成功</title>
</rapid:override>  
<rapid:override name="content"> 
<div class="container table-center">
    <h2 class="navbar-text">恭喜&nbsp;<span id="base_name">${sessionScope.username}</span>操作成功！</h2>
</div>
</rapid:override>
<%@include file="../../../base.jsp"%> 