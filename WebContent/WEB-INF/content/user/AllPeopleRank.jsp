<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="content">

        <div class="panel panel-info">
                            <div class="panel-heading">点击查看具体详情哦</div>
                            
                            <div class="panel-body">
                                   <div class="list-group">
                                        <s:iterator value="friends">
                                  <br>  ExamID  <s:property value ="ExamID"/> 
                                                <br>                                            
                                                Name：<s:property value="name" /> 
                                                <br>
                                                Score ：<s:property value="Examscore" />
                                                <br>
                                                Rank : <s:property value="rank" />
                                                <br> : 显示该用户的答题详情
                                                                     
                                                <a  class="list-group-item list-group-item-success"
                                                
                                                 href='<s:url action="WantedUserExamDetail"><s:param name="ExamID" value ="ExamID"/> <s:param name="TesttakerID" value ="id"/></s:url>'>
                                                                 
                                            </a>
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                WantedUserExamDetail
                                                
                                                
                                        </s:iterator>

                                    </div>
                            </div>
        </div>
</rapid:override>
<%@ include file="../../../../base.jsp"%>