<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import = "java.util.List" %>

<rapid:override name="head">
	<title>答题详情</title>
</rapid:override>
<rapid:override name="content">
		<div>

        	<h2 style="text-align: center;"> 试卷名：<s:property value="title"/></h2>
        	<p style="text-align: center;"> 试卷描述：<s:property value="description"/><p>
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
              				<script>
              					if(<s:property value="ans" /> == 0 )
              						document.write("<li class='list-group-item'>")
              					else if(<s:property value="useranswer" />!=<s:property value="ans" />)
              						document.write("<li class='list-group-item list-group-item-danger'>")
              					else
              						document.write(" <li class='list-group-item list-group-item-success'>")
              				</script>
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
        					<br> 题目总分:
        					<s:property value="score" />
        					<br> 你的得分:
        					<s:property value="userscore" />
        					<br> 你的答案:
        					<script>
        						var ans ="<s:property value="useranswer" />";
        						i= parseInt(ans);
        						ll =  String.fromCharCode("A".charCodeAt() + i-1);
								document.write(ll);
        					</script>
        		
        					<br> 参考答案:
        					<script>
        						var ans ="<s:property value="ans" />";
        						i= parseInt(ans);
        						ll =  String.fromCharCode("A".charCodeAt() + i-1);
								document.write(ll);
        					</script>
        						
        						
        					<br> 解析:
        					<s:property value="analysis" />
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
        					<script>
              					if("<s:property value='useranswer' />"!='<s:property value="ans" />')
              						document.write("<li class='list-group-item list-group-item-danger'>")
              					else
              						document.write(" <li class='list-group-item list-group-item-success'>")
              				</script>
              			
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
        					<br> 题目总分:
        					<s:property value="score" />
        					<br> 你的得分:
        					<s:property value="userscore" />
        					<br> 你的答案:
        					<script>
        							var ans ="<s:property value="useranswer" />";
        							for(var i = 0 ; i <6;i++){
        								if(ans.charAt(i)=="1"){
        									ll =  String.fromCharCode("A".charCodeAt() + i);
        									document.write(ll);
        								}
        							}
        					</script>
        					
        					<br> 参考答案:
        					<script>
        							var ans ="<s:property value="ans" />";
        							for(var i = 0 ; i <6;i++){
        								if(ans.charAt(i)=="1"){
        									ll =  String.fromCharCode("A".charCodeAt() + i);
        									document.write(ll);
        								}
        							}
        					</script>
        					
        					<br> 解析:
        					<s:property value="analysis" />
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
        					<script>
              					if("<s:property value='useranswer' />"!='<s:property value="ans" />')
              						document.write("<li class='list-group-item list-group-item-danger'>")
              					else
              						document.write(" <li class='list-group-item list-group-item-success'>")
              				</script>
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
        					<br> 题目总分:
        					<s:property value="score" />
        					<br> 你的得分:
        					<s:property value="userscore" />
        					<br> 你的答案:
        					<script>
        						str = "<s:property value="useranswer" />"
        						str=str.split("/#")
        						if(str.length!=0){
        							document.write(str[0]);
            						for( i =1 ; i <str.length;i++)
            							if(str[i]!="")
            								document.write(", "+str[i])
        						}
        					</script>
        					
        					<br> 参考答案:
        					<script>
        						str = "<s:property value='ans' />"
        						str=str.split("/#")
        						if(str.length!=0){
        							document.write(str[0]);
            						for( i =1 ; i <str.length;i++)
            							if(str[i]!="")
            								document.write(", "+str[i])
        						}
        					</script>
        					<br> 解析:
        					<s:property value="analysis" />
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
        					<%=i %>.<s:property value="context" />
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
		<%}%>
		<a  	class='button button-block button-rounded button-action button-large'
				id = "checkRank"
				href='<s:url action="MyFriendRank"><s:param name="ExamID" value ="ExamID"/> </s:url>'>
				查看我的小伙伴的排名	
		</a>

		
		
		      


</rapid:override>   
<%@ include file="../../../../base.jsp"%>
