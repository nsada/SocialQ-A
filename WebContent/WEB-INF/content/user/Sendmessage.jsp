<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Send a message</title>
</head>
<body  style="background-color:orange;">
     <br> </br>
    <p> Send TMY2 A Message</p>
    <s:form action="Sendmessage" method="post">
        <s:textfield name="accepterID"/> 
        <s:textfield name="message"/> 
        <s:submit value="Input Author Name"/>
    </s:form>
     
         
</body>
</html>