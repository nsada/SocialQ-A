<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">  
    <title>我的消息</title>
</rapid:override>  


<rapid:override name="content">
    <table class="table table-bordered table-hover ">
        <caption><h1>所有消息</h1></caption>
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
                        </td>
                    </s:if>      
                    <s:elif test="type == 3">
                        <td>
                            已批改
                        </td>
                    </s:elif>       
                    <s:elif test="type == 4">
                        <td style="text-align:center;">
                            <button><a href="${mes.url}">查看给分</a></button> 
                        </td>
                    </s:elif>                        
                    <s:else>
                       <td>
                       已读
                       </td>
                    </s:else> 
                    
                </tr>           
            </s:iterator>
        </tbody>
    </table>
</rapid:override>
<%@include file="../../../base.jsp"%>