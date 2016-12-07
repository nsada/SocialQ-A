<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="head">
	<title>添加题目</title>
</rapid:override>

<rapid:override name="content">
	<%
        String idstr = request.getParameter("qBaseID");
        int qBaseID = Integer.parseInt(idstr);
        out.println("添加题目到"+qBaseID+"号题库");
    %>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="addQuestionPro" method="POST" class="form-horizontal"
				role="form">
				 <input type="hidden" name="type" value="1" />
				 <input type="hidden"name="qBaseID" value="<%=qBaseID%>" />
				 <input id="num" style="display: none;"value= 2 />
				<div class="form-group">
					<label for="context" class="col-sm-2 control-label">题干</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="selection.context" ></textarea> 
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="selection.score" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项1</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.A" />
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="selection.scoreA" />
					</div>
				</div>
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项2</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.B" />
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="selection.scoreB" />
					</div>
				</div>
				<div  id = "s3" style="display: none;"class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项3</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.C" />
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="selection.scoreC" />
					</div>
				</div>
				<div id="s4"style="display: none;"class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项4</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.D" />
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="selection.scoreD" />
					</div>
				</div>
				<div  id = "s5"style="display: none;"class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项5</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.E" />
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="selection.scoreE" />
					</div>
				</div>
				<div  id = "s6"style="display: none;"class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项6</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.F" />
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="selection.scoreF" />
					</div>
				</div>
				
					
				<div class="form-group">
					<label for="ans" class="col-sm-2 control-label">答案</label>
					<div class="col-sm-8">
						<input name="selection.ans" type="radio" value="A" checked/>A &nbsp;  
						<input name="selection.ans" type="radio" value="B" />B &nbsp; 
						<input  id = "a3"disabled="disabled" name="selection.ans" type="radio" value="C" />C &nbsp; 
						<input  id = "a4"disabled="disabled"name="selection.ans" type="radio" value="D" />D &nbsp; 
						<input id = "a5" disabled="disabled"name="selection.ans" type="radio" value="E" />E &nbsp; 
						<input  id = "a6"disabled="disabled"name="selection.ans" type="radio" value="F" />F &nbsp; 
					
					</div>
				</div>
				<div class="form-group">
					<label for="ans" class="col-sm-2 control-label">解析</label>
					<div class="col-sm-8">
						<textarea type="text" class="form-control" name="selection.analysis" ></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">确认添加</button>
						<a id="AddSelection" onclick="AddSelect()"class="btn btn-default">添加选项</a>
					</div>
				</div>
			</form>
			<script>
				function AddSelect(){
					var num = document.getElementById("num").value;
					switch(num){
						case "2":
							document.getElementById("s3").style.display = "block";
							document.getElementById("a3").disabled = false;
							document.getElementById("num").value="3";
							break;
						case "3":
							document.getElementById("s4").style.display = "block";
							document.getElementById("a4").disabled = false;
							document.getElementById("num").value="4";
							break;
						case "4":
							document.getElementById("s5").style.display = "block";
							document.getElementById("a5").disabled = false;
							document.getElementById("num").value="5";
							break;
						case "5":
							document.getElementById("s6").style.display = "block";
							document.getElementById("a6").disabled = false;
							document.getElementById("num").value="6";
							var a = document.getElementById("AddSelection");
							a.disabled="disabled";
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
