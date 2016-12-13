<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<rapid:override name="content">

        <div class="panel panel-info">
  							<div class="panel-heading">点击查看具体试卷的回答情况哦</div>
  							
							<div class="panel-body">
   								   <div class="list-group">
   								   		<s:iterator value="Exams" var="Exam">
   								   	ExamID	<s:property value ="id"/> 
<%--    								   	<a href='<s:url action="showGroup"><s:param name="groupID" value="#group.id"/></s:url>'>${group.name}</a> --%>
   								   	<li><a href="<%=request.getContextPath()%>/ShareToWeibo?ExamID=${Exam.id}">分享到微博</a></li>  
   								   		<br>
           									<a  class="list-group-item list-group-item-success"
           									    
           										 href='<s:url action="FindExamInfor"><s:param name="ExamID" value ="id"/><s:param name="description" value ="description"/><s:param name="title" value ="title"/></s:url>'>
                        						题目：<s:property value="title" /> 
                        						<br>
                        						描述：<s:property value="description" />
               								</a>
       		 							</s:iterator>

									</div>
  							</div>
		</div>
</rapid:override>
<%@ include file="../../../../base.jsp"%>