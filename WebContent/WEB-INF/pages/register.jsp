<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="${pageContext.request.contextPath}/CSS/register.css">
<script type="text/javascript"  charset="utf-8" src="${pageContext.request.contextPath}/JS/register.js"></script>
<title>信息注册</title>
</head>
<body onload="jsmethod()"  style="font-family:微软雅黑;">
	<div class="main">
	<div class="header"></div>
		<form action="RegisterAction" method="post" onsubmit="return checkAll()">
			<div class="content"  style="padding-top:5%;padding-bottom:10%;">
				<table cellpadding="5" align="center">
					<tr>
						<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 名(您的姓名)：&nbsp;</td>
						<td><input type="text" name="name" id="name" onblur="checkName()">&nbsp;</td>
						<td><div id="a">*</div></td>
					</tr>
					<tr>
						<td>所在学校(您高中所在学校)：</td>
						<td><input type="text" name="school" id="school" onblur="checkSchool()">&nbsp;</td>
						<td><div id="b">*</div></td>
					</tr>
					<tr>
						<td>电子邮箱(您的常用邮箱)：</td>
						<td><input type="text" name="email" id="email" onblur="checkEmail()">&nbsp;</td>
						<td><div id="c">*</div></td>
					</tr>
					<tr>
						<td>联系电话(您的手机或电话号)：</td>
						<td><input type="text" name="phone" id="phone" onblur="checkPhone()" >&nbsp;</td>
						<td><div id="d">*</div></td>
					</tr>
					<tr>
						<td>登录密码(至少6位数字或字母组成)：</td>
						<td><input type="password" name="password" id="password" onblur="checkPassword()" >&nbsp;</td>
						<td><div id="e">*</div></td>
					</tr>
					<tr>
						<td>确认密码(重复输入)：</td>
						<td><input type="password" name="repassword" id="repassword" onblur="checkRepassword()" onfocus="if(value==defaultValue){value='';this.style.color='#000'}" style="color:#999999">&nbsp;</td>
						<td><div id="f">*</div></td>
					</tr>
					<tr>
						<td>验&nbsp;&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;码：</td>
						<td><input type="text" name="code" id="code"></td>
						<td><img src="ValidateImage" id="codeAction"  style="cursor:pointer;" alt="看不清，换一张"/></td>
					</tr>
					<tr><td><div id='warn'></div></td></tr>
					<tr>
					<td></td>
					<%@ taglib prefix="s" uri="/struts-tags" %>
					<s:if test="hasFieldErrors()">
						<s:iterator value="fieldErrors">
							<td><font color=blue><s:property value="value[0]"/></font></td>
						</s:iterator>
					</s:if>
					</tr>
					<tr>
					<td></td>
					<td align="right"><input type="submit" value="注册" ><input type="button" value="重置" onclick="return reset1()"></td>
					</tr>
				</table>
				
			</div>	
		</form>
	</div>
	<div class="footer">南开大学 <span>教务处</span> <br>地址：天津市南开区卫津路94号<span>&nbsp;&nbsp;邮政编码：300071</span>　</div>
</body>
</html>