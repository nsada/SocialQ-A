<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="content">
	<%if((int)request.getAttribute("num")!=0){ %>
        <div class="panel panel-info">
                            <div class="panel-heading">点击查看具体详情哦</div>
                            
                            <div class="panel-body">
                                   <ul class="list-group">
                                        <s:iterator value="friends">
                                        			<li class="list-group-item">
                                        				<span class="badge"style="float:none;"><s:property value="rank" /></span>
                                        				<div style="position: relative;left: 10%;" >
		                                        						<h4>Name：<s:property value="name" /> </h4>
		                                                				<p>Score ：<s:property value="Examscore" /></p>
																		<a  class="button button-raised button-highlight button-pill button-jumbo button-small"
																			 style="position: relative;left: 65%;"
				                                                 			 href='<s:url action="WantedUserExamDetail"><s:param name="ExamID" value ="ExamID"/> <s:param name="TesttakerID" value ="id"/></s:url>'>
				                                                                 显示该用户的答题详情
				                                            			</a>
                                            			</div>
													</li>
                                        </s:iterator>

                                    </ul>
                            </div>
        </div>
        <%}
			else{%>
				<h4 style = "text-align: center;">对不起，您的小伙伴还没有答过这套测试</h4>
			<%} %>
</rapid:override>
<%@ include file="../../../../base.jsp"%>