<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  

<rapid:override name="head">  
    <title>添加题目</title>
</rapid:override>  

<!-- 
        <input type="hidden" name="qBaseID" value="" /> -->
<rapid:override name="content"> 
    <%
        String idstr = request.getParameter("qBaseID");
        //int qBaseID = Integer.parseInt(idstr);
        //out.println("jsp请添加到"+qBaseID+"号题库");
        out.println("jsp请添加到"+idstr+"号题库");
    %>
<div class="row clearfix">
        <div class="col-md-12 column">
            <form action="addQuestionPro" class="form-horizontal" role="form">
                <input type="hidden" name="type" value="1" />
                
                <div class="form-group">
                     <label for="context" class="col-sm-2 control-label">题干</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="selection.context" />
                    </div>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="selection.score" />
                    </div>
                </div>
                <div class="form-group">
                     <label for="choose" class="col-sm-2 control-label">选项1</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="selection.A" />
                    </div>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="selection.scoreA" />
                    </div>
                </div>
                <div class="form-group">
                     <label for="choose" class="col-sm-2 control-label">选项2</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="selection.B" />
                    </div>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="selection.scoreB" />
                    </div>
                </div>
                <div class="form-group">
                     <label for="choose" class="col-sm-2 control-label">选项3</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="selection.C" />
                    </div>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="selection.scoreC" />
                    </div>
                </div>
                <div class="form-group">
                     <label for="choose" class="col-sm-2 control-label">选项4</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="selection.D" />
                    </div>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="selection.scoreD" />
                    </div>
                </div>
                <div class="form-group">
                     <label for="choose" class="col-sm-2 control-label">选项5</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="selection.E" />
                    </div>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="selection.scoreE" />
                    </div>
                </div>
                <div class="form-group">
                     <label for="choose" class="col-sm-2 control-label">选项6</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="selection.F" />
                    </div>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="selection.scoreF" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="ans" class="col-sm-2 control-label">答案</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="selection.ans" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                         <button type="submit" class="btn btn-default">确认添加</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</rapid:override>




<%@include file="../../../base.jsp"%>  