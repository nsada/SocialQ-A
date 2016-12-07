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
        
        	<h2 style="text-align: center;">${exam.title}</h2>
        	<p style="text-align: center;"> ${exam.description}<p>
    </div>
        <div class="col-md-12 column">
        <%int i = 0; %>
        <s:iterator value="selections" >
        			<%i++; %>
                    <div>
                        <%=i %>.<s:property value = "context"/><br/>
                    </div>
		            
		                <s:if test="A.length()>0">
			                        <span>
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="1">
			                        </span>
			                        <span class="choose-index">A:<s:property value = "A"/></span>    
			            </s:if>
		                <s:if test="B.length()>0">
			                        <span>
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="2">
			                        </span>
			                        <span class="choose-index">B:<s:property value = "B"/></span>
			               
			            </s:if>
			            <s:if test="C.length()>0">
			                        <span>
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="3">
			                        </span>
			                        <span class="choose-index">C:<s:property value = "C"/></span>
			                  
			            </s:if>
			            <s:if test="D.length()>0">
			                        <span>
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="4">
			                        </span>
			                        <span class="choose-index">D:<s:property value = "D"/></span>
			                 
			            </s:if>
			            <s:if test="E.length()>0">
			                        <span>
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="5">
			                        </span>
			                        <span class="choose-index">E:<s:property value = "E"/></span>
			                   
			            </s:if>
			            <s:if test="F.length()>0">
			                        <span>
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="6">
			                        </span>
			                        <span class="choose-index">F:<s:property value = "F"/></span> 
			            </s:if>
		</s:iterator>
		 <% int j = 0; %>
		<s:iterator value="multys" >			
			<%j++; %>
                    <div>
                        <%=j %>.<s:property value = "context"/><br/>
                    </div>
		            
		                <s:if test="A.length()>0">
			                        <span>
			                            <input type="checkbox" name="multys<%=j %>"  value="A">
			                        </span>
			                        <span class="choose-index">A:<s:property value = "A"/></span>    
			            </s:if>
		                <s:if test="B.length()>0">
			                        <span>
			                            <input type="checkbox" name="multys<%=j %>"  value="B">
			                        </span>
			                        <span class="choose-index">B:<s:property value = "B"/></span>
			               
			            </s:if>
			            <s:if test="C.length()>0">
			                        <span>
			                            <input type="checkbox" name="multys<%=j %>"  value="C">
			                        </span>
			                        <span class="choose-index">C:<s:property value = "C"/></span>
			                  
			            </s:if>
			            <s:if test="D.length()>0">
			                        <span>
			                            <input type="checkbox" name="multys<%=j %>"  value="D">
			                        </span>
			                        <span class="choose-index">D:<s:property value = "D"/></span>
			                 
			            </s:if>
			            <s:if test="E.length()>0">
			                        <span>
			                            <input type="checkbox" name="multys<%=j %>"  value="E">
			                        </span>
			                        <span class="choose-index">E:<s:property value = "E"/></span>
			                   
			            </s:if>
			            <s:if test="F.length()>0">
			                        <span>
			                            <input type="checkbox" name="multys<%=j %>"  value="F">
			                        </span>
			                        <span class="choose-index">F:<s:property value = "F"/></span> 
			            </s:if>
		</s:iterator>
		
		  <% int  k = 0; %>
		<s:iterator value="textBlanks" >			
			<%k++; %>
                    <div>
                        <%=k %>.<s:property value = "context"/><br/>
                    </div>
		            
		                <s:if test="1<=num">
			                        <span>
			                            <input type="text" class="textBlanks<%=k %>"  >
			                        </span>
			            </s:if>
			            <s:if test="2<=num">
			                        <span>
			                            <input type="text" class="textBlanks<%=k %>"  >
			                        </span>
			            </s:if>
			            <s:if test="3<=num">
			                        <span>
			                            <input type="text" class="textBlanks<%=k %>"  >
			                        </span>
			            </s:if>
			            <s:if test="4<=num">
			                        <span>
			                            <input type="text" class="textBlanks<%=k %>"  >
			                        </span>
			            </s:if>
			            <s:if test="5<=num">
			                        <span>
			                            <input type="text" class="textBlanks<%=k %>"  >
			                        </span>
			            </s:if>
			            <s:if test="6<=num">
			                        <span>
			                            <input type="text" class="textBlanks<%=k %>"  >
			                        </span>
			            </s:if>
		               
		</s:iterator>
		

		
		  <% int l = 0; %>
		<s:iterator value="AandQs" >			
			<%l++; %>
                    <div>
                        <%=l %>.<s:property value = "context"/><br/>
                    </div>
		             <span>
			                    <textarea  id ="AandQs<%=l %>"></textarea>
			                  </span>
		</s:iterator>
		
		<div>
			<span class="button-wrap" style="float:right;">
    				<button class="button button-pill button-raised button-primary submit_result">确认提交</button>
  			</span>  
		</div>
		      
	<script>
    	
    	var jq = jQuery.noConflict();
    	jq(document).ready(function(){
    		jq(".submit_result").click(function(){
    			var selection_result = ""; 
    			var multys_result="";
    			var textBlanks_result = "";
    			var AandQs_result = "";	
    			
    			var num = <%=i%>;
    			for(var i =1 ; i <= num ; i ++){
    				var obj=document.getElementsByName('choose'+i); 
    				var temp = ""
    				for(var j =0;j<obj.length;j++){
    					if(obj[j].checked){
    						temp = obj[j].value;
        					break;
    					}
    				}
    				selection_result += temp + "#";
    			}
    		
    			
    			num=<%=j%>;
    			for(var i =1 ; i <= num ; i ++){
    				var obj=document.getElementsByName('multys'+i); 
    				var temp = ""
    				var j ;
    				for( j = 0 ; j< obj.length;j++ ){
    					if(obj[j].checked) 
    						temp +="1";
    					else 
    						temp += "0";
    				}
    				for(;j<6;j++)
    					temp+="0";
    				multys_result += temp + "#";
    			}
    			
    			num=<%=k%>;
    			for(var i =1 ; i <= num ; i ++){
    				var obj= document.getElementsByClassName("textBlanks"+i);
    				var temp = ""
    				for(var j = 0 ; j< obj.length;j++ ){
    					temp += obj[j].value +"/#"
    				}
    				textBlanks_result += temp + "/$";
    			}
    			num=<%=l%>;
    			for(var i =1 ; i <= num ; i ++){
    				var obj= document.getElementById("AandQs"+i);
    				AandQs_result += obj.value + "/#";

    			}

    			var form = document.createElement("form");        
            	form.action = "answerExam";        
            	form.method = "post";        
            	form.style.display = "none";        
            	var opt = document.createElement("input");    
            	opt.name = "selection_answer"
            	opt.value = selection_result;
            	form.appendChild(opt); 
            	
            	var opt = document.createElement("input");    
            	opt.name = "multy_answer"
            	opt.value = multys_result;
            	form.appendChild(opt);        
            	
            	var opt = document.createElement("input");    
            	opt.name = "textblank_answer"
            	opt.value = textBlanks_result;
            	form.appendChild(opt);        
            	
            	var opt = document.createElement("input");    
            	opt.name = "AandQ_answer"
            	opt.value = AandQs_result;

            	form.appendChild(opt);   
            	
            	var opt = document.createElement("input");    
            	opt.name = "ExamID";
            	opt.value = <%=request.getAttribute("ExamID")%>;
            	form.appendChild(opt); 
    			
            	document.body.appendChild(form);        

            	form.submit();        
     			
    			
    		})
    	})
    </script>
		       
</div>
</rapid:override>   
<%@ include file="../../../../base.jsp"%>

