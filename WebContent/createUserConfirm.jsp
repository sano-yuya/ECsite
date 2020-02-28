<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/table.css">
<title>ユーザー情報確認</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="main">
		<div id="top">
			<h1>ユーザー情報入力確認画面</h1>
		</div>
		<table class="table">
			<tr>
				<th scope="row"><label>姓</label></th>
				<td><s:property value="familyName" /></td>
			</tr>
			<tr>
				<th scope="row"><label>名</label></th>
				<td><s:property value="firstName" /></td>
			</tr>
			<tr>
				<th scope="row"><label>姓ふりがな</label></th>
				<td><s:property value="familyNameKana" /></td>
			</tr>
			<tr>
				<th scope="row"><label>名ふりがな</label></th>
				<td><s:property value="firstNameKana" /></td>
			</tr>
			<tr>
				<th scope="row"><label>性別</label></th>
				<td><s:property value="sex" /></td>
			</tr>
			<tr>
				<th scope="row"><label>メールアドレス</label></th>
				<td><s:property value="email" /></td>
			</tr>
			<tr>
				<th scope="row"><label>ユーザーID</label></th>
				<td><s:property value="userId" />
			</tr>
			<tr>
				<th scope="row"><label>パスワード</label></th>
				<td><s:property value="password" />
			</tr>
		</table>
		<s:form action="CreateUserCompleteAction">
			<div class="submit_btn_box2">
				<s:submit value="登録" class="submit_btn" />
			</div>
		</s:form>
		<s:form action="CreateUserAction">
			<div class="submit_btn_box2">
				<s:submit value="戻る" class="submit_btn" />
				<s:hidden id="checkFlg" name="checkFlg" value="1" />
			</div>
		</s:form>
	</div>
</body>
</html>