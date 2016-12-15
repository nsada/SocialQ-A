
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
    <title>工作组日志</title>
</rapid:override>

<rapid:override name="contentWithoutWhiteBox">
<div class = "container table-center"style="position: relative;top:20px;">
	<div class="panel panel-primary" >
        <div class="panel-heading">工作组动态</div>
        
        <div class="panel-body">
            <div class="list-group">

                 <s:iterator value="events" var="e">     
                    <li class="list-group-item list-group-item-warning">
                    		<p>
                    				${e.event}
                    				<span style="float:right;">${ e.time}</span>
                    		</p>
                    </li>
                 </s:iterator>
                
            </div>
            <div class="text-align:right">
            <button class="button button-glow button-rounded button-raised button-primary" 
            				type="button" 
            				style="float:right;"
            				onclick="window.location.href='showGroup?groupID=${groupID}'">
                   返回工作组页面
            </button> 
        </div>
        </div>

    </div>   
</div>   
    


</rapid:override>



<%@ include file="../../../base.jsp"%>