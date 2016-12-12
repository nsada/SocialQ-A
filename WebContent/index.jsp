<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">
    <title>主页</title>
</rapid:override>
<rapid:override name="contentWithoutWhiteBox">
    <div class="container" style="
    												color: white;
    												position: relative;
    												top: 200px;">

		<ul class="row">
            <h2 class="text-center">Hello! Here is the index of SocialQ-A~</h2>
            <br>
            <h2 class="text-center">If you have any question, please contact with us!</h2>
            <br>
            <h4 class="text-center">
                Email:<span class="text-info">hitnstmy@163.com</span>
            </h4>
            <br>
            <h4 class="text-center">
                Github:<span class="text-info">https://github.com/nsada</span>
            </h4>
            <br>
            <h4 class="text-center">
                Blog:<span class="text-info">http://blog.csdn.net/tmy0131</span>
            </h4>
            <br>
           
        </ul>
  
	</div>
       


</rapid:override>

<%@ include file="base.jsp"%>