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
        	<p style="text-align: center;"> 参加此试卷的总人数：<s:property value="totalpeople"/><p>
        	<p style="text-align: center;"> 该试卷累计得分：<s:property value="totalscore"/><p>
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
        		<br> 参加总人数
        		<s:property value="people" />
        		<br> 正确的人数
        		<s:property value="peopleR" />
        		<br> 所有分数的总和
        		<s:property value="totalscore" />	
		</s:iterator>
	   <br> 多选题
		<s:iterator value="multys" >
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
        		<br> 参加总人数
        		<s:property value="people" />
        		<br> 正确的人数
        		<s:property value="peopleR" />
        		<br> 所有分数的总和
        		<s:property value="totalscore" />	
		</s:iterator>
		
		 <br> 填空题
		<s:iterator value="textBlanks" >
		      <br>	
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
        		<br> 参加总人数
        		<s:property value="people" />
        		<br> 正确的人数
        		<s:property value="peopleR" />
        		<br> 所有分数的总和
        		<s:property value="totalscore" />	          
		</s:iterator>
		
	      <br> 问答题
		<s:iterator value="AandQs" >			
			  <br>
		   <s:property value="context" />
			<br> 参考答案	
        		<s:property value="ans" />
        		<br> 题目总分
        		<s:property value="score" />     		
        		<br> 解析
        		<s:property value="analysis" />	 
        		<s:property value="score" />
        		<br> 参加总人数
        		<s:property value="people" />
        		<br> 正确的人数
        		<s:property value="peopleR" />
        		<br> 所有分数的总和
        		<s:property value="totalscore" />	                   
		</s:iterator>
        <a  class="list-group-item list-group-item-success"
           		 href='<s:url action="AllTakerRank"><s:param name="ExamID" value ="ExamID"/>查看所有用户回答的排名情况 </s:url>'>                      								</a>
		      
</div>
</rapid:override>   
<%@ include file="../../../../base.jsp"%>

