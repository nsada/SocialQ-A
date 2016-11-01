<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  

<rapid:override name="head">  
    <title>登录</title>
</rapid:override>  
<rapid:override name="content"> 
<div class="col-md-4 col-sm-8 vertical-center">
    <h2>请登录:</h2>
    <br/>
    <form role="form" action="loginPro" method="post">
        <div class="form-gruop">
            <label for="name" class="col-sm-2 control-label">name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control"  placeholder="请输入用户名" name="user.name"/><br/>
            </div>
        </div>
        <div class="form-gruop">
            <label for="password" class="col-sm-2 control-label">password</label>
            <div class="col-sm-10">
                <input type="text" class="form-control"  placeholder="请输入用户密码" name="user.password"/><br/>
            </div>
        </div>
        <button class="btn btn-default btn-primary button-center" type="submit">登录</button> 
    </form>
</div>
</rapid:override>
<%@include file="../../../base.jsp"%> 