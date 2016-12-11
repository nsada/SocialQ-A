<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">
    <title>好友答题情况</title>
</rapid:override>
<rapid:override name="content">
        <div>
        
            <h2 style="text-align: center;">${exam.title}</h2>
            <p style="text-align: center;"> ${exam.description}</p>
            得分: ${score} </br>
            排名: ${rank} </br>
    </div>

              
</div>
</rapid:override>   
<%@ include file="../../../../base.jsp"%>

