<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import = "java.util.List" %>
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
              													<li class="list-group-item">
        																	<%=i %>.<s:property value="context" />
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

        																		<br> 题目总分:<s:property value="score" />
        																		<br> 参加总人数:<s:property value="people" />
        																		<br> 正确的人数:<s:property value="peopleR" />
        																		<br> 所有分数的总和:<s:property value="totalscore" />	
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
              																<li class="list-group-item">
        																			<%=i %>.<s:property value="context" />
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
																					<br> 题目总分:<s:property value="score" />
																					<br> 参加总人数:<s:property value="people" />
																					<br> 正确的人数:<s:property value="peopleR" />
																					<br> 所有分数的总和:<s:property value="totalscore" />	
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
								              						<li class="list-group-item">
								        									<%=i %>.<s:property value="context" />
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
								        										<br> 题目总分:<s:property value="score" />
																	        	<br> 参加总人数:<s:property value="people" />
																	        	<br> 正确的人数:<s:property value="peopleR" />
																	        	<br> 所有分数的总和:<s:property value="totalscore" />	          
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
										
        										<s:iterator value="AandQs" >
              												<li class="list-group-item">
        															<%=i %>.<s:property value="context" />
        															<%i++; %>
													        		<br> 题目总分:<s:property value="score" />     		
													        		<br> 参加总人数:<s:property value="people" />
													        		<br> 正确的人数:<s:property value="peopleR" />
													        		<br> 所有分数的总和:<s:property value="totalscore" />	                   

        													</li>
												</s:iterator>
										</ul>
  								</div>
						</div>
			<%}%>
        <a  class="list-group-item list-group-item-success"
           	 href='<s:url action="AllTakerRank"><s:param name="ExamID" value ="ExamID"/></s:url>'>
           	 查看所有用户回答的排名情况
		</a>
		      

</rapid:override>   
<%@ include file="../../../../base.jsp"%>

