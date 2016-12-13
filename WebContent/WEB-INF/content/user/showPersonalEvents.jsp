
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
    <title>个人动态</title>
    <link rel="stylesheet" href="http://www.helloweba.com/demo/css/main.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/timeline.css" />
</rapid:override>


<rapid:override name="contentWithoutWhiteBox">  


<div class = "container table-center" style="opacity: 0.85">
	<section id="cd-timeline" class="cd-container">
		<s:iterator value="events" >     
			<div class="cd-timeline-block">
				<div class="cd-timeline-img cd-picture"></div>
				<div class="cd-timeline-content">
                    <p><s:property value="event"/></p>
                    <a class="button  button-glow button-action button-pill button-small" href="<s:property value = 'url'/>" 
                    	style="float:right;">
                    	查看详情
                    </a>
					<span class="cd-date" style="color:white;">${time}</span>
				</div>
			</div>           
        </s:iterator>
	</section>
</div>

</rapid:override>


<%@ include file="../../../base.jsp"%>