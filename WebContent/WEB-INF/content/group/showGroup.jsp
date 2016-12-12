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
         		
         

       
    </div>
</rapid:override>




<%@include file="../PersonalCenter.jsp"%>
