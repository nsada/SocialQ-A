<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
	<title>操作记录</title>
</rapid:override>


<rapid:override name="contentText">
	<div class="col-md-9 column" style = "margin-left: 24px;">
		<button class="btn btn-default" type="button" onclick="window.location.href='delUser">
               删除此用户
        </button> 
		<table class="table table-bordered table-hover ">
			<caption>操作记录</caption>
			<thead>
			</thead>
			<tbody>
				<s:iterator value="logs" var="log">
					<tr>
						<td>${log.trans}</td>
						<td>${log.time}</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>

	</div>
</rapid:override>




<%@include file="../PersonalCenter.jsp"%>
