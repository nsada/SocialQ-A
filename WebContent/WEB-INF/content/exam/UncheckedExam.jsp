<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<rapid:override name="head">
	<title>批改</title>
</rapid:override>
<rapid:override name="content">
		<%if((int)request.getAttribute("checked")!=1){ %>
        <div class="panel panel-info">
  							<div class="panel-heading">输入你就能评分了哦</div>
  							
							<div class="panel-body">
   								   <div class="list-group">
   								  		
   								  			
   								   		<s:iterator value="UncheckedAandQs">
           									<li  class="list-group-item list-group-item-info">
                        						题目：<s:property value="Context" />(总分：<s:property value ="score"/>分)<br>
                        						他的答案：<s:property value = "useranswer"/><br>
                        						参考答案：<s:property value="ans"/><br>
                        						解析：<s:property value="analysis" /><br>
                        						输入评分：<input type= "text" class ="UncheckedAandQs"/><br>
        											    
               								</li>
       		 							 </s:iterator>
       		 							 <script>
       		 							 	function SendAandQScores(){
       		 							 		var list = $(".UncheckedAandQs")
       		 							 		result = ""
       		 							 		for(var i =0; i < list.length;i++){
       		 							 			
       		 							 			result += list[i].value + "#"; 
       		 							 		}
       		 							 		
       		 							 	var form = document.createElement("form");        
       		 			            		form.action = "CheckUserExam";        
       		 			            		form.method = "post";        
       		 			            	form.style.display = "none";        
       		 			            	var opt = document.createElement("input");    
       		 			            	opt.name = "TesttakerID"
       		 			            	opt.value = <s:property value ="TesttakerID"/>;
       		 			            	form.appendChild(opt); 
       		 			            	
       		 			            	var opt = document.createElement("input");    
       		 			            	opt.name = "ExamID";
       		 			            	opt.value = <%=request.getAttribute("ExamID")%>;
       		 			            	form.appendChild(opt); 
       		 			            var opt = document.createElement("input");    
   		 			            	opt.name = "scorestr";
   		 			            	opt.value = result;
   		 			            	form.appendChild(opt); 
       		 			            	
       		 			            	
       		 			            	
       		 			    			
       		 			            	document.body.appendChild(form);        

       		 			            	form.submit();        
       		 							 		
       		 							 	}
       		 							 
       		 							 </script>
       		 
							                   <a class= "button button-glow button-border button-rounded button-action"
							                   		onclick="SendAandQScores()"
							                   		style="float: right;">
						                        	提交 
						                       </a>		 
									
									</div>
  							</div>
		</div>
		<%}else{%>
		<h3 style = "text-align: center;">测试已批改</h3>
		<%} %>
</rapid:override>
<%@ include file="../../../../base.jsp"%>