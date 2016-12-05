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
				<input type="hidden" name="type" value="2" /> <input type="hidden"
					name="qBaseID" value="<%=qBaseID%>" />
				<div class="form-group">
					<label for="context" class="col-sm-2 control-label">题干</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="textBlank.context" />
					</div>
					<label for="context" class="col-sm-2 control-label">分数</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="textBlank.score" />
					</div>
				</div>
				<div class="form-group">
					<label for="num" class="col-sm-2 control-label">填空个数</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.num" />
					</div>
				</div>
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">空1</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.A" />
					</div>
				</div>
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">空2</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.B" />
					</div>
				</div>
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">空3</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.C" />
					</div>
				</div>
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">空4</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.D" />
					</div>
				</div>
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">空5</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.E" />
					</div>
				</div>
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">空6</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.F" />
					</div>
				</div>
				<div class="form-group">
					<label for="ans" class="col-sm-2 control-label">解析</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="textBlank.analysis" />
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
