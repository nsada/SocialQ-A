<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>   
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="head">  
    <title>我的工作组</title>
</rapid:override>  


<rapid:override name="contentText"> 

<div class="col-md-10 column">

    <div class="text-align:right">
        <button class="btn btn-default" type="button" onclick="window.location.href='addGroup'">
               创建工作组
        </button> 
    </div>

    <table class="table table-bordered table-hover ">
        <caption><h1>我的工作组</h1></caption>
        <thead>
            <tr>
                <th style="text-align:center;">工作组名称</th>
                <th style="text-align:center;">工作组描述</th>
                <th style="text-align:center;">操作</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="groups" var="group">
                <tr>
                    <td style="text-align:center;"><a href='<s:url action="showGroup"><s:param name="groupID" value="#group.id"/></s:url>'>${group.name}</a></td>                    
                    <td style="text-align:center;">${group.description}</td>                     
                    <td style="text-align:center;">
                        <a href='<s:url action="quitGroup"><s:param name="groupID" value="#group.id"/></s:url>'><input type="button" value="退出"/></a>
                    </td>
                </tr>           
            </s:iterator>
        </tbody>
    </table>
    
</div>
</rapid:override>




<%@include file="../PersonalCenter.jsp"%>
