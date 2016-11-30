<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="head">
	<title>注册</title>
</rapid:override>
<rapid:override name="content">
	<div class="col-md-4 col-sm-8 vertical-center" onload="load_greeting()">
		<h2>请注册:</h2>
		<br />
		<s:set var="age" value="2" />
		<form action="registPro" method="post">
			<div class="form-gruop">
				<label for="name" class="col-sm-2 control-label">name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="请输入用户名"
						name="user.name" id="name" /><br />
				</div>
			</div>
			<div class="form-gruop">
				<label for="password" class="col-sm-2 control-label">password</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="请输入用户密码"
						name="user.password" id="password" /><br />
				</div>
			</div>
			<div class="form-gruop">
				<label for="name" class="col-sm-2 control-label">repeat-password</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="请再次输入用户密码"
						name="rpassword" id="rpassword" /><br />
				</div>
			</div>
			<div class="form-gruop">
				<label for="name" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="请输入邮箱"
						name="user.email" id="email" onChange='check(this.id)' /><br />
				</div>
			</div>
			<button class="btn btn-default btn-primary button-center"
				type="submit">注册</button>
		</form>
	</div>
</rapid:override>
<%@include file="../../../base.jsp"%>
