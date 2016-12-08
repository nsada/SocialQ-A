<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>   
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="head">  
    <title>我的题库</title>
</rapid:override>  


<rapid:override name="contentText"> 

<div class="col-md-10 column">

    <div class="text-align:right">
	    <button class="btn btn-default" type="button" onclick="window.location.href='addQuestionBase'">
	           创建题库
	    </button> 
    </div>

    <table class="table table-bordered table-hover ">
        <caption><h1>我的题库</h1></caption>
        <thead>
            <tr>
                <th style="text-align:center;">题库名称</th>
                <th style="text-align:center;">题库描述</th>
                <th style="text-align:center;">操作</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="questionBases" var="qBase">
                <tr>
                    <td style="text-align:center;"><a href='<s:url action="showQuestionBase"><s:param name="qBaseID" value="#qBase.id"/></s:url>'>${qBase.title}</a></td>                    
                    <td style="text-align:center;">${qBase.description}</td>                     
                    <td style="text-align:center;">
                        <a href='<s:url action="delQuestionBase"><s:param name="qBase.id" value="#qBase.id"/></s:url>'><input type="button" value="删除"/></a>
                    </td>
                </tr>           
            </s:iterator>
        </tbody>
    </table>
    
</div>
</rapid:override>




<%@include file="../PersonalCenter.jsp"%>
