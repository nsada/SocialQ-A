<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<<rapid:override name="head">
	<title>发布过的测试</title>
</rapid:override>
<rapid:override name="content">
        <div class="panel panel-info">
  							<div class="panel-heading">发布过的所有测试</div>
  							
							<div class="panel-body">
   								   <div class="list-group">

   								   		<s:iterator value="Exams">
											<p>
												标题：<s:property value="title" /> 
                        						<br>
                        						描述：<s:property value="description" />
											</p>
           									<a  class="button button-primary button-rounded button-small"
           										 href='<s:url action="FindExamInfor"><s:param name="ExamID" value ="id"/><s:param name="description" value ="description"/><s:param name="title" value ="title"/></s:url>'>
                        						查看详情
               								</a>
               								<a href="<%=request.getContextPath()%>/ShareToWeibo?ExamID=${id}"
               									class="button button-action button-rounded button-small">
               									分享到微博
               								</a>
       		 							</s:iterator>

									</div>
  							</div>
		</div>
</rapid:override>
<%@ include file="../../../../base.jsp"%>