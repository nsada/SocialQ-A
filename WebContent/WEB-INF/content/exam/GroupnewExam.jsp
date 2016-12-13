<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>



<rapid:override name="head">
    <script type="text/javascript">
        function insertQ(){
            document.myform.action="FindGroupQbase";
            document.myform.submit(); 
        }
        function SubmitExam(){
            form = document.getElementsByName("myform")[0];         
            opt = document.createElement("input");
            opt.name ="publish";
            opt.value = "1";
            form.appendChild(opt);
            form.submit();
        }
        function SaveToDraft(){
            form = document.getElementsByName("myform")[0];
            
            opt = document.createElement("input");
            opt.name ="publish";
            opt.value = "0";
            form.appendChild(opt);
            form.submit();
        }
        $(document).ready(function(){
        	var list = document.getElementsByClassName("insertedQuestion");
            document.getElementById("numofQuestions").innerHTML=list.length;
            var totalScore = 0;
            for(var i =0; i <list.length;i++){
                totalScore+=parseInt(list[i].id);
            }
            document.getElementById("scoreofQuestions").innerHTML=totalScore.toString();
        })
    </script>
</rapid:override>
<rapid:override name="content">


    <div class = "col-md-3">
        <div style="position: fixed;
                            top: 20%;
                            z-index: 20;
                            width: 250px;">
                <div class="panel panel-success">
                    <div class="panel-heading">试卷信息</div>
                            
                    <div class="panel-body">
                    
                        <p>总题数:<span style="float:right"><span id="numofQuestions" style="color: orange;"></span>道</span></p>
                        <p>总分:<span style="float:right"><span id="scoreofQuestions"style="color: red;"></span>分</span></p>
                        <br/>
                        
    
                        
                        <a  onclick="insertQ()"
                                class="button button-block button-rounded button-primary button-small">
                                插入题目
                        </a>
                        <a    onclick = "SaveToDraft()"
                                class="button button-block button-rounded button-highlight button-small">
                                保存到草稿箱
                         </a>
                        
                         <a     onclick ="SubmitExam()"
                                class="button button-block button-rounded button-action button-small">
                                提交生成我的试卷
                         </a>

                         <a     href='<s:url action="deleteexam"><s:param name="ExamID" value ="ExamID"/> </s:url>'
                                class="button button-block button-rounded button-caution button-small">
                                取消编辑试卷
                         </a>
                          

                    </div>
                </div>
        </div>
    </div>
    <div class = "col-md-9">

            <form name="myform" action="updateexam" method="post">
                
                <div class="panel panel-info">
                    <div class="panel-heading">基本信息</div>
                            
                    <div class="panel-body">
                        <input id="examTitle"name="title" type="text" placeholder="请输入试卷的标题" 
                            value="<s:property value="title" />"        
                            align="center"
                            style="width: 40%; position: relative; left: 30%; top: 10px">
                        <br> <br>

                        <textarea id="examDescription"name="description" placeholder="试卷的描述" size="50"
                            style="height: 50px; width: 60%; position: relative; left: 20%"><s:property value="description" /></textarea>
                        <br>
        
                        <div align="center"
                            style="width: 60%; position: relative; left: 20%;">
                            试卷可见性： 
                            <label class="checkbox-inline"> 
                                <input type="radio"name="joiner"  value="1" checked="">
                                试卷仅好友可见
                            </label> 
                            <label class="checkbox-inline"> 
                                <input type="radio"name="joiner"  value="2"> 试卷所有人可见
                            </label>
                             <br> 
                             排名可见性： 
                             <label class="checkbox-inline"> 
                                    <input type="radio" name="rights"  value="1" checked="">
                                    排名仅好友可见
                            </label>
                            <label class="checkbox-inline"> 
                                <input type="radio" name="rights"  value="2"> 
                                排名所有人可见
                            </label>
                        </div>
                    </div>
                </div>


                <div class="panel panel-info">
                    <div class="panel-heading">单选题</div>
                            
                    <div class="panel-body">
                                <%int i =1; %>
                                <s:iterator value="selections" >
                                    <p class="insertedQuestion"id="<s:property value = 'score'/>"><%=i %>.
                                    
                                    <s:property value="context" />
                                    <a style="float: right;" class="button button-tiny button-glow button-rounded button-caution"
                                        href='<s:url action="DeleteGroupquestion"><s:param name="GroupID" value ="GroupID"/><s:param name="title" value ="title"/><s:param name="description" value ="description"/><s:param name="ExamID" value ="ExamID"/> <s:param name="type" value ="1"/><s:param name="questionID" value ="id"/></s:url>'>
                                        删除题目
                                    </a>
                        
                                    </p>
                                    <%i++; %>
                                </s:iterator>
                    </div>
                </div>
                
                <div class="panel panel-info">
                    <div class="panel-heading">多选题</div>
                            
                    <div class="panel-body">
                                    <% i=1;%>
                                    <s:iterator value="multys">
                                        <p class="insertedQuestion"id="<s:property value = 'score'/>"><%=i %>.
                                            <s:property value="context" />
                                            <a style="float:right;" class="button button-tiny button-glow button-rounded button-caution"
                                                href='<s:url action="DeleteGroupquestion"><s:param name="title" value ="title"/><s:param name="GroupID" value ="GroupID"/><s:param name="description" value ="description"/><s:param name="ExamID" value ="ExamID"/> <s:param name="type" value ="4"/><s:param name="questionID" value ="id"/></s:url>'>
                                                删除题目
                                            </a>
                                        </p>
                                        <%i++; %>
                                    </s:iterator>
                    </div>
                </div>
                
                <div class="panel panel-info">
                    <div class="panel-heading">填空题</div>
                            
                    <div class="panel-body">
                                <% i=1;%>
                                <s:iterator value="textBlanks">
                                    <p class="insertedQuestion"id="<s:property value = 'score'/>"><%=i %>.
                                        <s:property value="context" />
                                        <a style="float:right;" class="button button-tiny button-glow button-rounded button-caution"
                                            href='<s:url action="DeleteGroupquestion"><s:param name="title" value ="title"/><s:param name="GroupID" value ="GroupID"/><s:param name="description" value ="description"/><s:param name="ExamID" value ="ExamID"/> <s:param name="type" value ="2"/><s:param name="questionID" value ="id"/></s:url>'>
                                            删除题目
                                        </a>
                                    </p>
                                    <%i++; %>
                                </s:iterator>
                    </div>
                </div>
                
                
                <div class="panel panel-info">
                    <div class="panel-heading">问答题</div>
                            
                    <div class="panel-body">
                                <% i=1;%>
                                <s:iterator value="AandQs">
                                    <p class="insertedQuestion"id="<s:property value = 'score'/>"><%=i %>.
                                        <s:property value="context" />
                                        <a style="float:right;" class="button button-tiny button-glow button-rounded button-caution"
                                            href='<s:url action="DeleteGroupquestion"><s:param name="title" value ="title"/><s:param name="description" value ="description"/><s:param name="ExamID" value ="ExamID"/> <s:param name="type" value ="3"/><s:param name="GroupID" value ="GroupID"/><s:param name="questionID" value ="id"/></s:url>'>
                                            删除题目
                                        </a>
                                    </p>
                                    <%i++; %>
                                </s:iterator>
                    </div>
                </div>
                <input name="ExamID" type="hidden" value='<s:property  value ="ExamID"/>' />
                <input name="GroupID" type="hidden" value='<s:property  value ="GroupID"/>' />
        </form>
        
        
        
        
    </div>
    
</rapid:override>
    
    
        



<%@ include file="../../../../base.jsp"%>