<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Accept a message</title>
</head>
<body  style="background-color:orange;">
     <br> </br>
    <p> Send TMY2 A Message</p>
    The number of unread message: <s:property value ="unread"/>
     <table border="1">
     <s:iterator value="messages" var= "mess">   
      <tr>
		${mess.message } </br>
		${mess.date }
      <td>  
       </td>
       </tr>
      </s:iterator>
      </table>
         
</body>
</html>