<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 6e51335d1720cd1116e9bce6ae1400b1a3660ac9
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="content">
        <div class="panel panel-info">
  							<div class="panel-heading">输入你就能评分了哦</div>
  							
							<div class="panel-body">
   								   <div class="list-group">
   								  		当前题目的EXAMID <s:property value="ExamID" /> <br>		
   								  			<s:property value="TesttakerID" />		           
   								   		<s:iterator value="UncheckedAandQs">
           									<p  class="list-group-item list-group-item-success">
                        						题目：<s:property value="Context" />
                        						<br>
                        						参考答案：<s:property value="ans"/>
                        						<br>输入评分：
                        						<input type= "text" class ="UncheckedAandQs"/>
                        					  <s:property value="Takename" />	回答了您的 :<s:property value="useranswer" />
        										<br> 解析：
        										<s:property value="analysis" />	    
               								</p>
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
       		 
	                   <a onclick="SendAandQScores()">
                        批改试卷   
                        </a>		 
									
									</div>
  							</div>
		</div>
</rapid:override>
<<<<<<< HEAD
=======
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="content">
        <div class="panel panel-info">
  							<div class="panel-heading">输入你就能评分了哦</div>
  							
							<div class="panel-body">
   								   <div class="list-group">
   								  		当前题目的EXAMID <s:property value="ExamID" /> <br>		
   								  			<s:property value="TesttakerID" />		           
   								   		<s:iterator value="UncheckedAandQs">
           									<p  class="list-group-item list-group-item-success">
                        						题目：<s:property value="Context" />
                        						<br>
                        						参考答案：<s:property value="ans"/>
                        						<br>输入评分：
                        						<input type= "text" class ="UncheckedAandQs"/>
                        					  <s:property value="Takename" />	回答了您的 :<s:property value="useranswer" />
        										<br> 解析：
        										<s:property value="analysis" />	    
               								</p>
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
       		 
	                   <a onclick="SendAandQScores()">
                        批改试卷   
                        </a>		 
									
									</div>
  							</div>
		</div>
</rapid:override>
>>>>>>> 101c3307f94547830b4e1bae04d684b274e53c87
>>>>>>> 6e51335d1720cd1116e9bce6ae1400b1a3660ac9
<%@ include file="../../../../base.jsp"%>