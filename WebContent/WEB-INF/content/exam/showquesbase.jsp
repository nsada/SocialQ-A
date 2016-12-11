<%@page import="tencentApi.globalVar"%>
<%@page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<rapid:override name="content">
	<div class="panel panel-primary">
  		<div class="panel-heading">当前试卷的ID:<s:property value="ExamID" /></div>
		<div class="panel-body">
		
						<%List<Object> a ; %>
						<% a = (List<Object>)request.getAttribute("selections");%>
		 				<% if(a!=null && a.size()!=0){ %>
					
   					<div class="panel panel-info">
  							<div class="panel-heading">单选题</div>
							<table class="table">
								<thead>
									<tr>
						
										<th>题目内容</th>
										<th>是否添加</th>
					
									</tr>
								</thead>
								<tbody>
									<s:iterator value="selections">
										<tr>
										
											<td><s:property value="context" /></td>
											<td>
													<input type="checkbox" class ="check" id='<s:property value ="id"/>/#1'   /> 
											</td>
								
										</tr>
									</s:iterator>
								</tbody>
  							</table>
					</div>
					
						<%} %>
						<% a = (List<Object>)request.getAttribute("multys");%>
						 <% if(a!=null && a.size()!=0){ %>

					<div class="panel panel-info">
  							<div class="panel-heading">多选题</div>
							<table class="table">
								<thead>
									<tr>
								
										<th>题目内容</th>
										<th>是否添加</th>
								
									</tr>
								</thead>
								<tbody>
									<s:iterator value="multys">
										<tr>
							
											<td><s:property value="context" /></td>
											<td>
												<input type="checkbox" class ="check" id='<s:property value ="id"/>/#4'   /> 
											</td>
							
										</tr>
									</s:iterator>
								</tbody>
  							</table>
					</div>
					
						<%} %>
						<% a = (List<Object>)request.getAttribute("textBlanks");%>
						 <% if(a!=null && a.size()!=0){ %>
					
					<div class="panel panel-info">
  							<div class="panel-heading">填空题</div>
							<table class="table">
								<thead>
									<tr>
			
										<th>题目内容</th>
										<th>是否添加</th>
					
									</tr>
								</thead>
								<tbody>
									<s:iterator value="textBlanks">
										<tr>
						
											<td><s:property value="context" /></td>
											<td>
												<input type="checkbox" class ="check" id='<s:property value ="id"/>/#2'   /> 
											</td>
					
										</tr>
									</s:iterator>
								</tbody>
  							</table>
					</div>
					
						<%} %>
						<% a = (List<Object>)request.getAttribute("AandQs");%>
						 <% if(a!=null && a.size()!=0){ %>	
						 
					<div class="panel panel-info">
  							<div class="panel-heading">问答题</div>
							<table class="table">
								<thead>
									<tr>

										<th>题目内容</th>
										<th>是否添加</th>
						
									</tr>
								</thead>
								<tbody>
									<s:iterator value="AandQs">
										<tr>

											<td><s:property value="context" /></td>
											<td>
												<input type="checkbox" class ="check" id='<s:property value ="id"/>/#3'   /> 
											</td>
						
										</tr>
									</s:iterator>
								</tbody>	
  							</table>
					</div>
					
						<%} %>
						
					<a   style="float: right;" onclick="SubmitAddResult()" class="button button-3d button-action button-pill">提交</a>
					
					<script type="text/javascript">
						function SubmitAddResult(){
							var list = document.getElementsByClassName("check");
							var result ="";
							for(var i =0; i <list.length;i++)
								if(list[i].checked)
									result += list[i].id +"/$";
							var form =document.createElement("form");
							form.style.display="none";
							form.action="InsertQuestion";
							form.method = "post";
							var input = document.createElement("input");    
			            	input.name = "questionstr"
			            	input.value = result;
			            	form.appendChild(input);      
			            	
			            	var input = document.createElement("input");    
			            	input.name = "GroupID"
			            	input.value = <s:property value="GroupID" />;
			            	form.appendChild(input); 
			            		            	
			            	var input = document.createElement("input");    
			            	input.name = "ExamID"
			            	input.value = <s:property value="ExamID" />;
			            	form.appendChild(input); 
			            	form.submit();
			            	return;
							
						}
					
					</script>
  		</div>
	</div>
</rapid:override>
	
	
	

<%@ include file="../../../../base.jsp"%>