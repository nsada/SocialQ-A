<<<<<<< HEAD

 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="content">
    <p>点击选择我要插入的题库</p>
    <table border="1">
        <p>当前试卷的ID<s:property value="ExamID" /></p>     
      <s:form action="answerExam" method="post">
     ExamID:     <s:textfield name="ExamID"/> 
     <br>
     selection_answer:    <s:textfield name="selection_answer"/> 
     <br>
      text_blank:   <s:textfield name="textblank_answer"/> 
      <br>
     multy_answer:   <s:textfield name="multy_answer"/> 
     <br>
     AandQ_answer:   <s:textfield name="AandQ_answer"/> 
        <s:submit value="Input Author Name"/>
    </s:form>
    
    </table>
</rapid:override>
<%@ include file="../../../../base.jsp"%>
=======

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">
	<title>答题</title>
    <script>
    	var jq = jQuery.noConflict();
    	jq(document).ready(function(){
    		jq(".submit_result").click(function(){
    			var selection_result = ""; 
    			jq(".choose").each(function(){
    				var valu = this.value;
    				selection_result += valu + "#";	
    				selection_result = selection_result.substring(0,selection_result.length()-1);
    			})
    			jq.post("<%=request.getContextPath()%>/submitAnswer.action", {selection_answer : selection_result})
    		})
    	})
    </script>
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
		<s:iterator value="textBlanks" >			
		</s:iterator>
		<div>
			<span class="button-wrap" style="float:right;">
    				<button class="button button-pill button-raised button-primary submit_result">确认提交</button>
  			</span>  
		</div>
		      
		       
	    </div>
</rapid:override>   
<%@ include file="../../../../base.jsp"%>

>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
