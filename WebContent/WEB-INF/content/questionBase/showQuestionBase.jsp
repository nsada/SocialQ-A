<%@page import="domain.QuestionBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
	<title>题库</title>
</rapid:override>


<rapid:override name="contentText">

	<div class="col-md-10 column">
		<h1>${qBase.title}</h1>
		${qBase.description}

		<div class="text-align:right">
			<select id = "ChooseType">
 				 <option value="xuanze">选择题</option>
  				 <option value="tiankong">填空题</option>
  				 <option value="wenda">问答题</option>	
			</select>
			<button id = "AddQuestion">添加题目</button>
			<%
				QuestionBase qb = (QuestionBase)request.getAttribute("qBase");
				int i = qb.getId();
			%>
			<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.js"></script>
			<script>
				$("#AddQuestion").click(function(){
					var choose = $("#ChooseType").val();
					switch(choose){
						case "xuanze":
								window.location.href = "<%=request.getContextPath()%>/addSelection?qBaseID=<%= i%>";
								break;
						case "tiankong":
							window.location.href = "<%=request.getContextPath()%>/addTextBlank?qBaseID=<%= i%>";
							break;
						case "wenda":
							window.location.href = "<%=request.getContextPath()%>/addAandQ?qBaseID=<%= i%>";
							break;
						default:
							
					}
					
				})
				
				
			
			</script>
			
		</div>
		<table class="table table-bordered table-hover ">
			<caption>单选题</caption>
			<thead>
				<tr>
					<th>题目描述</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="selections" var="sel">
					<tr>
						<td>${sel.context}</td>
						<td>
						  <a href='<s:url action="showQuestion"><s:param name="questionID" value="#sel.id"/><s:param name="type" value="1"/></s:url>'><input
								type="button" value="展开" /></a>
                          <a href='<s:url action="delQbaseQuestion"><s:param name="qBaseID" value="qBase.id"/><s:param name="questionID" value="#sel.id"/><s:param name="type" value="1"/></s:url>'><input
                                type="button" value="删除" /></a>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<table class="table table-bordered table-hover ">
			<caption>填空题</caption>
			<thead>
				<tr>
					<th>题目描述</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="textBlanks" var="blank">
					<tr>
						<td>${blank.context}</td>
						<td>
						  <a href='<s:url action="showQuestion"><s:param name="questionID" value="#blank.id"/><s:param name="type" value="2"/></s:url>'><input
								type="button" value="展开" /></a>
						  <a href='<s:url action="delQbaseQuestion"><s:param name="qBaseID" value="qBase.id"/><s:param name="questionID" value="#blank.id"/><s:param name="type" value="2"/></s:url>'><input
                                type="button" value="删除" /></a>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
        <table class="table table-bordered table-hover ">
            <caption>问答题</caption>
            <thead>
                <tr>
                    <th>题目描述</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <s:iterator value="aandQs" var="aandQ">
                    <tr>
                        <td>${aandQ.context}</td>
                        <td>
                            <a href='<s:url action="showQuestion"><s:param name="questionID" value="#aandQ.id"/><s:param name="type" value="3"/></s:url>'><input
                                type="button" value="展开" /></a>
                          <a href='<s:url action="delQbaseQuestion"><s:param name="qBaseID" value="qBase.id"/><s:param name="questionID" value="#aandQ.id"/><s:param name="type" value="3"/></s:url>'><input
                                type="button" value="删除" /></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>	
        <table class="table table-bordered table-hover ">
            <caption>多选题</caption>
            <thead>
                <tr>
                    <th>题目描述</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <s:iterator value="multys" var="multy">
                    <tr>
                        <td>${multy.context}</td>
                        <td>
                            <a href='<s:url action="showQuestion"><s:param name="questionID" value="#multy.id"/><s:param name="type" value="4"/></s:url>'><input
                                type="button" value="展开" /></a>
                          <a href='<s:url action="delQbaseQuestion"><s:param name="qBaseID" value="qBase.id"/><s:param name="questionID" value="#multy.id"/><s:param name="type" value="4"/></s:url>'><input
                                type="button" value="删除" /></a>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>            	

	</div>
</rapid:override>




<%@include file="../PersonalCenter.jsp"%>
