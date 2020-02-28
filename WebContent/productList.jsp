<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/product.css">
<title>商品一覧</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="main">
		<h1>商品一覧画面</h1>
		<s:if
			test="productKeywordErrorMessageList!=null && productKeywordErrorMessageList.size()>0">
			<div class="error">
				<div class="error-message">
					<s:iterator value="productKeywordErrorMessageList">
						<s:property />
						<br>
					</s:iterator>
				</div>
			</div>
		</s:if>
		<s:elseif
			test="productInfoDTOList!=null && productInfoDTOList.size()>0">
			<div id="product_list">
				<s:iterator value="productInfoDTOList" status="st">
					<table class="productList-table">
						<s:if test="#st.index%3 == 0">
							<tr>
						</s:if>
						<td><a
							href='<s:url action="ProductDetailsAction"><s:param name="productId" value="%{productId}"/></s:url>'>
								<img
								src='<s:property value="imageFilePath"/>/<s:property value="imageFileName" />'
								class="image-size" /><br> <s:property value="productName" /><br>
								<s:property value="productNameKana" /><br> <s:property
									value="price" />円<br>
						</a></td>
						<s:if test="#st.index%3 !== 0">
							<tr>
						</s:if>
					</table>
				</s:iterator>
			</div>
		</s:elseif>
		<s:else>
			<div class="info">検索結果がありません。</div>
		</s:else>
	</div>
</body>
</html>