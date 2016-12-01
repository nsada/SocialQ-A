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
			<a
				href='<s:url action="addQuestion"><s:param name="qBaseID" value="qBase.id"/></s:url>'><input
				type="button" value="添加题目" /></a>
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
						<td><a
							href='<s:url action="showQuestion"><s:param name="questionID" value="#sel.id"/><s:param name="type" value="1"/></s:url>'><input
								type="button" value="展开" /></a></td>
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
						<td><a
							href='<s:url action="showQuestion"><s:param name="questionID" value="#blank.id"/><s:param name="type" value="2"/></s:url>'><input
								type="button" value="展开" /></a></td>
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
                        <td><a
                            href='<s:url action="showQuestion"><s:param name="questionID" value="#aandQ.id"/><s:param name="type" value="3"/></s:url>'><input
                                type="button" value="展开" /></a></td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>		

	</div>
</rapid:override>




<%@include file="../PersonalCenter.jsp"%>
