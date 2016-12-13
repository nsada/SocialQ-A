<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="head">
	<title>个人信息</title>
</rapid:override>


<rapid:override name="content">
	<div class="col-md-10 column">
		<h2>基本信息</h2>
		<p>用户名: ${sessionScope.username}</p>
		<p>
			<a class="btn" href="#">View details »</a>
		</p>
                        <div style="float: right">
                            <p style="float: left;">绑定QQ账号:</p>                  
<%--                            <a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&amp;client_id=101366334&amp;redirect_uri=http%3a%2f%2fsocialqanda.applinzi.com%2fAfterLoginAction.action&amp;state=test&amp;scope=<%=globalVar.scope%>" style="float:left;"> <img width="24" height="24 " src="<%=request.getContextPath()%>/images/tencentLogin.jpg"></a> --%>
                            <a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&amp;client_id=101366334&amp;redirect_uri=http%3a%2f%2f127.0.0.1%3a8080%2fSocialQ-A%2fAfterLoginAction.action&amp;state=test&amp;scope=<%=globalVar.scope%>" style="float:left;"> <img width="24" height="24 " src="<%=request.getContextPath()%>/images/tencentLogin.jpg"></a>
                        </div>

	</div>
</rapid:override>



<%@include file="../../../base.jsp"%>
