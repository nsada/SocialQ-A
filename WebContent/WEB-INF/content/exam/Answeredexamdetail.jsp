<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">
	<title>答题</title>
</rapid:override>
<rapid:override name="content">
		<div>
        
  
        	<h2 style="text-align: center;"> 试卷名：<s:property value="title"/></h2>
        	<p style="text-align: center;"> 试卷描述：<s:property value="description"/><p>
    </div>
        <div class="col-md-12 column">
        <%int i = 0; %>
          单选题：
        <s:iterator value="selections" >
              <br>
        		<s:property value="context" />
        		<br>
        		<s:property value="A" />
        		<br>
        		<s:property value="B" />
        		<br>
        		<s:property value="C" />
        		<br>
        		<s:property value="D" />
        		<br>
        		<s:property value="E" />
        		<br>
        		<s:property value="F" />
        		<br> 题目总分
        		<s:property value="score" />
        		<br> 你的得分
        		<s:property value="userscore" />
        		<br> 你的答案
        		<s:property value="useranswer" />
        		<br> 参考答案
        		<s:property value="ans" />	
        		<br> 解析
        		<s:property value="analysis" />
		</s:iterator>
	   <br> 多选题
		<s:iterator value="multys" >	
		       <s:property value="context" />
        		<br>
        		<s:property value="A" />
        		<br>
        		<s:property value="B" />
        		<br>
        		<s:property value="C" />
        		<br>
        		<s:property value="D" />
        		<br>
        		<s:property value="E" />
        		<br>
        		<s:property value="F" />
        		<br> 题目总分
        		<s:property value="score" />
        		<br> 你的得分
        		<s:property value="userscore" />
        		<br> 你的答案
        		<s:property value="useranswer" />
        		<br> 参考答案
        		<s:property value="ans" />		
        		<br> 解析
        		<s:property value="analysis" />
		</s:iterator>
		
		 <br> 填空题
		<s:iterator value="textBlanks" >	
			 <s:property value="context" />
        		<br><br> 参考答案	
        		<s:property value="A" />
        		<br>
        		<s:property value="B" />
        		<br>
        		<s:property value="C" />
        		<br>
        		<s:property value="D" />
        		<br>
        		<s:property value="E" />
        		<br>
        		<s:property value="F" />
        		<br> 题目总分
        		<s:property value="score" />
        		<br> 你的得分
        		<s:property value="userscore" />
        		<br> 你的答案
        		<s:property value="useranswer" />
        		<br> 解析
        		<s:property value="analysis" />	               
		</s:iterator>
		
	
		<s:iterator value="AandQs" >			
			  <br>
		   <s:property value="context" />
			<br> 参考答案	
        		<s:property value="ans" />
        		<br> 题目总分
        		<s:property value="score" />
        		<br> 你的得分
        		<s:property value="userscore" />
        		<br> 你的答案
        		<s:property value="useranswer" />
        		<br> 解析
        		<s:property value="analysis" />	                  
		</s:iterator>
		      
</div>
</rapid:override>   
<%@ include file="../../../../base.jsp"%>
