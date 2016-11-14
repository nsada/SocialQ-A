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
<title>Welcome Here</title>
</head>
<body>
        
        
         <table border="1">  
     当前考试的ID  <s:property  value ="ExamID"/>
     <s:iterator value="selections">   
      <tr>
      <td>  
       <s:property value="context"/> 
       <a href = '<s:url action="Deletequestion"><s:param name="ExamID" value ="ExamID"/> <s:param name="type" value ="1"/><s:param name="questionID" value ="id"/></s:url>'> 删除题目 </a>
       </td>
       </tr>
      </s:iterator>
      </table>         
      
       
      <form name="myform" action="Paper" method="post">
             <br>
       <input name="title" type="text" placeholder="这里标题" size="20"  required / /> 
       <br>
       <br>
       <br>
       <input name="description" type="text" placeholder="描述" size="50"  required //> 
       <br>
     <div>
	<label class="checkbox-inline">
		<input type="radio" name="joiner" id="optionsRadios3" value="1" checked> 试卷仅好友可见
	</label>
	<label class="checkbox-inline">
		<input type="radio" name="joiner" id="optionsRadios4"  value="2"> 试卷所有人可见
	</label>
</div>
 
<div>
	<label class="checkbox-inline">
		<input type="radio" name="rights" id="optionsRadios3" value="1" checked> 排名仅好友可见
	</label>
	<label class="checkbox-inline">
		<input type="radio" name="rights" id="optionsRadios4"  value="2"> 排名所有人可见
	</label>
</div>      
        <input name="ExamID" type="hidden" value='<s:property  value ="ExamID"/>' />
        <a href = '<s:url action="Find"><s:param name="ExamID" value ="ExamID"/> </s:url>'>  <button type ="button" >插入题目</button> </a>
        <br>
        <input type="button" onclick="updateexam()" value="提交生成我的试卷"/>
        <br>
        <a href = '<s:url action="deleteexam"><s:param name="ExamID" value ="ExamID"/> </s:url>'> <button type ="button" >取消编辑试卷</button>  </a>
        <br>
    </form>
</body>
<script type="text/javascript">
	function updateexam() {
		document.myform.action="updateexam"; 
		document.myform.submit(); 
	}
</script>
</html>