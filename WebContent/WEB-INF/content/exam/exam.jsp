<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="content">
	<form name="myform" action="Paper" method="post">

			<input name="title" type="text" placeholder="请输入试卷的标题" required=""
				align="center"
				style="width: 40%; position: relative; left: 30%; top: 10px">
			<br> <br>

			<textarea name="description" placeholder="试卷的描述" size="50"
				required=""
				
				style="height: 50px; width: 60%; position: relative; left: 20%"></textarea>
			<br>
			<div align="center"
				style="width: 60%; position: relative; left: 20%;">
				试卷可见性： <label class="checkbox-inline"> <input type="radio"
					name="joiner" id="optionsRadios3" value="1" checked="">
					试卷仅好友可见
				</label> <label class="checkbox-inline"> <input type="radio"
					name="joiner" id="optionsRadios4" value="2"> 试卷所有人可见
				</label> <br> 排名可见性： <label class="checkbox-inline"> <input
					type="radio" name="rights" id="optionsRadios3" value="1" checked="">
					排名仅好友可见
				</label> <label class="checkbox-inline"> <input type="radio"
					name="rights" id="optionsRadios4" value="2"> 排名所有人可见
				</label>
			</div>



			<div style="width: 70%; position: relative; left: 15%">
				<%int i =1; %>
				<s:iterator value="selections">

					<p><%=i %>.
						<s:property value="context" />
					</p>
					<%i++; %>
					<s:if test='num>=1'>
						<p>
							A:
							<s:property value="A" />
						</p>
					</s:if>
					<s:if test='num>=2'>
						<p>
							B:
							<s:property value="B" />
						</p>
					</s:if>
					<s:if test='num>=3'>
						<p>
							C:
							<s:property value="C" />
						</p>
					</s:if>
					<s:if test='num>=4'>
						<p>
							D:
							<s:property value="D" />
						</p>
					</s:if>
					<s:if test='num>=5'>
						<p>
							E:
							<s:property value="E" />
						</p>
					</s:if>
					<s:if test='num>=6'>
						<p>
							F:
							<s:property value="F" />
						</p>
					</s:if>

					<a
						href='<s:url action="Deletequestion"><s:param name="ExamID" value ="ExamID"/> <s:param name="type" value ="1"/><s:param name="questionID" value ="id"/></s:url>'>
						删除题目 </a>

				</s:iterator>
			</div>




			<input name="ExamID" type="hidden"
				value='<s:property  value ="ExamID"/>' />
			<div>
				<a style="float: right"
					href='<s:url action="deleteexam"><s:param name="ExamID" value ="ExamID"/> </s:url>'>
					<button type="button">取消编辑试卷</button>
				</a> <a style="float: right"
					href='<s:url action="updateexam"><s:param name="ExamID" value ="ExamID"/> </s:url>'>
					<button type="button">提交生成我的试卷</button>
				</a> <input style="float: right" type="button" onclick="insertQ()"
					value="插入题目">
			</div>
		</form>
<script type="text/javascript">
	function insertQ() {
		document.myform.action="Find"; 
		document.myform.submit(); 
	}
</script>
</rapid:override>
		

<%@ include file="../../../../base.jsp"%>