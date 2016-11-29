<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<rapid:override name="head">
	<title>添加题目</title>
</rapid:override>

<rapid:override name="content">
	<%
        String idstr = request.getParameter("qBaseID");
        int qBaseID = Integer.parseInt(idstr);
        out.println("添加题目到"+qBaseID+"号题库");
    %>
	<li id="addSelection"><a
		href="<%=request.getContextPath()%>/addSelection?qBaseID=<%=qBaseID%>">单选题</a></li>

	<li id="addTextBlank"><a
		href="<%=request.getContextPath()%>/addTextBlank?qBaseID=<%=qBaseID%>">填空题</a></li>

	<li id="addAnswerQuestion"><a
		href="<%=request.getContextPath()%>/addAnswerQuestion?qBaseID=<%=qBaseID%>">问答题</a></li>
</rapid:override>




<%@include file="../../../base.jsp"%>
