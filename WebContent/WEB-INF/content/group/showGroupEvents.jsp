
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
    <title>工作组日志</title>
</rapid:override>

<rapid:override name="content">
   
    <div class="panel panel-success">
        <div class="panel-heading">工作组动态</div>
        <div class="text-align:right">
            <button class="btn btn-default" type="button" onclick="window.location.href='showGroup?groupID=${groupID}'">
                   返回工作组页面
            </button> 
        </div>
        <div class="panel-body">
            <div class="list-group">

                 <s:iterator value="events" var="e">     
                    <li class="list-group-item">${e.event}</li>
                 </s:iterator>
                
            </div>
        </div>

    </div>   


</rapid:override>



<%@ include file="../../../base.jsp"%>