<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<<rapid:override name="head">
	<title>发布过的测试</title>
	<script>
		function ShareToWeibo( url ){
			a = "<%=session.getAttribute("openid")%>"
			if(a != "null")
				window.location.href = url;
			else
				alert("您还没有绑定qq号，请您到个人中心绑定后再试！")
			
		}
	</script>
</rapid:override>
<rapid:override name="contentWithoutWhiteBox">
	<div class = "container form-center">
		 <div class="panel panel-info">
  							<div class="panel-heading">发布过的所有测试</div>
  							
							<div class="panel-body">
   								   <div class="list-group">

   								   		<s:iterator value="Exams">
   								   				<li class="list-group-item">
   								   							<div style="position: relative;left: 15%">
			   								   							<h3>标题：<s:property value="title" /> </h3>
							                        					<p>描述：<s:property value="description" /></p>
   								   							</div>
															
				                        					<p style = "position: relative;left: 60%">
				                        							<a  class="button button-primary button-rounded button-small"
							           									 href='<s:url action="FindExamInfor"><s:param name="ExamID" value ="id"/><s:param name="description" value ="description"/><s:param name="title" value ="title"/></s:url>'>
							                        						查看详情
							               							</a>
							               							<button
							               									class="button button-action button-rounded button-small"
							               									onclick=" ShareToWeibo('<%=request.getContextPath()%>/ShareToWeibo?ExamID=${id}') ">
							               									分享到微博
							               							</button>		
				                        					</p>
				                        			
				           									
   								   				</li>
															
       		 							</s:iterator>

									</div>
  							</div>
		</div>
	</div>
</rapid:override>
<%@ include file="../../../../base.jsp"%>