<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Here</title>
</head>
<body >
      <p>点击选择我要插入的题目 </p>
     <table border="1">  
     当前试卷的ID  <s:property  value ="ExamID"/>
     <s:iterator value="selections">   
      <tr>
      <td>  
       <s:property value="context"/>
       <a href = '<s:url action="InsertQuestion"><s:param name="questionID" value ="id"/><s:param name="type" value ="1" /> <s:param name="ExamID" value ="ExamID"/></s:url>'><input type="button" value="添加"/> </a>
       </td>
       </tr>
      </s:iterator>
      </table>
</body>
</html>