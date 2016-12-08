
<%@page import="tencentApi.globalVar"%>

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
            <title>base</title>
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

    


		<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style = "z-index: 100" >
    		<div class="container-fluid">
  				  <div class="navbar-header">
       				
       				 <a class=" navbar-brand" href="<%=request.getContextPath()%>" style="font-size: 40px" >SocialQ-A</a>
   				 </div>
  		  	<div>
        		<ul class="nav navbar-nav navbar-left" style="font-size: 18px">
        		
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
                         
                           <li><a href="<%= request.getContextPath()%>/ShowUncomExam">草稿箱</a></li>
                            <li><a href="<%= request.getContextPath()%>/showUserQuestionBases">题库</a></li>
                            <li><a href='<s:url action="showPersonalInformation"></s:url>'>发布的试卷</a></li>
                            <li><a href='<s:url action="showPersonalInformation"></s:url>'>答过的试卷</a></li>
                            <li><a href='<%=request.getContextPath()%>/showUserLogs'>个人动态</a></li>
                        </ul>
                    </li>


        			
        		</ul>
        		<ul class="nav navbar-nav navbar-right" style="font-size: 18px">
        			<%if (username==null || username==""){%>
								<li><a href="<%=request.getContextPath()%>/user/regist"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
								<li><a onclick="showlogin()"><span class="glyphicon glyphicon-log-in"></span>登录</a></li>
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
	
	
	
	<script>
		function showlogin(){
			back = document.getElementById("grayback");
			box = document.getElementById("LoginBox");
			back.style.display="block";
			box.style.display="block";
			return ;
		}
		function killLogin(){
			back = document.getElementById("grayback");
			box = document.getElementById("LoginBox");
			back.style.display="none";
			box.style.display="none";
			return ;
		}
	</script>
	<div id="grayback"style=" display:none;
											POSITION:absolute; 
											left:0; top:0; 
											width:100%; height:100%; 
											background-color:#000; 
											opacity: 0.5;
											z-index: 1000"></div>
	<div id="LoginBox" class="well well-lg"style = "z-index: 2000;
												margin:auto;
												display:none;
												position:absolute;
												left:35%;top:35%;
												width:30%; min-height:200px;
												">    	
    	<form class="form-horizontal" role="form" action="loginPro"  id= "loginform" method="post">
    		<div class="form-group  has-success">	
    			 <a class="button  button-tiny button-caution button-circle button-jumbo" style = "float: right;" onclick="killLogin()">&times;</a>
    		</div>
        		<div class="form-group  has-success">
    				<label class="col-sm-2 control-label" for="inputSuccess">Name</label>
   	 				<div class="col-sm-10">
        				<input id="loginname"type="text" class="form-control" id="inputSuccess" name="user.name" placeholder="请输入用户名">
        			</div>
  				</div>
  				
  		
  				
  				<div class="form-group  has-success">
    				<label class="col-sm-2 control-label" for="inputSuccess">Password</label>
   	 				<div class="col-sm-10">
        				<input id="loginpassword"type="password" class="form-control" id="inputSuccess" name="user.password" placeholder="请输入密码">
    				</div>
  				</div>
  				<div class="form-gruop">
  					<label class="col-sm-2 control-label" for="inputSuccess"></label>
  					<a  onclick="LoginSubmit()"class="button button-glow button-border button-rounded button-primary">登录</a>          
            		<div style="float: right">
            			<p style="float: left;">第三方登录:</p>
            			<a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&amp;client_id=101366334&amp;redirect_uri=http%3a%2f%2f127.0.0.1%3a8080%2fSocialQ-A%2fAfterLoginAction.action&amp;state=test&amp;scope=<%=globalVar.scope%>" style="float:left;"> <img width="24" height="24 " src="<%=request.getContextPath()%>/images/tencentLogin.jpg"></a>
            		</div>
            
    			</div>
    		</form>
    		<script>
    			function LoginSubmit(){
    				var form = document.getElementById("loginform");
					
    				/*
    				var loginName = document.getElementById("loginname");
					var loginNameMatchResult =loginName.value.match(/[a-zA-z0-9]+@[a-zA-z0-9]+.com/g);
					if(loginNameMatchResult==null || loginNameMatchResult[0].length !=loginName.value.length){
						alert("您的用户名格式输入错误！");
						return ;
					}
					var loginPassword = document.getElementById("loginpassword");
					if(loginPassword==null||loginPassword.value==""){
						alert("输入的密码不能为空！");
						return ;
					}
					*/	
				
					
					var new_input = document.createElement("input");
					new_input.name="redirect_url";
					new_input.value = window.location.href;
					new_input.style.display="none";
					form.appendChild(new_input);
					form.submit();
					return ;
    			}
    					
    		
    		
    		</script>
    </div>

	<div class="well well-lg container table-center" style="opacity: 0.85;">
		<rapid:block name="content">base_content</rapid:block>
	</div>
	
	<br />

</body>
</html>