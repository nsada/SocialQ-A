
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">
    <title>搜索试卷</title>
</rapid:override>

<rapid:override name="content">

					<div class="col-sm-1"></div>
					<div class="col-sm-7">
                        <input type="text" class="form-control" name="searchstr" />
            		</div>
            		<div class="col-sm-4">
            						<button  class="btn btn-default" onclick="SearchExamByName()">按题目搜索</button>
            						<button  class="btn btn-default" onclick = "SearchExamByNum()">按编号搜索</button>       
            		</div>   

	<script>
			function SearchExamByName(){
				form = document.createElement("form");
				form.action = "ShowExam";
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
			function SearchExamByNum(){
				form = document.createElement("form");
				form.action = "ShowExam";
				form.method = "post";
				form.style.display = "none";
				var input = document.getElementsByName("searchstr")[0];
				form.appendChild(input);
				input = document.createElement("input");
				input.name = "searchtype";
				input.value = 0;
				form.appendChild(input);
				form.submit();
				
			}
	</script>

</rapid:override>



<%@ include file="../../../base.jsp"%>