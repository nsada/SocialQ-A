
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
   <head>
            
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- 引入 Bootstrap -->
      <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/buttons.css">
 	  <script src="https://code.jquery.com/jquery.js"></script>
      <!-- 包括所有已编译的插件 -->
      <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
      <rapid:block name="head">
      	    <title>Bootstrap 模板</title>
      </rapid:block>
   </head>
<%
		String username;
		if (session.getAttribute("username")!=null){
			username = session.getAttribute("username").toString();
		}else{
			username = "";
		}
%>
	



<body style="margin-top: 50px;">
		<div  style="position:absolute; width:100%; height:100%; z-index:-1"> 
			<img style="opacity:0.4;position:fixed;" src="<%=request.getContextPath()%>/images/background.jpg" height="100%" width="100%" /> 
		</div>

	

		<nav class="navbar navbar-default navbar-fixed-top" role="navigation" >
    		<div class="container-fluid">
  				  <div class="navbar-header">
       				
       				 <a class=" navbar-brand" href="<%=request.getContextPath()%>" style="font-size: 40px" >SocialQ-A</a>
   				 </div>
  		  	<div>
        		<ul class="nav navbar-nav navbar-right" style="font-size: 18px">
        		
        			<li style="margin-top: 5px"><a class="color-w link1" href="<%=request.getContextPath()%>/InsertExam">我要出题</a></li>
       				<li style="margin-top: 5px"><a class="color-w link2" href="<%=request.getContextPath()%>/ShowFriends.action">朋友圈</a></li>
       				<li style="margin-top: 5px"><a class="color-w link2" href="https://proofy.io/#features">我要答题</a></li>
       				
       				
       				
					
					<li class="dropdown" style="margin-top: 5px">
               			 <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                   		 		个人中心 <b class="caret"></b>
               			 </a>
               			 <ul class="dropdown-menu">
               			 	<li><a href="<%=request.getContextPath()%>/showPersonalInformation">个人信息</a></li>                    		
                    		<li><a href="<%=request.getContextPath()%>/ShowFriends">好友列表</a></li>
                    		<li><a href='<s:url action="showPersonalInformation"></s:url>'>工作组</a></li>
           
                    		<li><a href='<s:url action="showPersonalInformation"></s:url>'>草稿箱</a></li>
                    		
                    		<li><a href="<%= request.getContextPath()%>/showUserQuestionBases">题库</a></li>
                    		<li><a href='<s:url action="showPersonalInformation"></s:url>'>发布的试卷</a></li>
                    		<li><a href='<s:url action="showPersonalInformation"></s:url>'>答过的试卷</a></li>
                    		<li><a href='<%=request.getContextPath()%>/showUserLogs'>个人动态</a></li>
                		</ul>
           		 	</li>

        			<%if (username==null || username==""){%>
								<li><a href="<%=request.getContextPath()%>/user/regist"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
								<li><a href="<%=request.getContextPath()%>/user/login"><span class="glyphicon glyphicon-log-in"></span>登录</a></li>
					<%}else{%>
								<li style="margin-top: 5px">
									<p class="navbar-text">
										欢迎你&nbsp;&nbsp;<span id="base_name">${sessionScope.username}</span>
									</p>
								</li>
								<li><a href="<%=request.getContextPath()%>/user/logout"><span class="btn btn-login btn-primary hidden-sm hidden-xs f-right">Sign Out</span></a></li>
					<%} %>      		
        		</ul>
    	</div>
    	</div>
	</nav>
	<br />
	<div class="well well-lg container table-center" style="opacity: 0.85;">
		<rapid:block name="content">base_content</rapid:block>
	</div>
	
	<br />
</body>
</html>
