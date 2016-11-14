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
<<<<<<< HEAD
    	</div>
        <div class="panel panel-info">
 			<div class="panel-heading">
    			<h3 class="panel-title">单选题</h3>
  			</div>
  			<div class="panel-body">
    			<ul class="list-group">
  						
									<%int i = 1; %>
        				<s:iterator value="selections" >
              				
              				<li class="list-group-item">
        					<%=i %><s:property value="context" />
        					<%i++; %>
        					 <div style="position: relative;left: 15px;">
		            			<s:if test="A.length()>0">
			                        A:<s:property value = "A"/><br>    
			            		</s:if>
			            		<s:if test="B.length()>0">
			                        B:<s:property value = "B"/><br>    
			            		</s:if>
			            		<s:if test="C.length()>0">
			                        C:<s:property value = "C"/><br>    
			            		</s:if>
			            		<s:if test="D.length()>0">
			                        D:<s:property value = "D"/><br>    
			            		</s:if>
			            		<s:if test="E.length()>0">
			                        E:<s:property value = "E"/><br>    
			            		</s:if>
			            		<s:if test="F.length()>0">
			                        F:<s:property value = "F"/><br>    
			            		</s:if>
        					</div>
        					<br> 题目总分:
        					<s:property value="score" />
        					<br> 你的得分:
        					<s:property value="userscore" />
        					<br> 你的答案:
        					<s:property value="useranswer" />
        					<br> 参考答案:
        					<s:property value="ans" />	
        					<br> 解析:
        					<s:property value="analysis" />
        					</li>
						</s:iterator>
				</ul>
  			</div>
		</div>
		<div class="panel panel-info">
 			<div class="panel-heading">
    			<h3 class="panel-title">多选题</h3>
  			</div>
  			<div class="panel-body">
    			<ul class="list-group">
						<% i = 1; %>
        				<s:iterator value="multys" >
              				<li class="list-group-item">
        					<%=i %><s:property value="context" />
        					<%i++; %>
        					 <div style="position: relative;left: 15px;">
		            			<s:if test="A.length()>0">
			                        A:<s:property value = "A"/><br>    
			            		</s:if>
			            		<s:if test="B.length()>0">
			                        B:<s:property value = "B"/><br>    
			            		</s:if>
			            		<s:if test="C.length()>0">
			                        C:<s:property value = "C"/><br>    
			            		</s:if>
			            		<s:if test="D.length()>0">
			                        D:<s:property value = "D"/><br>    
			            		</s:if>
			            		<s:if test="E.length()>0">
			                        E:<s:property value = "E"/><br>    
			            		</s:if>
			            		<s:if test="F.length()>0">
			                        F:<s:property value = "F"/><br>    
			            		</s:if>
        					</div>
        					<br> 题目总分:
        					<s:property value="score" />
        					<br> 你的得分:
        					<s:property value="userscore" />
        					<br> 你的答案:
        					<s:property value="useranswer" />
        					<br> 参考答案:
        					<s:property value="ans" />	
        					<br> 解析:
        					<s:property value="analysis" />
        					</li>
						</s:iterator>
				</ul>
  			</div>
		</div>
		<div class="panel panel-info">
 			<div class="panel-heading">
    			<h3 class="panel-title">填空题</h3>
  			</div>
  			<div class="panel-body">
    			<ul class="list-group">
						<% i = 1; %>
        				<s:iterator value="textBlanks" >
              				<li class="list-group-item">
        					<%=i %><s:property value="context" />
        					<%i++; %>
        					 <div style="position: relative;left: 15px;">
		            			<s:if test="A.length()>0">
			                        A:<s:property value = "A"/><br>    
			            		</s:if>
			            		<s:if test="B.length()>0">
			                        B:<s:property value = "B"/><br>    
			            		</s:if>
			            		<s:if test="C.length()>0">
			                        C:<s:property value = "C"/><br>    
			            		</s:if>
			            		<s:if test="D.length()>0">
			                        D:<s:property value = "D"/><br>    
			            		</s:if>
			            		<s:if test="E.length()>0">
			                        E:<s:property value = "E"/><br>    
			            		</s:if>
			            		<s:if test="F.length()>0">
			                        F:<s:property value = "F"/><br>    
			            		</s:if>
        					</div>
        					<br> 题目总分:
        					<s:property value="score" />
        					<br> 你的得分:
        					<s:property value="userscore" />
        					<br> 你的答案:
        					<s:property value="useranswer" />
        					<br> 参考答案:
        					<s:property value="ans" />	
        					<br> 解析:
        					<s:property value="analysis" />
        					</li>
						</s:iterator>
				</ul>
  			</div>
		</div>
		<div class="panel panel-info">
 			<div class="panel-heading">
    			<h3 class="panel-title">问答题</h3>
  			</div>
  			<div class="panel-body">
    			<ul class="list-group">
						<% i = 1; %>
        				<s:iterator value="AandQs" >
              				<li class="list-group-item">
        					<%=i %><s:property value="context" />
        					<%i++; %>
        					<br> 题目总分:
        					<s:property value="score" />
        					<br> 你的得分:
        					<s:property value="userscore" />
        					<br> 你的答案:
        					<s:property value="useranswer" />
        					<br> 参考答案:
        					<s:property value="ans" />	
        					<br> 解析:
        					<s:property value="analysis" />
        					</li>
						</s:iterator>
				</ul>
  			</div>
		</div>
	
		<a  class="button button-block button-rounded button-action button-large"
           	 href='<s:url action="MyFriendRank"><s:param name="ExamID" value ="ExamID"/> </s:url>'>
                  查看我的小伙伴的排名	
        </a>
=======
<<<<<<< HEAD
=======
        	<p style="text-align: center;"> 我的排名：<s:property value="rank"/><p>
        	<p style="text-align: center;"> ExamID：<s:property value="ExamID"/><p>
>>>>>>> 101c3307f94547830b4e1bae04d684b274e53c87
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
		
	      <br> 问答题
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
		<br>
		<p> 查看我的小伙伴的排名 :<p>
		<a  class="list-group-item list-group-item-success"
           		 href='<s:url action="MyFriendRank"><s:param name="ExamID" value ="ExamID"/> </s:url>'>
                        			
               								</a>
>>>>>>> 6e51335d1720cd1116e9bce6ae1400b1a3660ac9
		      


</rapid:override>   
<%@ include file="../../../../base.jsp"%>
