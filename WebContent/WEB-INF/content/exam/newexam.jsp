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
<title>Welcome Here</title>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigetion">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">SocialQ-A</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse-basepage">
            <ul class="nav navbar-nav">
                <li  id="index"><a href="<%=request.getContextPath()%>/index">主页</a></li>
                <li class = "active" id="InsertExam"><a href="<%=request.getContextPath()%>/InsertExam">我要出题</a></li>
                <li id="add_book"><a href="<%=request.getContextPath()%>/book/addBook">朋友圈</a></li>
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
            top:60px;
            background:white;
            border-style:ridge;
            border-width:3px;
            ">
       
      <form name="myform" action="Paper" method="post">
          
     title: <s:property  value ="title"/> 
     <br>
     description: <s:property  value ="description"/>     
       <br>
     <div align="center" style="width:60%;position:relative;left:20%;">
  	试卷可见性：
		<label class="checkbox-inline">
			<input type="radio" name="joiner" id="optionsRadios3" value="1" checked=""> 试卷仅好友可见
		</label>
		<label class="checkbox-inline">
			<input type="radio" name="joiner" id="optionsRadios4" value="2"> 试卷所有人可见
		</label>
	<br>
 	排名可见性：

		<label class="checkbox-inline">
			<input type="radio" name="rights" id="optionsRadios3" value="1" checked=""> 排名仅好友可见
		</label>
		<label class="checkbox-inline">
			<input type="radio" name="rights" id="optionsRadios4" value="2"> 排名所有人可见
		</label>
	</div>
		<div style = "width:70%;position:relative;left:15%">
		<%int i =1; %>
		<s:iterator value="selections" var="sel">   			
			<p><%=i %>.<s:property value="context"/></p>
			<%i++; %>
			<s:if test = '#sel.num>=1'><p>A:<s:property value = "A"/></p></s:if>
			<s:if test = '#sel.num>=2'><p>B:<s:property value = "B"/></p></s:if>
			<s:if test = '#sel.num>=3'><p>C:<s:property value = "C"/></p></s:if>
			<s:if test = '#sel.num>=4'><p>D:<s:property value = "D"/></p></s:if>
			<s:if test = '#sel.num>=5'><p>E:<s:property value = "E"/></p></s:if>
			<s:if test = '#sel.num>=6'><p>F:<s:property value = "F"/></p></s:if>		
			<a href = '<s:url action="Deletequestion"><s:param name="title" value ="title"/><s:param name="description" value ="description"/><s:param name="ExamID" value ="ExamID"/> <s:param name="type" value ="1"/><s:param name="questionID" value ="id"/></s:url>'> 删除题目 </a>	
		</s:iterator>		
	  </div>
	  
		<br>
		<s:iterator value="textBlanks">   			
	    <s:property value="context"/>
	   <a href = '<s:url action="Deletequestion"><s:param name="title" value ="title"/><s:param name="description" value ="description"/><s:param name="ExamID" value ="ExamID"/> <s:param name="type" value ="2"/><s:param name="questionID" value ="id"/></s:url>'> 删除题目 </a>
       <br>
      </s:iterator>	
      
        <input name="title" type="hidden" value='<s:property  value ="title"/>' /> 
         <input name="description" type="hidden" value='<s:property  value ="description"/>' /> 
        <input name="ExamID" type="hidden" value='<s:property  value ="ExamID"/>' />
        <div>
      		 <a style="float:right" href='<s:url action="deleteexam"><s:param name="ExamID" value ="ExamID"/> </s:url>'> <button type="button">取消编辑试卷</button>  </a>
      		  <a style="float:right" href='<s:url action="updateexam"><s:param name="ExamID" value ="ExamID"/> </s:url>'> <button type="button">提交生成我的试卷</button>  </a>
      		<input style="float:right"  type="button" onclick="insertQ()"  value= "插入题目">
    	 </div>
    </form>
	</div>

</body>

<script type="text/javascript">
	function insertQ() {
		document.myform.action="Find"; 
		document.myform.submit(); 
	}
</script>

</html>