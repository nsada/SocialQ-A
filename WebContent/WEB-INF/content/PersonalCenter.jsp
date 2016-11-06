<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  


<rapid:override name="content">  
<div class="container">
    <div class="row clearfix">
         <div class="col-md-2 column">
            <div class="btn-group btn-group-vertical btn-group-lg">
                 <button class="btn btn-default " type="button" onclick="window.location.href='showPersonalInformation'">
                                    个人信息
                 </button> 
                 <button class="btn btn-default " type="button">
                    <a href='<s:url action="showPersonalInformation"></s:url>'>好友列表</a>
                 </button> 
                 <button class="btn btn-default " type="button">
                    <a href='<s:url action="showPersonalInformation"></s:url>'>工作组</a>
                 </button>
                 <button class="btn btn-default " type="button">
                    <a href='<s:url action="showPersonalInformation"></s:url>'>草稿箱</a>
                 </button>
                 <button class="btn btn-default " type="button" onclick="window.location.href='showUserQuestionBases'">题库
                 </button> 
                 <button class="btn btn-default " type="button">
                    <a href='<s:url action="showPersonalInformation"></s:url>'>发布的试卷</a>
                 </button> 
                 <button class="btn btn-default " type="button">
                    <a href='<s:url action="showPersonalInformation"></s:url>'>答过的试卷</a>
                 </button> 
                 <button class="btn btn-default " type="button">
                    <a href='<s:url action="showPersonalInformation"></s:url>'>个人动态</a>
                 </button> 
            </div>
        </div>
        <rapid:block name="contentText">PersonalInformaion_contentText</rapid:block>         
    </div>
</div>
</rapid:override>  
   
<%@include file="../../../base.jsp"%>  