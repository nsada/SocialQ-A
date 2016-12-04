<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<rapid:override name="head">
	<title>好友列表</title>
	<style type="text/css">
	div.biao { 
		margin: 20px; 
		} 

	ul.biao { 
	
		list-style-type: none; 
		width: 100%; 
		} 

	h3.biao { 
		font: bold 20px/1.5 Helvetica, Verdana, sans-serif; 
		} 
	button.biao{
		float:right;
	}
	img.biao { 
		float: left; 
		margin: 0 15px 0 0; 
		width:100px;
		height:100px
		} 
		p.biao { 
			font: 200 12px/1.5 Georgia, Times New Roman, serif; 
		} 

	li.biao { 
		padding: 10px; 
		overflow: auto; 
	} 

	li:hover { 
		background: #eee; 
		cursor: pointer; 
		}
	
	</style>
</rapid:override>



<rapid:block name="">
		<h2 style = "position:relative;left:2.5%">本地好友 </h2>
            <div class ="biao"> 
				<ul class = "biao"> 
					<s:iterator value="friends">   		
						<li class = "biao"> 
							<img class = "biao" src="<%=request.getContextPath()%>/images/background.jpg"/> 
							<h3 class = "biao"><s:property value="name"/></h3> 
							<p class = "biao">详细信息</p> 
							<button class = "biao">删除该好友</button>
						</li> 				
							
					</s:iterator>
					
				</ul> 
			</div>
           	<h2 style = "position:relative;left:2.5%">微博粉丝 </h2>
           	<div class ="biao"> 
				<ul class = "biao"> 
					<s:iterator value="WeiboFriends">   		
						<li class = "biao"> 
							<img class = "biao" src="<%=request.getContextPath()%>/images/background.jpg"/> 
							<h3 class = "biao"><s:property value="name"/></h3> 
							<p class = "biao">详细信息</p> 
							<button class = "biao">邀请该好友</button>
						</li> 				
							
					</s:iterator>
					
				</ul> 
			</div>
</rapid:block>
	

           


