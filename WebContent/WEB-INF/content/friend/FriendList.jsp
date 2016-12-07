<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8"> 
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%
        String username;
        if (session.getAttribute("username")!=null){
            username = session.getAttribute("username").toString();
        }else{
            username = "";
        }
    %>
<title>好友列表</title>
<style type="text/css">
    * {margin: 0; padding: 0;} 
    div.biao { 
        margin: 20px; 
        } 
    ul.biao { 
    
        list-style-type: none; 
        width: 100%; 
        } 
    h3.biao { 
        font: bold 20px/1.5 Helvetica, Verdana, sans-serif; 
        } 
    button.biao{
        float:right;
    }
    img.biao { 
        float: left; 
        margin: 0 15px 0 0; 
        width:100px;
        height:100px
        } 
        p.biao { 
            font: 200 12px/1.5 Georgia, Times New Roman, serif; 
        } 
    li.biao { 
        padding: 10px; 
        overflow: auto; 
    } 
    li:hover { 
        background: #eee; 
        cursor: pointer; 
        }
    
    </style>
</head>

<body >
    <div  style="position:absolute; width:100%; height:100%; z-index:-1"> 
        <img style="position:fixed;" src="<%=request.getContextPath()%>/images/background.jpg" height="100%" width="100%" /> 
    </div>
    <nav class="navbar navbar-default navbar-fixed-top" role="navigetion">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">SocialQ-A</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-basepage">
            <ul class="nav navbar-nav">
                <li  id="index"><a href="<%=request.getContextPath()%>/index">主页</a></li>
                <li  id="InsertExam"><a href="<%=request.getContextPath()%>/InsertExam">我要出题</a></li>
                <li id="add_book" class = "active"><a href="<%=request.getContextPath()%>/book/addBook">朋友圈</a></li>
                <li id="showPersonalCenter"><a href="<%=request.getContextPath()%>/user/showPersonalCenter">个人中心</a></li>      
            </ul>
            <ul class="nav navbar-nav navbar-right">

                <%if (username==null || username==""){%>
                    <li><a href="<%=request.getContextPath()%>/user/regist">注册</a></li>
                    <li><a href="<%=request.getContextPath()%>/user/login">登录</a></li>                              
                <%}else{%>
                    <li><p class="navbar-text">欢迎你&nbsp;&nbsp;<span id="base_name">${sessionScope.username}</span></p></li>
                    <li><a href="<%=request.getContextPath()%>/user/logout">注销</a></li>
                <%}%>
            </ul>
        </div>
        </div>
    </nav>
    <div style="width:60%;
            position:absolute;
            left:20%;
            top:100px;
            background:white;
            ">
            <form action="searchUser" method="POST" class="form-horizontal" role="form">
                <div class="form-group">
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="searchname" />
                    </div>
                    <div class="col-sm-4">
                        <button type="submit" class="btn btn-default">搜索用户</button>
                    </div>
                    <div class="col-sm-2"></div>
                </div>
            </form>      
            <div>
                <s:iterator value="users">        
                    <li class = "searchuser"> 
                        <s:property value="name"/>
                        <button class="btn btn-default " type="button"
                        onclick="window.location.href='addFriend?friendID=2'">添加为好友</a>
                    </li>               
                        
                </s:iterator>
            </div>
            <h2 style = "position:relative;left:2.5%">本地好友 </h2>
            <div class ="biao"> 
                <ul class = "biao"> 
                    <s:iterator value="friends">        
                        <li class = "biao"> 
                            <img class = "biao" src="<%=request.getContextPath()%>/images/background.jpg"/> 
                            <h3 class = "biao"><s:property value="nameB"/></h3> 
                            <button class = "biao">删除该好友</button>
                        </li>               
                            
                    </s:iterator>
                    
                </ul> 
            </div>
            <h2 style = "position:relative;left:2.5%">微博粉丝 </h2>
            <div class ="biao"> 
                <ul class = "biao"> 
                    <s:iterator value="weibofriends">           
                        <li class = "biao"> 
                            <img class = "biao" src="<%=request.getContextPath()%>/images/background.jpg"/> 
                            <h3 class = "biao"><s:property value="B"/></h3>
                            <button class = "biao">邀请该好友</button>
                        </li>               
                            
                    </s:iterator>
                    
                </ul> 
            </div>
    </div>

</body>



</html>