
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">
	<title>个人信息</title>
	<script>
        function ShareToWeibo(url){
            a = '<%=session.getAttribute("openid")%>';
            if(a == "null")
                alert("您还没有绑定微博账号，请前往个人中心绑定。");
            else
                window.location.href = url;
        }
    </script>
</rapid:override>


<rapid:override name="contentWithoutWhiteBox">
	<div class=" column container table-center well well-lg" style = "width: 50%;position: relative;top: 30px;">
		<h2>基本信息</h2>
		<p>用户名: ${user.name}</p>
		<p>邮箱：${user.mail}</p>
		                <div style="position: relative;left: 80%">
                            <p >
                            	绑定QQ账号:
                            	<a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&amp;client_id=<%=globalVar.AppID %>&amp;redirect_uri=<%=globalVar.redirect_URI %>&amp;state=test&amp;scope=<%=globalVar.scope%>"> <img width="24" height="24 " src="<%=request.getContextPath()%>/images/tencentLogin.jpg"></a>
                            </p>                  
                            
                        </div>
        <div class="panel panel-info">
            <div class="panel-heading">发布过的所有测试</div>
                <div class="panel-body">
                    <div class="list-group">

                        <s:iterator value="PublishedExams">
	                        <p>
	                                                标题：<s:property value="title" /> <br>
	                                                描述：<s:property value="description" />
	                        </p>
                            <a  class="button button-primary button-rounded button-small" 
                            href='<s:url action="FindExamInfor"><s:param name="ExamID" value ="id"/></s:url>'>
                                                    查看详情
                            </a>
                            <button     
                                            class="button button-action button-rounded button-small"
                                            onclick = "ShareToWeibo('<%=request.getContextPath()%>/ShareToWeibo?ExamID=${id}')">
                            
                                                    分享到微博
                            </button>
                        </s:iterator>

                    </div>
                </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">回答过的所有测试</div>
                <div class="panel-body">
                    <div class="list-group">

                        <s:iterator value="AnsweredExams">
                            <p>
                                                    标题：<s:property value="title" /> <br>
                                                    描述：<s:property value="description" />
                            </p>
                            <a  class="button button-primary button-rounded button-small" 
                            href='<s:url action="ShowExamDetail"><s:param name="ExamID" value ="id"/></s:url>'>
                                                    查看详情
                            </a>
                        </s:iterator>

                    </div>
                </div>
        </div>        
	</div>
</rapid:override>



<%@include file="../../../base.jsp"%>
