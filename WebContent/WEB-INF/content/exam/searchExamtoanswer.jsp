
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">
    <title>搜索试卷</title>
</rapid:override>

<rapid:override name="content">
        <form action="ShowExam" method="POST" class="form-horizontal" role="form">
                <div class="form-group">
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="searchstr" />
                    </div>
                    <div class="col-sm-4">
                        <button type="submit" class="btn btn-default">按题目搜索</button>
                        <button type="submit" class="btn btn-default">按编号搜索</button>                        
                    </div>
                    <div class="col-sm-2"></div>
                </div>
            </form>     
            
</rapid:override>



<%@ include file="../../../base.jsp"%>