<%@page import="domain.QuestionBase"%>
<%@page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
    <title>工作组</title>
</rapid:override>


<rapid:override name="contentText">
    <div class="col-md-9 column">
    	<div class="panel panel-primary">
  				<div class="panel-heading">
    					<h1 class="panel-title">工作组</h1>
 			 	</div>
  				<div class="panel-body">
  					<div class="panel panel-info">
  						<div class="panel-heading">
    						工作组基本信息
 			 			</div>
 			 			<div class="panel-body">
 			 				工作组名：${group.name}<br>
    						工作组描述：${group.description}
 			 			</div>
 			 		</div>
 			 		<div class="panel panel-info">
  						<div class="panel-heading">
    						工作组成员
 			 			</div>
 			 			<div class="panel-body">
 			 				<ul class="list-group">
  								<s:iterator value="groupusers" var="guser">
                        			<li class="list-group-item">${guser.name}</li>
               	 				</s:iterator>
							</ul>
							<div style="float: right;"class="btn-group">
  								<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
    								选择用户添加入工作组 <span class="caret"></span>
  								</button>
  								<ul class="dropdown-menu" role="menu">
    								<s:iterator value="users" var="u">
                       	 				<li>
                       	 					<a href='<s:url action="addGroupUser"><s:param name="groupID" value="group.id"/><s:param name="adduserID" value="#u.id"/></s:url>'>${u.name}</a>
                       	 				</li>
                    				</s:iterator> 
  								</ul>
							</div>
 			 			</div>
 			 		</div>
  				</div>
		</div>  
         		
         

<<<<<<< HEAD
       
=======
    <div class="col-md-10 column">
        <h1>${group.name}</h1>
        ${group.description}
         <div class="text-align:right">
	        <button class="btn btn-default" type="button" onclick="window.location.href='GroupInsertExam?groupID=${group.id}'">
	               工作组出题
	        </button> 
        </div>

        <div class="text-align:right">
            <li class="dropdown" style="margin-top: 5px">
                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        选择用户添加入工作组<b class="caret"></b>
                 </a>
                 <ul class="dropdown-menu">
                    <s:iterator value="users" var="u">
                        <button><a href='<s:url action="addGroupUser"><s:param name="groupID" value="group.id"/><s:param name="adduserID" value="#u.id"/></s:url>'>${u.name}</a></button>
                    </s:iterator> 
                </ul>
            </li>      
        </div>
        <table class="table table-bordered table-hover ">
            <caption>工作组成员</caption>
            <tbody>
                <s:iterator value="groupusers" var="guser">
                    <tr>
                        <td>${guser.name}</td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
	    <table class="table table-bordered table-hover ">
	        <caption><h1>工作组题库</h1></caption>
		    <div class="text-align:right">
	            <li class="dropdown" style="margin-top: 5px">
	                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                        选择题库添加入工作组<b class="caret"></b>
	                 </a>
	                 <ul class="dropdown-menu">
	                    <s:iterator value="userqBases" var="uqBase">
	                        <button><a href='<s:url action="addGroupQuestionBase"><s:param name="groupID" value="group.id"/><s:param name="qBaseID" value="#uqBase.id"/></s:url>'>${uqBase.title}</a></button>
	                    </s:iterator> 
	                </ul>
	            </li>      
	        </div>
	        <thead>
	            <tr>
	                <th style="text-align:center;">题库名称</th>
	                <th style="text-align:center;">题库描述</th>
	                <th style="text-align:center;">操作</th>
	            </tr>
	        </thead>
	        <tbody>
	            <s:iterator value="questionBases" var="qBase">
	                <tr>
	                    <td style="text-align:center;"><a href='<s:url action="showQuestionBase"><s:param name="qBaseID" value="#qBase.id"/></s:url>'>${qBase.title}</a></td>                    
	                    <td style="text-align:center;">${qBase.description}</td>                     
	             <%--        <td style="text-align:center;">
	                        <a href='<s:url action="delGroupQuestionBase?groupID=${groupID}&qBaseID=${qBase.id}">
	                        </s:url>'><input type="button" value="删除"/></a>
	                    </td> --%>
	                </tr>           
	            </s:iterator>
	        </tbody>
	    </table>     
>>>>>>> 9a93c686730d2f844b3b14fdd7f936177a9ab3c9
    </div>
</rapid:override>




<%@include file="../PersonalCenter.jsp"%>
