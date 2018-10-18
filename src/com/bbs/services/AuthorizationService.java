package com.bbs.services;

import com.bbs.api.AuthorizationManager;
import com.bbs.dao.AuthorizationDao;
import com.bbs.entities.AccessLog;
import com.bbs.entities.User;

public class AuthorizationService {
	private AuthorizationDao authorizationDao;

	public void setAuthorizationDao(AuthorizationDao authorizationDao) {
		this.authorizationDao = authorizationDao;
	}

	public User wechatLogin(AuthorizationManager authorizationManager) {
		return authorizationDao.wechatLogin(authorizationManager);
	}

	public User getUserInfo(String openId) {
		return authorizationDao.getUserInfo(openId);
	}

	public void writeLog(AccessLog accessLog) {
		authorizationDao.writeLog(accessLog);
	}
}
