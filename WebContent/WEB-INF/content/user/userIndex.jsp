
<%@page import="tencentApi.globalVar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">
    <title>用户信息</title>
</rapid:override>


<rapid:override name="contentWithoutWhiteBox">
    <div class=" column container table-center well well-lg" style = "width: 50%;position: relative;top: 30px;">
        <h2>基本信息</h2>
        <p>用户名: ${user.name}</p>
        <p>邮箱：${user.mail}</p>
        <%if((int)request.getAttribute("isFriend") ==0){ %>
        <a href='<s:url action="addFriend"><s:param name="friendID" value ="user.id"/></s:url>'
                                        class="button button-glow button-pill button-action button-tiny"
                                        style="position: relative;left: 80%;"
                                        >
                                          申请好友
                                    </a>
                                    <%}else{ %>
                                    <button disabled = "disabled"
                                        class="button button-glow button-pill button-action button-tiny"
                                        style="position: relative;left: 80%;"
                                        >
                                          互为好友
                                    </button>
                                    <%} %>
                                    
        <div class="panel panel-info">
            <div class="panel-heading">发布过的所有测试</div>
                <div class="panel-body">
                    <div class="list-group">

                        <s:iterator value="PublishedExams">
                            <p>
                                                    标题：<s:property value="title" /> <br>
                                                    描述：<s:property value="description" />
                            </p>
                            <a  class="button button-primary button-rounded button-small" 
                            href='<s:url action="ShowExam"><s:param name="ExamID" value ="id"/></s:url>'>
                                                    参与测试
                            </a>
                        </s:iterator>

                    </div>
                </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">回答过的所有测试</div>
                <div class="panel-body">
                    <div class="list-group">

                        <s:iterator value="AnsweredExams">
                            <p>
                                                    标题：<s:property value="title" /> <br>
                                                    描述：<s:property value="description" />
                            </p>
                            <a  class="button button-primary button-rounded button-small" 
                            href='<s:url action="ShowExam"><s:param name="ExamID" value ="id"/></s:url>'>
                                                    我也试试
                            </a>
                        </s:iterator>

                    </div>
                </div>
        </div>        
    </div>
</rapid:override>



<%@include file="../../../base.jsp"%>
