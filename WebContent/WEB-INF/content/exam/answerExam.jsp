<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<title>答题</title>
</head>
<body>

	<div class="row clearfix">
		<div>
			examID:
			<% int examID=Integer.parseInt(request.getParameter("examID")); out.println(examID); %>
			<br /> title: ${exam.title} <br /> description: ${exam.description} <br />
		</div>
		<div class="col-md-12 column">
			<s:iterator value="selections" var="sel">
				试卷可见性： <label class="checkbox-inline"> <input type="radio"
					name="joiner" id="optionsRadios3" value="1" checked="">
					试卷仅好友可见
				</label> <label class="checkbox-inline"> <input type="radio"
					name="joiner" id="optionsRadios4" value="2"> 试卷所有人可见
				</label> <br> 排名可见性： <label class="checkbox-inline"> <input
					type="radio" name="rights" id="optionsRadios3" value="1" checked="">
					排名仅好友可见
				</label> <label class="checkbox-inline"> <input type="radio"
					name="rights" id="optionsRadios4" value="2"> 排名所有人可见
				</label>
			</s:iterator>
		</div>
	</div>
</body>
</html>
