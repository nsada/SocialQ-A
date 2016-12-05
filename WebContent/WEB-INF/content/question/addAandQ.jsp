<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="head">
	<title>添加题目</title>
</rapid:override>

<rapid:override name="content">
	<%
        String idstr = request.getParameter("qBaseID");
        int qBaseID = Integer.parseInt(idstr);
        out.println("添加题目到"+qBaseID+"号题库");
    %>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="addQuestionPro" method="POST" class="form-horizontal"
				role="form">
				<input type="hidden" name="type" value="3" /> <input type="hidden"
					name="qBaseID" value="<%=qBaseID%>" />
				<div class="form-group">
					<label for="context" class="col-sm-2 control-label">题干</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="aandQ.context" />
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="aandQ.score" />
					</div>
				</div>
				<div class="form-group">
					<label for="ans" class="col-sm-2 control-label">答案</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="aandQ.ans" />
					</div>
				</div>
				<div class="form-group">
					<label for="ans" class="col-sm-2 control-label">解析</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="aandQ.analysis" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">确认添加</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</rapid:override>




<%@include file="../../../base.jsp"%>
