
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">
    <title>搜索试卷</title>
</rapid:override>

<rapid:override name="contentWithoutWhiteBox">

					<div class="col-sm-2"></div>
					<div class="col-sm-8" style = "position: relative;top: 50px;">
						 <div class="input-group">
						      <input type="text" class="form-control" name="searchstr" />
						      <span class="input-group-btn">
						        		<button  class="btn btn-warning" onclick="SearchExamByName()">按题目搜索</button>
						      </span>
						      
						 </div><!-- /input-group -->
						 <br><br>
                       	 <div class="panel panel-info">
					            <div class="panel-heading">搜索结果</div>
					                <div class="panel-body">
					                    <div class="list-group">	 
					                        <s:iterator value="exams">
					                        		<li class="list-group-item">
					                        				
								                                           <h4>标题：<s:property value="title" /></h4>
								                                           <p>描述：<s:property value="description" /> </p>
												                            <a  	class="button button-primary button-rounded button-small" 
												                            		style="position: relative;left:80%"
												                            		href='<s:url action="ShowExam"><s:param name="ExamID" value ="id"/></s:url>'>
												                                                    参与测试
								                            				</a>
													 </li>
					                            
					                        </s:iterator>
					
					                    </div>
					                </div>
					        </div>
            		</div>
            		<div class="col-sm-2"></div>
            		
        

	<script>
			function SearchExamByName(){
				form = document.createElement("form");
				form.action = "SearchExam";
				form.method = "post";
				form.style.display = "none";
				var input = document.getElementsByName("searchstr")[0];
				form.appendChild(input);
				input = document.createElement("input");
				input.name = "searchtype";
				input.value = 1;
				form.appendChild(input);
		
				form.submit();
				
			}
// 			function SearchExamByNum(){
// 				form = document.createElement("form");
// 				form.action = "ShowExam";
// 				form.method = "post";
// 				form.style.display = "none";
// 				var input = document.getElementsByName("searchstr")[0];
// 				form.appendChild(input);
// 				input = document.createElement("input");
// 				input.name = "searchtype";
// 				input.value = 0;
// 				form.appendChild(input);
// 				form.submit();
				
// 			}
	</script>

</rapid:override>



<%@ include file="../../../base.jsp"%>