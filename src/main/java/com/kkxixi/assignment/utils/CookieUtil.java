package com.kkxixi.assignment.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {
	public static String getUid(HttpServletRequest request){
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++){
			if( cookies[i].getName().equals("uid") ){
				return cookies[i].getValue();
			}
		}
		return null;
	}
}
