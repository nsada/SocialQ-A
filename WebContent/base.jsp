
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
        session.setMaxInactiveInterval(300*3600);
%>
    




<body style="margin-top: 55px;">
        <div  style="position:absolute; width:100%; height:100%; z-index:-1"> 
            <img style="opacity:1.0;position:fixed;" src="<%=request.getContextPath()%>/images/34.jpg" height="100%" width="100%" /> 

        </div>



		<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style = "z-index: 100;margin: 0;height: 55px;" >
    		<div class="container-fluid">
  				  <div class="navbar-header">
       				
       				 <a class=" navbar-brand" href="<%=request.getContextPath()%>" style="font-size: 40px" >FunnyQ-A</a>
   				 </div>
  		  	<div>
  		  	<%if ( !( username==null || username.equals("") ) ){%>
        		<ul class="nav navbar-nav navbar-left" style="font-size: 18px">
        			<li style="margin-top: 5px"><a class="color-w link1" onclick = "ConfirmToInsertExam()">我要出题</a></li>
        				<script>
        					function ConfirmToInsertExam(){
        						if(confirm("请确定您的题库已编辑完善，否则请点击“取消”，继续完善题库。")==true)
        							window.location.href = "<%=request.getContextPath()%>/InsertExam"
        					}
        				</script>
        				
       				<li style="margin-top: 5px"><a class="color-w link2" href="<%=request.getContextPath()%>/WantAnswerExam">我要答题</a></li>
       				<li style="margin-top: 5px"><a class="color-w link1" href="<%=request.getContextPath()%>/showUserGroups">工作组</a></li>
                    <li style="margin-top: 5px"><a class="color-w link2" href="<%=request.getContextPath()%>/ShowFriendsEvents">朋友圈</a></li>
                    <li style="margin-top: 5px"><a class="color-w link2" href="<%=request.getContextPath()%>/ShowUserMessage.action">我的消息</a></li>
       				
       				
					

					<li class="dropdown" style="margin-top: 5px">
               			 <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                   		 		个人中心 <b class="caret"></b>
               			 </a>
               			 <ul class="dropdown-menu">
               			 	<li><a href="<%=request.getContextPath()%>/showPersonalInformation">个人信息</a></li>        
               			 	<li><a href="<%=request.getContextPath()%>/showFriends">好友列表</a></li>
<%--                     		<li><a href="<%=request.getContextPath()%>/showUserGroups">工作组</a></li> --%>
                           <li><a href="<%= request.getContextPath()%>/ShowUncomExam">草稿箱</a></li>
                            <li><a href="<%= request.getContextPath()%>/showUserQuestionBases">题库</a></li>
<%--                              <li><a href="<%= request.getContextPath()%>/FindUserAnsweredExams">查看小伙伴答题情况</a></li>     --%>      
                            <li><a href="<%= request.getContextPath()%>/FindUserExams">批改试卷</a></li>
                            <li><a href="<%= request.getContextPath()%>/showPersonalEvents">个人动态</a></li>      
                            
                        </ul>
                    </li>
        		</ul>
        	<%} %>
        		<ul class="nav navbar-nav navbar-right" style="font-size: 18px">
        			<%if (username==null || username.equals("")){%>
								<li><a onclick = "showbox('regist')"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
								<li><a onclick="showbox('login')"><span class="glyphicon glyphicon-log-in"></span>登录</a></li>
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
		function showbox(status){
			back = document.getElementById("grayback");
			back.style.display="block";
			box = document.getElementById("LoginBox");
			box.style.display="block";
			switch (status){
				case "regist": 
					SwitchBoxStatusToRegist();
					break;
				default:
					SwitchBoxStatusToLogin();
					break;
			}
			return ;
		}
		function killbox(){
			back = document.getElementById("grayback");
			box = document.getElementById("LoginBox");
			back.style.display="none";
			box.style.display="none";
			return ;
		}
		function SwitchBoxStatusToLogin(){
			var registform = document.getElementById("registform");
			registform.style.display = "none";
			var loginform =  document.getElementById("loginform");
			loginform.style.display = "block";
			var status = document.getElementById("statusLogin");
			status.className = "button button-pill button-primary active";
			status = document.getElementById("statusRegist");
			status.className="button button-pill button-primary";
			return ;
		}
		function SwitchBoxStatusToRegist(){
			var registform = document.getElementById("registform");
			registform.style.display = "block";
			var loginform =  document.getElementById("loginform");
			loginform.style.display = "none";
			var status = document.getElementById("statusLogin");
			status.className = "button button-pill button-primary";
			status = document.getElementById("statusRegist");
			status.className="button button-pill button-primary active";
			return ;
		}
	</script>
	<div id="grayback"style=" display:none;
											POSITION:absolute; 
											left:0; top:0; 
											width:200%; height:200%; 
											background-color:#000; 
											opacity: 0.5;
											z-index: 1000"></div>
	<div id="LoginBox" class="well well-lg"
								style = "z-index: 2000;
												margin:auto;
												display:none;
												position:absolute;
												left:35%;top:35%;
												width:30%; min-height:200px;
												">    	
												
		<div class="button-group">
    		<button onclick="SwitchBoxStatusToLogin()"type="button" id="statusLogin" class="button button-pill button-primary ">登录</button>
    		<button onclick="SwitchBoxStatusToRegist()"type="button" id="statusRegist" class="button button-pill button-primary">注册</button>
  		</div>
  		<a class="button  button-tiny button-caution button-circle button-jumbo" style = "float: right;" onclick="killbox()">
			<span class="glyphicon glyphicon-remove"></span>
		</a>
  		
  		<p><br></p>
  		
  		<br>
  		
    	<form class="form-horizontal" role="form" action="loginPro"  id= "loginform" method="post">
    		
        		<div class="form-group  has-success">
    				<label class="col-sm-2 control-label" for="inputSuccess">Name</label>
   	 				<div class="col-sm-10">
        				<input id="loginname"type="text" class="form-control" id="inputSuccess" name="user.name" placeholder="请输入用户名">
        			</div>
  				</div>
  				
  				<p><br></p>
  		
  				
  				<div class="form-group  has-success">
    				<label class="col-sm-2 control-label" for="inputSuccess">Password</label>
   	 				<div class="col-sm-10">
        				<input id="loginpassword"type="password" class="form-control" id="inputSuccess" name="user.password" placeholder="请输入密码">
    				</div>
  				</div>
  				
  				<p><br></p>
  				
  				<div class="form-group">
  					<label class="col-sm-2 control-label" for="inputSuccess"></label>
  					<div class="col-sm-10">
  						<a  onclick="LoginSubmit()"class="button button-glow button-border button-rounded button-primary">登录</a>          
  						<div style="float: right">
            				<p style="float: left;">第三方登录:</p>  	
            				<a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=<%=globalVar.AppID %>&redirect_uri=<%=globalVar.redirect_URI %>&state=tst&scope=<%=globalVar.scope%>" style="float:left;"> <img width="24" height="24 " src="<%=request.getContextPath()%>/images/tencentLogin.jpg"></a>
          				

            			</div>
  					</div>
  					
            		

    			</div>
    		</form>
    		<form class="form-horizontal" role="form" action="registPro"  id= "registform" method="post">
    		
        		<div class="form-group  has-success">
    				<label class="col-sm-2 control-label" for="inputSuccess">Name</label>
   	 				<div class="col-sm-10">
        				<input id="registName"type="text" class="form-control" id="inputSuccess" name="user.name" placeholder="请输入用户名">
        			</div>
  				</div>
  				
  				<p><br></p>
  		
  				
  				<div class="form-group  has-success">
    				<label class="col-sm-2 control-label" for="inputSuccess">Password</label>
   	 				<div class="col-sm-10">
        				<input id="registPassword"type="password" class="form-control" id="inputSuccess" name="user.password" placeholder="请输入密码">
    				</div>
  				</div>
  				
  				<p><br></p>
  				
  				<div class="form-group  has-success">
    				<label class="col-sm-2 control-label" for="inputSuccess">Repeat</label>
   	 				<div class="col-sm-10">
        				<input id="registPasswordAgain"type="password" class="form-control" id="inputSuccess" placeholder="请再次输入密码">
    				</div>
  				</div>
  				
  				<p><br></p>
  				
  				<div class="form-group  has-success">
    				<label class="col-sm-2 control-label" for="inputSuccess">Email</label>
   	 				<div class="col-sm-10">
        				<input id="registEmail"type="text" class="form-control" id="inputSuccess" name="user.mail" placeholder="请输入电子邮箱">
    				</div>
  				</div>
  				
  				<p><br></p>
  				
  				<div class="form-group">
  					<label class="col-sm-2 control-label" for="inputSuccess"></label>
  					<div class="col-sm-10">
  						<a  onclick="RegistSubmit()"class="button button-glow button-border button-rounded button-primary">注册</a>          
  					</div>
    			</div>
    		</form>
    		
    		<script>
    			$(document).ready(function(){
    				var login_result= "<%=request.getParameter("login_result")%>" ;
    				var regist_result="<%=request.getParameter("regist_result")%>" ;
    				ShowAlert(login_result,regist_result);
    				
    			})
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
					new_input.style.display = "none";
					new_input.name="redirect_url";
					var url = window.location.href.split('?');
					if(url.length ==1){
						new_input.value = url[0];
						form.appendChild(new_input);
						form.submit();
						return ;
					}
					p = url[1].split("&");
					url = url[0];
					wenhao = false;
					for(i = 0;i < p.length;i++){
						if(p[i].indexOf("login_result")>=0||p[i].indexOf("regist_result")>=0)
							continue;
						else{
							if(wenhao ==false){
								wenhao = true;
								url += '?'+p[i];
							}
							else{
								url += "&"+p[i];
							}
						}
					}
					new_input.value = url;
					form.appendChild(new_input);
					form.submit();
					return ;
    			}
    			
    			
    			function 	RegistSubmit(){
    				var registName = $("#registName")[0]
    				var registPassword = $("#registPassword")[0]
    				var registPasswordAgain  =$("#registPasswordAgain")[0]
    				var registEmail = $("#registEmail")[0];
    				if(registName.value == ""){
    					alert("输入的用户名为空！");
    					return ;
    				}
    				if(registPassword.value == ""){
    					alert("输入的密码为空！");
    					return ;
    				}
    				if(registPassword.value != registPasswordAgain.value){
    					alert("两次输入的密码不一致！");
    					return ;
    				}
    				if(registEmail.value == ""){
    					alert("输入的邮箱为空！");
    					return ;
    				}
    				var registEmailMatchResult =registEmail.value.match(/[a-zA-z0-9]+@[a-zA-z0-9]+.com/g);
					if(registEmailMatchResult==null || registEmailMatchResult[0].length !=registEmail.value.length){
						alert("您的邮箱格式存在错误！");
						return ;
					}
					form = $("#registform")[0];
					var new_input = document.createElement("input");
					new_input.name="redirect_url";
					new_input.value = window.location.href.split('?')[0];
					new_input.style.display="none";
					form.appendChild(new_input);
					form.submit();
					return ;
    			}
    		</script>
    </div>
    
    <div 	id="alertBox"   
    		style="display: none;"
    		class="alert alert-success" 
    		role="alert">
    		<p  style="
    			text-align: center;
   			    margin: 0;">
   			    <span id="alertMessage">你是不是傻</span>
   			    <span onclick="KillAlert()"class="glyphicon glyphicon-remove" style="float: right;"></span>
			</p>
			<script type="text/javascript">
				function KillAlert(){
					$("#alertBox").slideUp("slow");
				}
				
				function ShowAlert(login_result,regist_result){
					var box = $("#alertBox")[0];
					switch(login_result){
						case "0":
							$("#alertMessage")[0].innerHTML="登陆成功";
							box.className="alert alert-success";
							$("#alertBox").slideDown("slow");
							break;
						case "1":
							$("#alertMessage")[0].innerHTML="用户名和密码不匹配";
							box.className="alert alert-danger";
							$("#alertBox").slideDown("slow");
							break;
						case "2":
							$("#alertMessage")[0].innerHTML="用户名不存在";
							box.className="alert alert-warning";
							$("#alertBox").slideDown("slow");
							break;
						default:
					}
					switch(regist_result){
						case "0":
							$("#alertMessage")[0].innerHTML="注册成功";
							box.className="alert alert-success";
							$("#alertBox").slideDown("slow");
							break;
						case "1":
							$("#alertMessage")[0].innerHTML="用户名已存在";
							box.className="alert alert-danger";
							$("#alertBox").slideDown("slow");
							break;
						default:
							break;
					}
					return;
				}
				
			</script>
    </div>
    
    <rapid:block name="contentWithoutWhiteBox">
    	<div class="well well-lg container table-center" style="opacity: 0.85;position: relative;top: 50px;">
			<rapid:block name="content">base_content</rapid:block>
		</div>
    </rapid:block>
	
	
	
	
	<br />

</body>
</html>