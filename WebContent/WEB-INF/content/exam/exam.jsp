<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Here</title>
</head>
<body  style="background-color:orange;">
        
        
         <table border="1">  
     当前题目的ID  <s:property  value ="ExamID"/>
     <s:iterator value="selections">   
      <tr>
      <td>  
      <s:property value="context"/>
       </td>
       </tr>
      </s:iterator>
      </table>         
      <form name="myform" action="Paper" method="post">
             <br>
       <input name="title" type="text" placeholder="这里标题" size="22"  required / /> 
       <input name="description" type="text" placeholder="描述" size="22"  required //> 
       <input name="ExamID" type="hidden" value='<s:property  value ="ExamID"/>' />
        <a href = '<s:url action="Find"><s:param name="ExamID" value ="ExamID"/> </s:url>'> 插入题目 </a>
       <input type="button" onclick="updateexam()" value="提交生成我的试卷"/>
    </form>
</body>
<script type="text/javascript">
	function updateexam() {
		document.myform.action="updateexam"; 
		document.myform.submit(); 
	}
</script>
</html>