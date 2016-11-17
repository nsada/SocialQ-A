<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>   
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <title>答题</title>
</head>
<body>
    <div class="row clearfix">     
        <div class="col-md-12 column">
	        <form action="answerExamPro" class="form-horizontal" role="form">
	            <input type="hidden" name="examID" value="examID" />
	            <s:iterator value="selections" var="sel">
		            <div class="questionContainer">
		                <s:if test="#sel.num>0">
		                    <div class="choose panel">
				                <div class="col-xs-1"></div>
				                <div class="col-xs-10">
			                        <span>
			                            <input type="radio" name="choose" class="radioOption" value="A">
			                        </span>
			                        <span class="choose-index">A</span>
			                        <div class="choose-label">${sel.A}</div>
				                </div>
				                <div class="col-xs-1"></div>
			                </div>
			            </s:if>
		                <s:elseif test="#sel.num>1">
		                    <div class="choose panel">
			                    <div class="col-xs-1"></div>
			                    <div class="col-xs-10">
		                            <span>
		                                <input type="radio" name="choose" class="radioOption" value="B">
		                            </span>
		                            <span class="choose-index">B</span>
		                            <div class="choose-label">${sel.B}</div>
		                        </div>
		                        <div class="col-xs-1"></div>
		                    </div>		            
		                </s:elseif>
		            </div>
	            </s:iterator>
	        
		        <div class="text-align:right">
			        <button class="btn btn-default btn-primary button-center" type="submit">确认提交</button> 
		        </div>
		    </form>
	    </div>
    </div>
</body>
</html>
