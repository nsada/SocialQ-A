<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>   
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="head">  
    <title>题库</title>
</rapid:override>  


<rapid:override name="contentText"> 

<div class="col-md-10 column">
    <h1>${qBase.title}</h1>
    ${qBase.description}
    
    <div class="text-align:right">
        <a href='<s:url action="addQuestion"><s:param name="qBaseID" value="qBase.id"/></s:url>'><input type="button" value="添加题目"/></a>
    </div>
    <table class="table table-bordered table-hover ">
        <caption>操作记录</caption>
        <thead>

        </thead>
        <tbody>
            <s:iterator value="logs" var="log">
                <tr>                 
                    <td>${log.trans}</td>
                </tr>           
            </s:iterator>
        </tbody>
    </table>
    
</div>
</rapid:override>




=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>   
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="head">  
    <title>题库</title>
</rapid:override>  


<rapid:override name="contentText"> 

<div class="col-md-10 column">
    <h1>${qBase.title}</h1>
    ${qBase.description}
    
    <div class="text-align:right">
        <a href='<s:url action="addQuestion"><s:param name="qBaseID" value="qBase.id"/></s:url>'><input type="button" value="添加题目"/></a>
    </div>
    <table class="table table-bordered table-hover ">
        <caption>操作记录</caption>
        <thead>

        </thead>
        <tbody>
            <s:iterator value="logs" var="log">
                <tr>                 
                    <td>${log.trans}</td>
                </tr>           
            </s:iterator>
        </tbody>
    </table>
    
</div>
</rapid:override>




>>>>>>> LSY
<%@include file="../PersonalCenter.jsp"%>  