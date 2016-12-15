
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
    <title>朋友圈</title>
</rapid:override>

<rapid:override name="contentWithoutWhiteBox">

<div class = "container table-center">
    <div class="panel panel-primary">
        <div class="panel-heading">好友动态</div>
        <div class="panel-body">
            <div class="list-group">
                <%int lambda = 0; %>
                 <s:iterator value="events" var="e">     
                        <%
                            switch(lambda) {
                            case 0:%>
                                <a class="list-group-item list-group-item-success" href="${e.url}">
                                <% 
                                break;
                            case 1:%>
                                <a class="list-group-item list-group-item-info" href="${e.url}">
                                <%
                                break;
                            case 2:%>
                                <a class="list-group-item list-group-item-warning" href="${e.url}">
                                <%
                                break;
                            case 3:%>
                                <a class="list-group-item list-group-item-danger" href="${e.url}">
                                <%
                                break;
                            default:

                            }
                            lambda++;
                            lambda%=4;
                        %>
                        <p>
                            ${e.event}
                            <span style="float:right;">
                                 ${e.time }
                            </span>
                        </p>
                    </a>
                 </s:iterator>
                
            </div>
             <button class="button button-glow button-rounded button-highlight" 
                          type="button" 
                          onclick="window.location.href='showFriends'"
                          style = "float: right;">
                    我的好友
            </button> 
        </div>
    </div>   
</div>
    


</rapid:override>



<%@ include file="../../../base.jsp"%>