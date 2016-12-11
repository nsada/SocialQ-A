
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
    <title>朋友圈</title>
</rapid:override>

<rapid:override name="content">
   
    <div class="panel panel-success">
        <div class="panel-heading">好友动态</div>
        <div class="panel-body">
            <div class="list-group">

                 <s:iterator value="events" var="e">     
<%--                     <a href='<s:url action="#e.url"></s:url>'>${e.event}${e.url}</a> --%>
                    <button><a class="list-group-item list-group-item-success" href="${e.url}">${e.event}</a></button> 
                 </s:iterator>
                
            </div>
        </div>
    </div>   


</rapid:override>



<%@ include file="../../../base.jsp"%>