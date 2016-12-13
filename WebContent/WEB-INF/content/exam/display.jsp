<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="content">

        <div class="panel panel-info">
  							<div class="panel-heading">点击选择我要插入的题库</div>
  							
							<div class="panel-body">
   								 <p>当前试卷的ID<s:property value="ExamID" /></p>
   								   <div class="list-group">
   								   		<s:iterator value="questionBases">
           									<a  class="list-group-item list-group-item-success"
           										 href='<s:url action="ShowBaseQues"><s:param name="qBaseID" value ="id"/><s:param name="GroupID" value ="GroupID"/><s:param name="ExamID" value ="ExamID"/> </s:url>'>
                        						<s:property value="title" />
               								</a>
       		 							</s:iterator>

									</div>
  							</div>
		</div>
</rapid:override>
<%@ include file="../../../../base.jsp"%>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="content">

        <div class="panel panel-info">
  							<div class="panel-heading">点击选择我要插入的题库</div>
  							
							<div class="panel-body">
   								 <p>当前试卷的ID<s:property value="ExamID" /></p>
   								   <div class="list-group">
   								   		<s:iterator value="questionBases">
           									<a  class="list-group-item list-group-item-success"
           										 href='<s:url action="ShowBaseQues"><s:param name="qBaseID" value ="id"/><s:param name="GroupID" value ="GroupID"/><s:param name="ExamID" value ="ExamID"/> </s:url>'>
                        						<s:property value="title" />
               								</a>
       		 							</s:iterator>

									</div>
  							</div>
		</div>
</rapid:override>
<%@ include file="../../../../base.jsp"%>

>>>>>>> 101c3307f94547830b4e1bae04d684b274e53c87
