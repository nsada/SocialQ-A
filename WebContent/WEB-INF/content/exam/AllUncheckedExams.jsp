<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="head">
    <title>待批改的试卷</title>
</rapid:override>

<rapid:override name="content">

        <div class="panel panel-info">
  							<div class="panel-heading">点击批改具体试卷哦</div>
  							
							<div class="panel-body">
   								   <div class="list-group">
   								   		<s:iterator value="Exams">
   								  
           									<a  class="list-group-item list-group-item-success"
           									    
           										 href='<s:url action="FindUncheckedExam"><s:param name="ExamID" value ="id"/> <s:param name="TesttakerID" value ="TesttakerID"/></s:url>'>
                        						标题：<s:property value="title" /> 
                        						<br>
                        						描述：<s:property value="description" />
               								</a>
       		 							</s:iterator>

									</div>
  							</div>
		</div>
</rapid:override>
=======
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="content">

        <div class="panel panel-info">
  							<div class="panel-heading">点击批改具体试卷哦</div>
  							
							<div class="panel-body">
   								   <div class="list-group">
   								   		<s:iterator value="Exams">
   								   	ExamID	<s:property value ="id"/> 
   								   		<br>
   								   	TesttakerID	<s:property value ="TesttakerID"/><br>
           									<a  class="list-group-item list-group-item-success"
           									    
           										 href='<s:url action="FindUncheckedExam"><s:param name="ExamID" value ="id"/> <s:param name="TesttakerID" value ="TesttakerID"/></s:url>'>
                        						题目：<s:property value="title" /> 
                        						<br>
                        						描述：<s:property value="description" />
               								</a>
       		 							</s:iterator>

									</div>
  							</div>
		</div>
</rapid:override>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="head">
    <title>待批改的试卷</title>
</rapid:override>

<rapid:override name="content">

        <div class="panel panel-info">
  							<div class="panel-heading">点击批改具体试卷哦</div>
  							
							<div class="panel-body">
   								   <div class="list-group">
   								   		<s:iterator value="Exams">
   								   	ExamID	<s:property value ="id"/> 
   								   		<br>
   								   	TesttakerID	<s:property value ="TesttakerID"/><br>
           									<a  class="list-group-item list-group-item-success"
           									    
           										 href='<s:url action="FindUncheckedExam"><s:param name="ExamID" value ="id"/> <s:param name="TesttakerID" value ="TesttakerID"/></s:url>'>
                        						题目：<s:property value="title" /> 
                        						<br>
                        						描述：<s:property value="description" />
               								</a>
       		 							</s:iterator>

									</div>
  							</div>
		</div>
</rapid:override>
>>>>>>> 101c3307f94547830b4e1bae04d684b274e53c87
>>>>>>> 6e51335d1720cd1116e9bce6ae1400b1a3660ac9
<%@ include file="../../../../base.jsp"%>