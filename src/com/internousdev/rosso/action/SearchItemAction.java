package com.internousdev.rosso.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.rosso.dao.MCategoryDAO;
import com.internousdev.rosso.dao.ProductInfoDAO;
import com.internousdev.rosso.dto.MCategoryDTO;
import com.internousdev.rosso.dto.ProductInfoDTO;
import com.internousdev.rosso.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class SearchItemAction extends ActionSupport implements SessionAware {

	private int categoryId;
	private String productKeyword;
	private List<String> productKeywordErrorMessageList;
	private List<ProductInfoDTO> productInfoDTOList;
	private Map<String, Object> session;

	public String execute() throws SQLException {

		//キーワードがnull,""," ","　"の時に空文字に設定しエラーをさけるためisEnmptyではなくisBlankを使用
		if (StringUtils.isBlank(productKeyword)) {
			productKeyword = "";
		} else {
			InputChecker inputChecker = new InputChecker();
			productKeywordErrorMessageList = inputChecker.doCheck("検索ワード", productKeyword,0,50, true, true, true, true, true, true);

			if (productKeywordErrorMessageList.size() > 0) {
				return SUCCESS;
			}
			// キーワードの"　"を" "に変換し" "2個以上を" "に変換し前後のスペースも削除
			productKeyword = productKeyword.replaceAll("　", " ").replaceAll("\\s{2,}", " ").trim();
		}

		ProductInfoDAO productInfoDAO = new ProductInfoDAO();

		// カテゴリーの選択肢を確認し、選択していない場合はすべての商品を表示
		if (categoryId == 1) {
			productInfoDTOList = productInfoDAO.getProductInfoByKeyword(productKeyword.split(" "));
		}else{
			productInfoDTOList = productInfoDAO.getProductInfoByKeywordAndCategoryId(categoryId,productKeyword.split(" "));
		}

		if(!session.containsKey("mCategoryDTOList")) {
			List<MCategoryDTO> mCategoryDTOList = new ArrayList<MCategoryDTO>();
			MCategoryDAO mCategoryDAO = new MCategoryDAO();
			mCategoryDTOList = mCategoryDAO.getMCategoryInfo();
			session.put("mCategoryDTOList", mCategoryDTOList);
		}

		return SUCCESS;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getProductKeyword() {
		return productKeyword;
	}

	public void setProductKeyword(String productKeyword) {
		this.productKeyword = productKeyword;
	}

	public List<String> getProductKeywordErrorMessageList() {
		return productKeywordErrorMessageList;
	}

	public void setProductKeywordErrorMessageList(List<String> productKeywordErrorMessageList) {
		this.productKeywordErrorMessageList = productKeywordErrorMessageList;
	}

	public List<ProductInfoDTO> getProductInfoDTOList() {
		return productInfoDTOList;
	}

	public void setProductInfoDTOList(List<ProductInfoDTO> productInfoDTOList) {
		this.productInfoDTOList = productInfoDTOList;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
