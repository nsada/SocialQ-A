<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import = "java.util.List" %>
<rapid:override name="head">
	<title>回答详情</title>
</rapid:override>
<rapid:override name="content">
		<div>
        	<h2 style="text-align: center;"> 试卷名：<s:property value="title"/></h2>
        	<p style="text-align: center;"> 试卷描述：<s:property value="description"/><p>
        	<p style="text-align: center;"> 参加此试卷的总人数：<s:property value="totalpeople"/><p>
        	<p style="text-align: center;"> 该试卷累计得分：<s:property value="totalscore"/><p>
   		 </div>
   		 
   		 
   		 
   		 
   		 
   		 
   		 <%
          	int i = 1; 
         	if(request.getAttribute("selections")!=null&&((List<Object>)request.getAttribute("selections")).size()!=0){%>
        <div class="panel panel-info">
 			<div class="panel-heading">
    			<h3 class="panel-title">单选题</h3>
  			</div>
  			<div class="panel-body">
    			<ul class="list-group">
        				<s:iterator value="selections" >
     
              				<li class='list-group-item'>
              					
              						<table class = "table">
			              					<tbody>
			              							<tr>
			              									<td >
			              										<div style="position: relative;left: 10%;width: 80%;top: 15px;">
			              												<p><%=i %>.<s:property value="context" /></p>
											        					<%i++; %>
											        					<div style="position: relative;left: 15px;">
													            			<s:if test="A.length()>0">
														                        <p>A:<s:property value = "A"/></p>   
														            		</s:if>
														            		<s:if test="B.length()>0">
														                        <p>B:<s:property value = "B"/></p>
														            		</s:if>
														            		<s:if test="C.length()>0">
														                        <p>C:<s:property value = "C"/></p>  
														            		</s:if>
														            		<s:if test="D.length()>0">
														                        <p>D:<s:property value = "D"/></p>    
														            		</s:if>
														            		<s:if test="E.length()>0">
														                        <p>E:<s:property value = "E"/></p>    
														            		</s:if>
														            		<s:if test="F.length()>0">
														                       <p>F:<s:property value = "F"/></p>   
														            		</s:if>
											        					</div>
											        			</div>
			              									</td>
			              									<td style="text-align: center;">
			              										 <div class="panel panel-primary" style = "position: relative;left: 10%;width: 50%">
			              										 		<div class="panel-body">
			              														<p> 题目总分:<s:property value="score" /></p>
        																		<p>参加总人数:<s:property value="people" /></p>
        																		<p>正确的人数:<s:property value="peopleR" /></p>
        																		<p> 所有分数的总和:<s:property value="totalscore" />	</p>
														        		</div>
														        	</div>
			              									</td>
			              							</tr>
			              					</tbody>
              						
              						</table>
        					</li>
						</s:iterator>
				</ul>
  			</div>
		</div>

		<%}
          	i = 1; 
         	if(request.getAttribute("multys")!=null&&((List<Object>)request.getAttribute("multys")).size()!=0){%>
         	
		<div class="panel panel-info">
 			<div class="panel-heading">
    			<h3 class="panel-title">多选题</h3>
  			</div>
  			<div class="panel-body">
    			<ul class="list-group">
				
        				<s:iterator value="multys" >
        		
              				<li class='list-group-item '>
              			
              		
              				<table class = "table">
			              					<tbody>
			              							<tr>
			              									<td >
			              										<div style="position: relative;left: 10%;width: 80%;top: 15px;">
											        					<p><%=i %>.<s:property value="context" /></p>
											        					<%i++; %>
											        					 <div style="position: relative;left: 15px;">
													            			<s:if test="A.length()>0">
														                        <p>A:<s:property value = "A"/></p> 
														            		</s:if>
														            		<s:if test="B.length()>0">
														                        <p>B:<s:property value = "B"/></p>     
														            		</s:if>
														            		<s:if test="C.length()>0">
														                        <p>C:<s:property value = "C"/></p>     
														            		</s:if>
														            		<s:if test="D.length()>0">
														                        <p>D:<s:property value = "D"/></p>     
														            		</s:if>
														            		<s:if test="E.length()>0">
														                        <p>E:<s:property value = "E"/></p>    
														            		</s:if>
														            		<s:if test="F.length()>0">
														                        <p>F:<s:property value = "F"/></p>    
														            		</s:if>
											        					</div>
											        				</div>
											        			</td>
											        			<td style="text-align: center;">
			              										 	<div class="panel panel-primary" style = "position: relative;left: 10%;width: 50%">
			              										 		<div class="panel-body">
														        				<p> 题目总分:<s:property value="score" /></p>
        																		<p>参加总人数:<s:property value="people" /></p>
        																		<p>正确的人数:<s:property value="peopleR" /></p>
        																		<p> 所有分数的总和:<s:property value="totalscore" />	</p>
														        			</div>
														        		</div>
														        	</td>
														        	</tr>
														        </tbody>
														   </table>
        					</li>
						</s:iterator>
				</ul>
  			</div>
		</div>
		
		<%}
          	 i = 1; 
         	if(request.getAttribute("textBlanks")!=null&&((List<Object>)request.getAttribute("textBlanks")).size()!=0){%>
         	
		<div class="panel panel-info">
 			<div class="panel-heading">
    			<h3 class="panel-title">填空题</h3>
  			</div>
  			<div class="panel-body">
    			<ul class="list-group">
		
        				<s:iterator value="textBlanks" >
        	
              	
              				<li class='list-group-item list-group-item-danger'>
   
              				
              				<table class = "table">
			              					<tbody>
			              							<tr>
			              									<td >
			              										<div style="position: relative;left: 10%;width: 80%;top: 15px;">
											        					<p><%=i %>.<s:property value="context" /></p>
											        					<%i++; %>
											        					 <div style="position: relative;left: 15px;">
													            			<s:if test="A.length()>0">
														                        <p>A:<s:property value = "A"/></p> 
														            		</s:if>
														            		<s:if test="B.length()>0">
														                        <p>B:<s:property value = "B"/></p>     
														            		</s:if>
														            		<s:if test="C.length()>0">
														                        <p>C:<s:property value = "C"/></p>     
														            		</s:if>
														            		<s:if test="D.length()>0">
														                        <p>D:<s:property value = "D"/></p>     
														            		</s:if>
														            		<s:if test="E.length()>0">
														                        <p>E:<s:property value = "E"/></p>    
														            		</s:if>
														            		<s:if test="F.length()>0">
														                        <p>F:<s:property value = "F"/></p>    
														            		</s:if>
											        					</div>
											        				</div>
											        			</td>
											        			<td style="text-align: center;">
			              										 	<div class="panel panel-primary" style = "position: relative;left: 10%;width: 50%">
			              										 		<div class="panel-body">
														        				<p> 题目总分:<s:property value="score" /></p>
        																		<p>参加总人数:<s:property value="people" /></p>
        																		<p>正确的人数:<s:property value="peopleR" /></p>
        																		<p> 所有分数的总和:<s:property value="totalscore" />	</p>
														        			</div>
														        		</div>
														        	</td>
														        	</tr>
														        </tbody>
														   </table>
        					</li>
						</s:iterator>
				</ul>
  			</div>
		</div>
		<%}
          	i = 1; 
         	if(request.getAttribute("AandQs")!=null&&((List<Object>)request.getAttribute("AandQs")).size()!=0){%>
		<div class="panel panel-info">
 			<div class="panel-heading">
    			<h3 class="panel-title">问答题</h3>
  			</div>
  			<div class="panel-body">
    			<ul class="list-group">
						<% i = 1; %>
        				<s:iterator value="AandQs" >
              				<li class="list-group-item">
              							<table class = "table">
			              					<tbody>
			              							<tr>
			              									<td >
			              										<div style="position: relative;left: 10%;width: 80%;top: 15px;">
											        					<p><%=i %>.<s:property value="context" /></p>
											        					<%i++; %>
											        				</div>
											        			</td>
											        			<td style="text-align: center;">
			              										 	<div class="panel panel-primary" style = "position: relative;left: 10%;width: 50%">
			              										 		<div class="panel-body">
														        				<p> 题目总分:<s:property value="score" /></p>
        																		<p>参加总人数:<s:property value="people" /></p>
        																		<p>正确的人数:<s:property value="peopleR" /></p>
        																		<p> 所有分数的总和:<s:property value="totalscore" />	</p>
														        			</div>
														        		</div>
														        	</td>
														        	</tr>
														        </tbody>
														   </table>
              			
        					</li>
						</s:iterator>
				</ul>
  			</div>
		</div>
		<%}%>
   		 
        <button  class="button button-block button-rounded button-action button-large" id="checkRank"
           	 onclick = "window.location.href='<s:url action="AllTakerRank"><s:param name="ExamID" value ="ExamID"/></s:url>'"
           	 style="float: right;">
           	 查看所有用户回答的排名情况
		</button>
		<script>
			$(document).ready(function(){
				var a = <s:property value="totalpeople"/>;
				if(a==0){
					$("#checkRank")[0].disabled = "disabled";
					$("#checkRank")[0].innerHTML = "没有人答过这套测试";
				}
					
			})
		</script>

</rapid:override>   
<%@ include file="../../../../base.jsp"%>

