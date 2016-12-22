
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
	<title>添加填空题</title>
</rapid:override>

<rapid:override name="content">
	<%
        String idstr = request.getParameter("qBaseID");
        int qBaseID = Integer.parseInt(idstr);
        //out.println("添加题目到"+qBaseID+"号题库");
    %>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="addQuestionPro" method="POST" class="form-horizontal"
				role="form">
				<input type="hidden" name="type" value="2" /> 
				<input type="hidden"name="qBaseID" value="<%=qBaseID%>" />
				<input type="hidden" name="textBlank.num" id="textBlankNum" value ="1"/>
					
					
				<div class="form-group">
					<label for="context" class="col-sm-2 control-label">题干</label>
					<div class="col-sm-4">
						<textarea  class="form-control" name="textBlank.context" ></textarea>
					</div>
					<label for="context" class="col-sm-2 control-label">分数</label>
					<div class="col-sm-1">
						<input type="text" class="form-control" name="textBlank.score" />
					</div>
				</div>

				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">空1</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.A" />
					</div>
				</div>
				<div class="form-group" style="display: none;" id="t2">
					<label for="choose" class="col-sm-2 control-label">空2</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.B" />
					</div>
				</div>
				<div class="form-group" style="display: none;" id="t3">
					<label for="choose" class="col-sm-2 control-label">空3</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.C" />
					</div>
				</div>
				<div class="form-group"style="display: none;" id="t4">
					<label for="choose" class="col-sm-2 control-label">空4</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.D" />
					</div>
				</div>
				<div class="form-group"style="display: none;" id="t5">
					<label for="choose" class="col-sm-2 control-label">空5</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.E" />
					</div>
				</div>
				<div class="form-group"style="display: none;" id="t6">
					<label for="choose" class="col-sm-2 control-label">空6</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="textBlank.F" />
					</div>
				</div>
				<div class="form-group" >
					<label for="choose" class="col-sm-2 control-label">
						<a  onclick="AddSelect()"class="button button-caution button-circle button-small">
							<span class = "glyphicon glyphicon-plus" ></span>
						</a>
					</label>
				</div>
				<div class="form-group">
					<label for="ans" class="col-sm-2 control-label">解析</label>
					<div class="col-sm-8">
						<textarea  class="form-control" name="textBlank.analysis" ></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">确认添加</button>
					</div>
				</div>
			</form>
			
			<script>
				
				function AddSelect(){
					var num = document.getElementById("textBlankNum").value;
					switch(num){
						case "1":
							document.getElementById("t2").style.display = "block";
							document.getElementById("textBlankNum").value="2";
							break;
						case "2":
							document.getElementById("t3").style.display = "block";
							document.getElementById("textBlankNum").value="3";
							break;
						case "3":
							document.getElementById("t4").style.display = "block";
							document.getElementById("textBlankNum").value="4";
							break;
						case "4":
							document.getElementById("t5").style.display = "block";
							document.getElementById("textBlankNum").value="5";
							break;
						case "5":
							document.getElementById("t6").style.display = "block";
							document.getElementById("textBlankNum").value="6";
							var a = document.getElementById("AddSelection");
							break;
						case "6":
							alert("最多有6个空！");
							break;
							
						default:
					}
					return ;
				}
			</script>
			
			
			
			
		</div>
	</div>
</rapid:override>




<%@include file="../../../base.jsp"%>
