
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<rapid:override name="content">
	<h3 style="text-align: center;">分享成功</h3>
	<p style = "text-align: center;">
			 <a class="button button-3d button-action button-pill" href = "<%=request.getContextPath()%>/index">返回</a>
	</p>
   
</rapid:override>
    
   
<%@include file="../../base.jsp"%>