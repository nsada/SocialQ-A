<%@page import="domain.QuestionBase"%>
<%@page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
    <title>工作组</title>
</rapid:override>


<rapid:override name="contentText">

    <div class="col-md-10 column">
        <h1>${group.name}</h1>
        ${group.description}

        <div class="text-align:right">
            <li class="dropdown" style="margin-top: 5px">
                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        选择用户添加入工作组<b class="caret"></b>
                 </a>
                 <ul class="dropdown-menu">
                    <s:iterator value="users" var="u">
                        <button><a href='<s:url action="addGroupUser"><s:param name="groupID" value="group.id"/><s:param name="adduserID" value="#u.id"/></s:url>'>${u.name}</a></button>
                    </s:iterator> 
                </ul>
            </li>      
<%--             选择用户添加入工作组
            <s:iterator value="users" var="u">
                 <a href='<s:url action="addGroupUser"><s:param name="groupID" value="group.id"/><s:param name="adduserID" value="#u.id"/></s:url>'>${u.name}</a>
            </s:iterator>      --%>
        </div>
        <table class="table table-bordered table-hover ">
            <caption>工作组成员</caption>
            <tbody>
                <s:iterator value="groupusers" var="guser">
                    <tr>
                        <td>${guser.name}</td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>
</rapid:override>




<%@include file="../PersonalCenter.jsp"%>
