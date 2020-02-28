package com.internousdev.rosso.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.rosso.dao.MCategoryDAO;
import com.internousdev.rosso.dto.MCategoryDTO;
import com.internousdev.rosso.util.CommonUtility;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;

	public String execute() throws SQLException {

		//ユーザーがログイン済みか確認
		if(!session.containsKey("logined")) {
			session.put("logined", 0);
		}

		//ログイン状態判別
		String tmpLogined = String.valueOf(session.get("logined"));
		int logined = "null".equals(tmpLogined)? 0 : Integer.parseInt(tmpLogined);

		if (logined == 0 && !session.containsKey("tmpUserId")) {
			//ログインしていない、かつ仮ユーザーIDがない場合
			CommonUtility commonUtility = new CommonUtility();
			session.put("tmpUserId", commonUtility.getRamdomValue());
		}

		//商品カテゴリーリストを作成
		if(!session.containsKey("mCategoryDTOList")) {
			List<MCategoryDTO> mCategoryDTOList = new ArrayList<MCategoryDTO>();
			MCategoryDAO mCategoryDAO = new MCategoryDAO();

			mCategoryDTOList = mCategoryDAO.getMCategoryInfo();
			session.put("mCategoryDTOList", mCategoryDTOList);
		}

		return SUCCESS;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}

