<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  

<rapid:override name="head">  
    <title>查看题目</title>
</rapid:override>  

<rapid:override name="content"> 
    <%
        String idstr = request.getParameter("qBaseID");
        int qBaseID = Integer.parseInt(idstr);
        int qID = Integer.parseInt(request.getParameter("qID"));
        out.println("查看"+qBaseID+"号题库的"+qID+"号题目");
    %>
    <div class="text-align:right">
        <a href='<s:url action="updateQuestion"><s:param name="qID" value="qID"/></s:url>'><input type="button" value="编辑"/></a>
    </div>
    <div>
        ${sel.context}
        <table class="table table-bordered table-hover ">
	        <tbody>
	            <tr>              
		            <td>${sel.A}</td>
		            <td>${sel.B}</td>
		            <td>${sel.C}</td>
		            <td>${sel.D}</td>
	            </tr>
	        </tbody>
        </table>
        ${sel.analysis}
    </div>

</rapid:override>




<%@include file="../../../base.jsp"%>  