
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
	<title>添加单选题</title>
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
				 <input type="hidden" name="type" value="1" />
				 <input type="hidden"name="qBaseID" value="<%=qBaseID%>" />
				 <input id="num" style="display: none;"value= 2 />
				 
				 <div class="form-group">
					<label for="context" class="col-sm-2 control-label"></label>
					<div class="col-sm-6">
						
					</div>
					<div class="col-sm-1">
						分数:
						
					</div>
					<div class="col-sm-2">
							是否统一分数:
    						<input id = "tongyi" onclick="tongyifenshu()"type="checkbox" checked />
					</div>
					
				</div>
				
				<div class="form-group">
					<label for="context" class="col-sm-2 control-label">题干</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="selection.context" ></textarea> 
					</div>
					<div class="col-sm-1">
						<input id="ctotal" type="text" class="form-control" name="selection.score" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项1</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.A" />
					</div>
					<div class="col-sm-1">
						<input id="c1" disabled="disabled" type="text" class="form-control" name="selection.scoreA" />
					</div>
				</div>
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项2</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.B" />
					</div>
					<div class="col-sm-1">
						<input id="c2" disabled="disabled" type="text" class="form-control" name="selection.scoreB" />
					</div>
				</div>
				<div  id = "s3" style="display: none;"class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项3</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.C" />
					</div>
					<div class="col-sm-1">
						<input id="c3"disabled="disabled"type="text" class="form-control" name="selection.scoreC" />
					</div>
				</div>
				<div id="s4"style="display: none;"class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项4</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.D" />
					</div>
					<div class="col-sm-1">
						<input id="c4"disabled="disabled"type="text" class="form-control" name="selection.scoreD" />
					</div>
				</div>
				<div  id = "s5"style="display: none;"class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项5</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.E" />
					</div>
					<div class="col-sm-1">
						<input id="c5"disabled="disabled"type="text" class="form-control" name="selection.scoreE" />
					</div>
				</div>
				<div  id = "s6"style="display: none;"class="form-group">
					<label for="choose" class="col-sm-2 control-label">选项6</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="selection.F" />
					</div>
					<div class="col-sm-1">
						<input id="c6"disabled="disabled" type="text" class="form-control" name="selection.scoreF" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="choose" class="col-sm-2 control-label">
						<a onclick="AddSelect()"class="button button-caution button-circle button-small">
							<span class = "glyphicon glyphicon-plus" ></span>
						</a>
					</label>
				</div>
				
				
					
				<div class="form-group">
					<label for="ans" class="col-sm-2 control-label">答案</label>
					<div class="col-sm-8">
						<input id="a1" name="selection.ans" type="radio" value="1" checked/>A &nbsp;  
						<input id="a2" name="selection.ans" type="radio" value="2" />B &nbsp; 
						<input  id = "a3"disabled="disabled" name="selection.ans" type="radio" value="3" />C &nbsp; 
						<input  id = "a4"disabled="disabled"name="selection.ans" type="radio" value="4" />D &nbsp; 
						<input id = "a5" disabled="disabled"name="selection.ans" type="radio" value="5" />E &nbsp; 
						<input  id = "a6"disabled="disabled"name="selection.ans" type="radio" value="6" />F &nbsp; 
					
					</div>
				</div>
				<div class="form-group">
					<label for="ans" class="col-sm-2 control-label">解析</label>
					<div class="col-sm-8">
						<textarea class="form-control" name="selection.analysis" ></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">确认添加</button>
						
					</div>
				</div>
			</form>
			<script>
				function tongyifenshu(){
					var tongyi = document.getElementById("tongyi");
					if(tongyi.checked){
						for(var i =1;i <=6;i++){
							temp = document.getElementById("c"+i);
							temp.disabled = "disabled";
							temp.value = "";
							temp = document.getElementById("a"+i);
							temp.value = i.toString(); 
						}
						var temp = document.getElementById("ctotal");
						temp.disabled=null;
						temp.value ="";
						var num = document.getElementById("num").value;
						switch(num){
						case "6":
							document.getElementById("a6").disabled = false;
						case "5":
							document.getElementById("a5").disabled = false;
						case "4":
							document.getElementById("a4").disabled = false;
						case "3":
							document.getElementById("a3").disabled = false;
						case "2":
							document.getElementById("a2").disabled = false;
						default:
							document.getElementById("a1").disabled = false;
						}
						
					}
					else{
						for(var i =1;i <=6;i++){
							var temp = document.getElementById("c"+i);
							temp.disabled = null;
							temp = document.getElementById("a"+i);
							temp.value = "0"; 
						}
						var temp = document.getElementById("ctotal");
						temp.disabled="disabled";
						temp.value ="";
						var list = document.getElementsByName("selection.ans");
						for(var i =0;i <list.length;i++){
							list[i].disabled="disabled";
						}
					}
						
					return ;
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
