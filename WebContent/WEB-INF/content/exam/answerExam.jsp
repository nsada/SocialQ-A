<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>   
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <title>答题</title>
    <script src="<%=request.getContextPath()%>/js/jquery-3.1.1.js"></script>
    
</head>
<body>

    <div>
        examID: <% int examID=Integer.parseInt(request.getParameter("examID")); out.println(examID); %> <br/>
        title: ${exam.title} <br/>
        description: ${exam.description} <br/>
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
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="A">
			                        </span>
			                        <span class="choose-index">A:<s:property value = "A"/></span>    
			            </s:if>
		                <s:if test="B.length()>0">
			                        <span>
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="B">
			                        </span>
			                        <span class="choose-index">B:<s:property value = "B"/></span>
			               
			            </s:if>
			            <s:if test="C.length()>0">
			                        <span>
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="C">
			                        </span>
			                        <span class="choose-index">C:<s:property value = "C"/></span>
			                  
			            </s:if>
			            <s:if test="D.length()>0">
			                        <span>
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="D">
			                        </span>
			                        <span class="choose-index">D:<s:property value = "D"/></span>
			                 
			            </s:if>
			            <s:if test="E.length()>0">
			                        <span>
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="E">
			                        </span>
			                        <span class="choose-index">E:<s:property value = "E"/></span>
			                   
			            </s:if>
			            <s:if test="F.length()>0">
			                        <span>
			                            <input type="radio" name="choose<%=i %>" class="choose" id ="<%=i %>" value="F">
			                        </span>
			                        <span class="choose-index">F:<s:property value = "F"/></span> 
			            </s:if>

		</s:iterator>
	
			        <button class = "submit_result" >确认提交</button> 
		       
	    </div>
	    <script>
    	function post(URL, PARAMS) {        
        	var temp = document.createElement("form");        
        	temp.action = URL;        
        	temp.method = "post";        
        	temp.style.display = "none";        
        	for (var x in PARAMS) {        
            	var opt = document.createElement("textarea");        
            	opt.name = x;        
            	opt.value = PARAMS[x];        
            // alert(opt.name)        
            	temp.appendChild(opt);        
        	}        
        	document.body.appendChild(temp);        
        	temp.submit();        
        	return temp;        
    	} 
    	var jq = jQuery.noConflict();
    	jq(document).ready(function(){
    		jq(".submit_result").click(function(){
    			var selection_result = ""; 
    			var num = <%=i%>
    			for(var i =1 ; i <= num ; i ++){
    				var temp = jq("input[name='choose'"+i+"]:checked").val();
    				selection_result += temp + "#";
    			}
    				
    			post("/Answerexam.action",selection_result);
    		})
    	})
    </script>
</body>
</html>
