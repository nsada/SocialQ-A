<%@page import="domain.QuestionBase"%>
<%@page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
    <title>工作组</title>
</rapid:override>



<rapid:override name="contentWithoutWhiteBox">
<div class = "container table-center" style="position: relative;top:20px;">


<%
        int userid;
        if (session.getAttribute("userid")!=null){
            userid = (int)session.getAttribute("userid");
        }else{
            userid = 0;
        }
%>

    	<div class="panel panel-primary">
  				<div class="panel-heading">
    					<h2>工作组</h2>
 			 	</div>
  				<div class="panel-body">
  				
  					<div class="panel panel-info">
  						<div class="panel-heading">
    						<h3>工作组基本信息</h3>
 			 			</div>
 			 			<div class="panel-body">
 			 				工作组名：${group.name}<br>
    						工作组描述：${group.description}
 			 			</div>
 			 		</div>
 			 		
 			 		<div class="panel panel-info">
  						<div class="panel-heading">
    						<h3>工作组成员</h3>
 			 			</div>
 			 			<div class="panel-body">
 			 				<ul class="list-group">
  								<s:iterator value="groupusers" var="guser">
                        			<li class="list-group-item list-group-item-warning">${guser.name}</li>
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
 			 		
 			 		<div class="panel panel-info">
  						<div class="panel-heading">
    						<h3>工作组题库</h3>
 			 			</div>
 			 			<div class="panel-body">
										<ul class="list-group">
												<s:iterator value="questionBases" var="qBase">
														<li class="list-group-item list-group-item-warning">
																	<h4 style="position:relative;left: 10%">题库名：${qBase.title}</h4>
  																	<p style="position:relative;left: 10%">题库描述：${qBase.description}</p>
  																	<div style="width: 35%;position: relative;left: 65%;">
  																			<p>
  																				操作：
  																				<a href='<s:url action="showgroupQuestionBase"><s:param name="qBaseID" value="#qBase.id"/></s:url>'class="button button-glow button-rounded button-highlight button-small">题库详情</a>
  																				<s:if test="#qBase.userID=1">
                            															<a href='<s:url action="delGroupQuestionBase"><s:param name="qBaseID" value="#qBase.id"/><s:param name="groupID" value="groupID"/></s:url>' class="button button-glow button-rounded button-caution button-small">删除</a>
                            													</s:if>
                															</p>
  					
  																	</div>
														</li>
												</s:iterator>
										</ul>
										<div style="float: right;"class="btn-group">
  											<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
    											选择题库添加入工作组 <span class="caret"></span>
  											</button>
  											<ul class="dropdown-menu" role="menu">
    											<s:iterator value="userqBases" var="uqBase">
                       	 							<li>
                       	 								<a href='<s:url action="addGroupQuestionBase"><s:param name="groupID" value="group.id"/><s:param name="qBaseID" value="#uqBase.id"/></s:url>'>${uqBase.title}</a>
                       	 							</li>
                    							</s:iterator> 
  											</ul>
										</div>
 			 			</div>
 			 		</div>
 			 		 <div class="text-align:right">
            					<button class="button button-glow button-rounded button-raised button-primary" type="button" onclick="window.location.href='showGroupEvents?groupID=${group.id}'">
                   					查看工作组日志
            					</button> 
        			</div>
  				</div>
		</div>  
 </div>
 
</rapid:override>




<%@include file="../../../base.jsp"%>
