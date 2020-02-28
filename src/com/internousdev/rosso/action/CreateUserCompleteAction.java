package com.internousdev.rosso.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.rosso.dao.UserInfoDAO;
import com.opensymphony.xwork2.ActionSupport;

public class CreateUserCompleteAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;

	public String execute() {

		String result = ERROR;
		int sex = 2;

		//性別が男性か女性か判別
		if ("男性".equals(String.valueOf(session.get("sex")))) {
			sex = 0;
		} else {
			sex = 1;
		}

		UserInfoDAO userInfoDAO = new UserInfoDAO();

		int count = userInfoDAO.createUserInfo(
				session.get("familyName").toString(),
				session.get("firstName").toString(),
				session.get("familyNameKana").toString(),
				session.get("firstNameKana").toString(),
				String.valueOf(sex),
				session.get("email").toString(),
				session.get("userIdForCreateUser").toString(),
				session.get("password").toString());

		if(count > 0) {

			result = SUCCESS;

			session.put("createUserFlg", "1");
			session.remove("familyName");
			session.remove("firstName");
			session.remove("familyNameKana");
			session.remove("firstNameKana");
			session.remove("sex");
			session.remove("sexList");
			session.remove("email");
			session.remove("password");
		}

		return result;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
