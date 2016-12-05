<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<rapid:override name="head">
	<title>查看题目</title>
</rapid:override>

<rapid:override name="content">

	<div class="text-align:right">
		<a
			href='<s:url action="updateQuestion"><s:param name="questionID" value="questionID"/></s:url>'><input
			type="button" value="编辑" /></a>
	</div>


	<s:if test="type==1">
		<!-- show selection -->
		<div class="col-md-12 column">
			context: ${selection.context} <br />
			<table class="table table-bordered table-hover ">
				<tbody>
					<s:if test='selection.A.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">选项A</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="selection.A" />
								</div>
							</td>
						</tr>
					</s:if>
					<s:if test='selection.B.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">选项B</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="selection.B" />
								</div>
							</td>
						</tr>
					</s:if>
					<s:if test='selection.C.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">选项C</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="selection.C" />
								</div>
							</td>
						</tr>
					</s:if>
					<s:if test='selection.D.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">选项D</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="selection.D" />
								</div>
							</td>
						</tr>
					</s:if>
					<s:if test='selection.E.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">选项E</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="selection.E" />
								</div>
							</td>
						</tr>
					</s:if>
					<s:if test='selection.F.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">选项F</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="selection.F" />
								</div>
							</td>
						</tr>
					</s:if>
				</tbody>
			</table>
			analysis: ${selection.analysis}
		</div>
	</s:if>
	<s:if test="type==2">
		<!-- show textBlank -->
		<div class="col-md-12 column">
			context: ${textBlank.context} <br />
			<table class="table table-bordered table-hover ">
				<thead>
					<tr>
						<th>空格编号</th>
						<th>答案</th>
					</tr>
				</thead>
				<tbody>
					<s:if test='textBlank.A.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">1</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="textBlank.A" />
								</div>
							</td>
						</tr>
					</s:if>
					<s:if test='textBlank.B.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">2</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="textBlank.B" />
								</div>
							</td>
						</tr>
					</s:if>
					<s:if test='textBlank.C.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">3</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="textBlank.C" />
								</div>
							</td>
						</tr>
					</s:if>
					<s:if test='textBlank.D.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">4</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="textBlank.D" />
								</div>
							</td>
						</tr>
					</s:if>
					<s:if test='textBlank.E.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">5</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="textBlank.E" />
								</div>
							</td>
						</tr>
					</s:if>
					<s:if test='textBlank.F.length()>0'>
						<tr>
							<td><label for="context" class="col-sm-2 control-label">6</label>
							</td>
							<td>
								<div class="col-sm-10">
									<s:property value="textBlank.F" />
								</div>
							</td>
						</tr>
					</s:if>
				</tbody>
			</table>
			analysis: ${textBlank.analysis}
		</div>
	</s:if>
</rapid:override>




<%@include file="../../../base.jsp"%>
