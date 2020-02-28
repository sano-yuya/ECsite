<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>ヘッダー画面</title>
</head>
<body>

	<header>
		<div id="site_title">
			<a>ROSSO</a>
		</div>
		<div id="header_nav">
			<ul>
				<s:form action="SearchItemAction">
					<s:if
						test="#session.mCategoryDTOList != null && #session.mCategoryDTOList.size() > 0">
						<li><s:select name="categoryId"
								list="#session.mCategoryDTOList" listValue="categoryName"
								listKey="categoryId" id="categoryId" /></li>
					</s:if>
					<li><s:textfield name="productKeyword" placeholder="検索ワード"
							class="txt_keyword" /></li>
					<li><s:submit value="商品検索" class="submit_btn1" /></li>
				</s:form>
				<s:if test="#session.logined == 1">
					<s:form action="LogoutAction">
						<li><s:submit value="ログアウト" class="submit_btn1" /></li>
					</s:form>
				</s:if>
				<s:else>
					<s:form action="GoLoginAction">
						<li><s:submit value="ログイン" class="submit_btn1" /></li>
					</s:form>
				</s:else>
				<s:form action="CartAction">
					<li><s:submit value="カート" class="submit_btn1" /></li>
				</s:form>
				<s:if test="#session.logined == 1">
					<s:form action="MyPageAction">
						<li><s:submit value="マイページ" class="submit_btn1" /></li>
					</s:form>
				</s:if>
			</ul>
		</div>
	</header>
</body>
</html>