<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="head">
	<title>添加题库</title>
</rapid:override>


<rapid:override name="content">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="addQuestionBasePro" class="form-horizontal" role="form">
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">题库名称</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="qBase.title" />
					</div>
				</div>
				<div class="form-group">
					<label for="description" class="col-sm-2 control-label">题库描述</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="qBase.description" />
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
