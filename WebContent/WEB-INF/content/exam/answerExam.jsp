
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="content">
    <p>点击选择我要插入的题库</p>
    <table border="1">
        <p>当前试卷的ID<s:property value="ExamID" /></p>     
      <s:form action="answerExam" method="post">
     ExamID:     <s:textfield name="ExamID"/> 
     <br>
     selection_answer:    <s:textfield name="selection_answer"/> 
     <br>
      text_blank:   <s:textfield name="textblank_answer"/> 
      <br>
     multy_answer:   <s:textfield name="multy_answer"/> 
     <br>
     AandQ_answer:   <s:textfield name="AandQ_answer"/> 
        <s:submit value="Input Author Name"/>
    </s:form>
    
    </table>
</rapid:override>
<%@ include file="../../../../base.jsp"%>