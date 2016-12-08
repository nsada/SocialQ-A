<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">  
    <title>我的消息</title>
</rapid:override>  


<rapid:override name="content">
    <table class="table table-bordered table-hover ">
        <caption><h1>未处理消息</h1></caption>
        <thead>
            <tr>
                <th style="text-align:center;">消息内容</th>
                <th style="text-align:center;">操作</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="messages" var="mes">
                <tr>
                    <td style="text-align:center;">${mes.message}</td>      
                    <s:if test="type == 1">
                        <td style="text-align:center;">                            
                            <button><a href="${mes.url}">查看用户详细信息</a></button>
                            <a href='<s:url action="acceptFriendApply"><s:param name="A" value ="#mes.senderID"/><s:param name="messageID" value ="#mes.id"/></s:url>'><input type="button" value="通过申请"/></a>
                        </td>
                    </s:if>      
                    <s:if test="type == 3">
                        <td style="text-align:center;">
                            <a href='<s:url action="#mes.url"></s:url>'><input type="button" value="前去批改"/></a>
                        </td>                        
                    </s:if>         
                    <s:if test="type == 4">
                        <td style="text-align:center;">
                            <a href='<s:url action="#mes.url"></s:url>'><input type="button" value="查看"/></a>
                        </td>                        
                    </s:if> 
                   
                </tr>           
            </s:iterator>
        </tbody>
        <button><a href="showUserAllMessage">所有消息</a></button>
    </table>
</rapid:override>

<%@include file="../../../base.jsp"%>