
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Here</title>
</head>
<body>
	<p>点击选择我要插入的题目</p>
	当前试卷的ID
	<s:property value="ExamID" />
	<table border="1">
		<s:iterator value="selections">
			<tr>
				<td><s:property value="context" /> <a
					href='<s:url action="InsertQuestion"><s:param name="questionID" value ="id"/><s:param name="type" value ="1" /> <s:param name="ExamID" value ="ExamID"/></s:url>'><input
						type="button" value="添加" /> </a></td>
			</tr>
		</s:iterator>
	</table>


	<table border="2">
		<s:iterator value="textBlanks">
			<tr>
				<td><s:property value="context" /> <a
					href='<s:url action="InsertQuestion"><s:param name="questionID" value ="id"/><s:param name="type" value ="2" /> <s:param name="ExamID" value ="ExamID"/></s:url>'><input
						type="button" value="添加" /> </a></td>
			</tr>
		</s:iterator>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Here</title>
</head>
<body>
	<p>点击选择我要插入的题目</p>
	当前试卷的ID
	<s:property value="ExamID" />
	<table border="1">
		<s:iterator value="selections">
			<tr>
				<td><s:property value="context" /> <a
					href='<s:url action="InsertQuestion"><s:param name="questionID" value ="id"/><s:param name="type" value ="1" /> <s:param name="ExamID" value ="ExamID"/></s:url>'><input
						type="button" value="添加" /> </a></td>
			</tr>
		</s:iterator>
	</table>


	<table border="2">
		<s:iterator value="textBlanks">
			<tr>
				<td><s:property value="context" /> <a
					href='<s:url action="InsertQuestion"><s:param name="questionID" value ="id"/><s:param name="type" value ="2" /> <s:param name="ExamID" value ="ExamID"/></s:url>'><input
						type="button" value="添加" /> </a></td>
			</tr>
		</s:iterator>
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
	</table>
	<table border="2">
		<s:iterator value="AandQs">
			<tr>
				<td><s:property value="context" /> <a
					href='<s:url action="InsertQuestion"><s:param name="questionID" value ="id"/><s:param name="type" value ="3" /> <s:param name="ExamID" value ="ExamID"/></s:url>'><input
						type="button" value="添加" /> </a></td>
			</tr>
		</s:iterator>
	</table>
	<table border="2">
		<s:iterator value="multys">
			<tr>
				<td><s:property value="context" /> <a
					href='<s:url action="InsertQuestion"><s:param name="questionID" value ="id"/><s:param name="type" value ="4" /> <s:param name="ExamID" value ="ExamID"/></s:url>'><input
						type="button" value="添加" /> </a></td>
			</tr>
		</s:iterator>
	</table>
	
<<<<<<< HEAD
	
</body>
=======
	
</body>
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8

</html>