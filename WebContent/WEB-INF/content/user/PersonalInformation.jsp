<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="head">
	<title>个人信息</title>
</rapid:override>


<rapid:override name="contentWithoutWhiteBox">
	<div class=" column container table-center well well-lg" style = "width: 50%;position: relative;top: 30px;">
		<h2>基本信息</h2>
		<p>用户名: ${sessionScope.username}</p>

                        <div style="float: right">
                            <p style="float: left;">绑定QQ账号:</p>                  
                          	<a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&amp;client_id=<%=globalVar.AppID %>&amp;redirect_uri=<%=globalVar.redirect_URI %>&amp;state=test&amp;scope=<%=globalVar.scope%>" style="float:left;"> <img width="24" height="24 " src="<%=request.getContextPath()%>/images/tencentLogin.jpg"></a>
               			</div>
	</div>
</rapid:override>



<%@include file="../../../base.jsp"%>
