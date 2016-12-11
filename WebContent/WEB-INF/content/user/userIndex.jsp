<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
    <title>用户信息</title>
</rapid:override>


<rapid:override name="content">
    用户名：${user.name} <br/>
    邮箱：${user.mail} <br/>
</rapid:override>




<%@include file="../../../base.jsp"%>
