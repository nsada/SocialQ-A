<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<%@ taglib prefix="s" uri="/struts-tags" %>

<rapid:override name="head">  
    <title>查看题目</title>
</rapid:override>  

<rapid:override name="content"> 

    <div class="text-align:right">
        <a href='<s:url action="updateQuestion"><s:param name="questionID" value="questionID"/></s:url>'><input type="button" value="编辑"/></a>
    </div>

    <div class="col-md-12 column">
        context: ${selection.context} <br/>
              选项个数：${selection.num} <br/>
	        <table class="table table-bordered table-hover ">
		        <tbody>
		           <s:if test='selection.num>0'>
		              <tr>
			              <td>
			                 <label for="context" class="col-sm-2 control-label">选项A</label>			                 			                 			                 
			              </td>	  
			              <td>
			                 <div class="col-sm-10"><s:property value="selection.A"/></div>
			              </td>            
		              </tr>
		            </s:if>
		            <s:if test='selection.num>1'>
		              <tr>
                          <td>
                             <label for="context" class="col-sm-2 control-label">选项B</label>
                          </td>
                          <td>
                             <div class="col-sm-10"><s:property value="selection.B"/></div>                                                      
                          </td>
                      </tr>  
                    </s:if>
		            <s:if test='selection.num>2'>
		              <tr>
                          <td>
                             <label for="context" class="col-sm-2 control-label">选项C</label>
                          </td>
                          <td>                           
                             <div class="col-sm-10"><s:property value="selection.C"/></div>                                                      
                          </td>
                      </tr>  
                    </s:if>
                    <s:if test='selection.num>3'>
                        <tr>
                          <td>
                             <label for="context" class="col-sm-2 control-label">选项D</label>
                          </td>
                          <td>                             
                             <div class="col-sm-10"><s:property value="selection.D"/></div>                                                      
                          </td>
                        </tr>  
                    </s:if>
		        </tbody>
	        </table>
        analysis: ${selection.analysis}
    </div>

</rapid:override>




<%@include file="../../../base.jsp"%>  