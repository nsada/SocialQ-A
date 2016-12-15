<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>   
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="head">  
    <title>我的工作组</title>
</rapid:override>  


<rapid:override name="content"> 
	<ul class="list-group">
		<s:iterator value="groups" var="group">
  			<li class="list-group-item list-group-item-warning">
  				
  				<h2 style="position:relative;left: 10%">工作组名：${group.name}</h2>
  				<p style="position:relative;left: 10%">工作组描述：${group.description}</p>
  				<div style="width: 35%;position: relative;left: 65%;">
  					<p>
  						操作：
  						<a href="/SocialQ-A/showGroup.action?groupID=3"class="button button-glow button-rounded button-highlight button-small">工作组详情</a>
  						<button class="button button-glow button-rounded button-royal button-small" type="button" onclick="window.location.href='GroupInsertExam?groupID=3'">
			    			出题
			    		</button> 
                		<a href="/SocialQ-A/quitGroup.action?groupID=3"class="button button-glow button-rounded button-caution button-small">退出</a>
                	</p>
  					
  				</div>
  				
  			</li>
  		</s:iterator>
	</ul>
	 <div class="text-align:right" style="float:right;">
        <button class="button button-glow button-circle button-action button-jumbo button-small" type="button" onclick="window.location.href='addGroup'">
               <span class="glyphicon glyphicon-plus"></span>
        </button> 
    </div>
</rapid:override>




<%@include file="../../../base.jsp"%>
