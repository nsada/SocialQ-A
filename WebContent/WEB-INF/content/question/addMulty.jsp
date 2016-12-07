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
		
		
		
		
			<form id="form"action="addQuestionPro" method="POST" class="form-horizontal"
				role="form">
				<input type="hidden" name="type" value="4" /> 
				<input type="hidden" name="qBaseID" value="<%=qBaseID%>" />
				<input id="num" style="display: none;"value= 2 />
				<div class="form-group">
				
					<label for="context" class="col-sm-2 control-label"></label>
					<div class="col-sm-6">
						
					</div>
					<div class="col-sm-1">
						分数:
					</div>
				</div>
				
				<div class="form-group">
					<label for="context" class="col-sm-2 control-label">题干</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="multy.context" />
					</div>
					<div class="col-sm-1">
						<input type="text" class="form-control" name="multy.score" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项1</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="multy.A" />
					</div>
				</div>
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项2</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="multy.B" />
					</div>
				</div>
				<div class="form-group"  id = "s3" style="display: none;">
					<label for="choose" class="col-sm-2 control-label">选项3</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="multy.C" />
					</div>
				</div>
				<div class="form-group" id = "s4" style="display: none;">
					<label for="choose" class="col-sm-2 control-label">选项4</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="multy.D" />
					</div>
				</div>
				<div class="form-group" id = "s5" style="display: none;">
					<label for="choose" class="col-sm-2 control-label">选项5</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="multy.E" />
					</div>
				</div>
				<div class="form-group" id = "s6" style="display: none;">
					<label for="choose" class="col-sm-2 control-label">选项6</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="multy.F" />
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
					<label for="ans" class="col-sm-2 control-label">答案</label>
					<div class="col-sm-8">

						<input class="multy.ans" type="checkbox" value="A" checked/>A &nbsp;  
						<input class="multy.ans" type="checkbox" value="B" />B &nbsp; 
						<input  id = "a3"disabled="disabled" class="multy.ans" type="checkbox" value="C" />C &nbsp; 
						<input  id = "a4"disabled="disabled"class="multy.ans" type="checkbox" value="D" />D &nbsp; 
						<input id = "a5" disabled="disabled"class="multy.ans" type="checkbox" value="E" />E &nbsp; 
						<input  id = "a6"disabled="disabled"class="multy.ans" type="checkbox" value="F" />F &nbsp; 
					</div>
				</div>
				<div class="form-group">
					<label for="ans" class="col-sm-2 control-label">解析</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="multy.analysis" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<a  class="btn btn-default" onclick ="Submit()">确认添加</a>
					
					</div>
				</div>
			</form>
			<script>
				function Submit(){
					var form = document.getElementById("form");
					var answer  = document.getElementsByClassName('multy.ans');
					var str="";
					for(var i =0 ; i < answer.length;i++){
						if(answer[i].checked)
							str+="1";
						else
							str+="0";
					}
					var opt = document.createElement("input");    
	            	opt.name = "multy.ans"
	            	opt.value = str;
	            	form.appendChild(opt);        
	            	form.submit();
					return;
				}
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
						case "6":
							alert("最多有6个选项！");
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
