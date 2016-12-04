<%@page import="tencentApi.globalVar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>



<rapid:override name="head">  
    <title>登录</title>
</rapid:override>  

<rapid:override name="content"> 


<form class="form-horizontal" role="form" action="loginPro" method="post">
	
   	 		 <%if(request.getAttribute("LoginFailed")!=null  ){%>
   	 		 
   	 		 	<div class="form-group  has-success"></div>
  				<div class="form-group  has-success"></div>
  				
   	 		 	<div class="form-group  has-error">
    				<label class="col-sm-2 control-label" for="inputError">Name</label>
   	 				<div class="col-sm-10">
        				<input type="text" class="form-control" id="inputError" name="user.name" placeholder="输入用户名或密码错误">
        			</div>
  				</div>
  				
  				<div class="form-group  has-success"></div>
  				<div class="form-group  has-success"></div>
  				
  				<div class="form-group  has-error">
    				<label class="col-sm-2 control-label" for="inputError">Password</label>
   	 				<div class="col-sm-10">
        				<input type="password" class="form-control" id="inputError" name="user.password" placeholder="输入用户名或密码错误">
    				</div>
  				</div>
  				
        	<%}else{ %>
        	
        		<div class="form-group  has-success"></div>
  				<div class="form-group  has-success"></div>
  				
        		<div class="form-group  has-success">
    				<label class="col-sm-2 control-label" for="inputSuccess">Name</label>
   	 				<div class="col-sm-10">
        				<input type="text" class="form-control" id="inputSuccess" name="user.name" placeholder="请输入用户名">
        			</div>
  				</div>
  				
  				<div class="form-group  has-success"></div>
  				<div class="form-group  has-success"></div>
  				
  				<div class="form-group  has-success">
    				<label class="col-sm-2 control-label" for="inputSuccess">Password</label>
   	 				<div class="col-sm-10">
        				<input type="password" class="form-control" id="inputSuccess" name="user.password" placeholder="请输入密码">
    				</div>
  				</div>
      		<% }%>
      		
      	<div class="form-group  has-success"></div>
  		<div class="form-group  has-success"></div>
  		
  		
  	<div class="form-gruop">
  			<label class="col-sm-2 control-label" for="inputSuccess"></label>
  			<button  class="button button-glow button-border button-rounded button-primary"type="submit">登录</button>
          
            <div style="float: right">
            	<p style="float: left;">第三方登录:</p>
            	<span class="button-wrap">
    <button class="button button-circle button-raised button-primary">
      <i class="fa fa-cloud"></i>
    </button>
  </span>
            	<a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&amp;client_id=101366334&amp;redirect_uri=http%3a%2f%2f127.0.0.1%3a8080%2fSocialQ-A%2fAfterLoginAction.action&amp;state=test&amp;scope=<%=globalVar.scope%>" style="float:left;"> <img width="24" height="24 " src="<%=request.getContextPath()%>/images/tencentLogin.jpg"></a>
            </div>
            
    </div>
    
</form>



</rapid:override>

<%@include file="../../../base.jsp"%> 