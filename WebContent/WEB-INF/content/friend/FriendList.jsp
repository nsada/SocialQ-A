
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<rapid:override name="head">
    <title>好友列表</title>
</rapid:override>

<rapid:override name="content">

		<form action="searchUser" method="POST" class="form-horizontal" role="form">
                <div class="form-group">
                	<div class="col-sm-2"></div>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="searchname" />
                    </div>
                    <div class="col-sm-2">
                        <button type="submit" class="button button-pill button-primary button-small">搜索用户</button>
                    </div>
                    
                </div>
            </form>   
            
       		<%if(request.getAttribute("users")!=null){ %>   
            	<div class="panel panel-primary" style="width: 70%;position: relative;left: 15%">
					<div class="panel-heading" style=" text-align: center;">搜索结果</div>
  					<div class="panel-body">
    					<div class="list-group">
    						<s:iterator value="users" var="u">        
                    			<li class = "searchuser list-group-item"> 
                        			<s:property value="name"/>
                        			<a href='<s:url action="showFriendInformation"><s:param name="friendID" value ="#u.id"/></s:url>'
                        				class="button button-glow button-circle button-action button-tiny"
                        				style="float: right;">
            查看用户信息
                        			</a>
                    			</li>               
                			</s:iterator>
							
						</div>
  					</div>
				</div>
			<%} %>

			
         
                
  
	<div class="panel panel-success">
		<div class="panel-heading">本地好友</div>
  		<div class="panel-body">
    		<div class="list-group">

    			 <s:iterator value="friends" var="fri">        
                      
                          <li  class="list-group-item">
                          
    							<s:property value="name"/>
                            	<a 	href='<s:url action="delFriend"><s:param name="friendID" value ="#fri.id"/></s:url>'  
                            			style="float:right;"
                            			class="button button-pill button-caution button-small">
                                                    删除好友
                                 </a>
  						  </li>
                    </s:iterator>
  				
			</div>
  		</div>
	</div>
	<div class="panel panel-warning">
		<div class="panel-heading">微博粉丝</div>
  		<div class="panel-body">
    		<div class="list-group">
    			<s:iterator value="weibofriends">           
                      <a  class="list-group-item">
    						<s:property value="B"/>
                            <button class = "biao button button-pill button-action button-small">邀请该好友</button>
  					  </a>
                    </s:iterator>			
			</div>
  		</div>
	</div>
            
            


</rapid:override>



<%@ include file="../../../base.jsp"%>