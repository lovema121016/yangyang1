package com.util;

import com.dao.UserDaoImpl;

public class DaoFactory {
	public static UserDaoImpl getUserDao() {
		return new UserDaoImpl();
	}
	
}
