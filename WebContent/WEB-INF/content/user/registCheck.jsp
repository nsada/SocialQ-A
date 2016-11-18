<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html> 
<html> 
<head> 
	<meta charset="utf-8"> 
	<title>实验2</title> 
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.css"> </script> 
</head> 
<!--return validate()和validate()在于是否清空表单--> 
<body onload="load_greeting()"> 
    <div align="left">
	<form id="test" onSubmit="return validate()" action="registPro" method="post"> 
		<table> 
			<tr> 
				<td>Name*:</td> 
				<td><input type="text" class="form-control" placeholder="请输入用户名" name="user.name" id="name" size="20" onChange='check("name")'></td> 
				<td id="nameCheck" class="check" hidden="true">*姓名不能为空</td> 
			</tr> 
			<tr> 
				<td>Age:</td> 
				<td><input type="text" name="Age" id="age" size="20" onChange='check("age")'></td> 
				<td id="ageCheck" class="check" hidden="true">*年龄不能小于17岁</td> 
			</tr> 
			<tr> 
				<td>Class:</td> 
				<!-- 
				<td><select id="class" name="class"> 
					<option>class0</option> 
					<option>class1</option> 
					<option>class2</option> 
					<option>class3</option> 
					</select> 
				</td>
				 --> 
			</tr> 
			<tr> 
				<td>Password*:</td> 
				<td><input type="password" name="user.password" id="password" size="20" onChange='check("password")'></td> 
				<td id="passwordCheck" class="check" hidden="true">*password length less than 8</td> 
			</tr> 
			<tr> 
				<td>Confirm Password*:</td> 
				<td><input type="password" name="cpassword" id="cpassword" size="20" onChange='check("cpassword")'></td> 
				<td id="cpasswordCheck" class="check" hidden="true">*Two passwd is not same</td> 
			</tr> 
			<tr > 
				<td>Email*:</td> 
				<td><input type="email" name="email" id="email" size="20" onChange='check(this.id)'></td> 
				<td id="emailCheck" class="check" hidden="true">*电子邮件名非法！</td> 
			</tr> 
			<tr> 
				<td>Personal Information:</td> 
				<td><textarea rows="10" cols="19"></textarea></td> 
			</tr> 
			<tr> 
				<td colspan="3"> 
					<button class="btn btn-default btn-primary button-center" type="submit">注册</button> 
				</td> 
			</tr> 
		</table> 
	</form> 
	</div>
</body> 
</html> 