<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="content">
	<p>点击选择我要插入的题库</p>
	<table border="1">
		<p>当前试卷的ID<s:property value="ExamID" /></p>		
		<s:iterator value="questionBases">
			<tr>
				<td><a
					href='<s:url action="ShowBaseQues"><s:param name="qBaseID" value ="id"/><s:param name="ExamID" value ="ExamID"/> </s:url>'>
						<s:property value="title" />
				</a></td>
			</tr>
		</s:iterator>
	</table>
</rapid:override>
<%@ include file="../../../../base.jsp"%>