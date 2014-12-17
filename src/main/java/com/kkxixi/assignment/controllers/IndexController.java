package com.kkxixi.assignment.controllers;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kkxixi.assignment.entities.User;

@Controller
public class IndexController {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/login")
	public ModelAndView login(){
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}
	
	@RequestMapping(value="/logout")
	public void logout(HttpServletResponse response) throws IOException{
		Cookie username = new Cookie("username","");
		username.setMaxAge(0);
		response.addCookie(username);
		Cookie uid = new Cookie("uid","");
		uid.setMaxAge(0);
		response.addCookie(uid);
		Cookie type = new Cookie("type","");
		type.setMaxAge(0);
		response.addCookie(type);
		Cookie name = new Cookie("name","");
		name.setMaxAge(0);
		response.addCookie(name);
		
		response.sendRedirect("login");
	}
	
	@RequestMapping(value="/loginverify",method=RequestMethod.POST)
	public @ResponseBody String loginVerify(@RequestParam(value="username")String username,
			@RequestParam(value="password")String password,
			HttpServletResponse response) throws UnsupportedEncodingException{
		String hql = "from User as user where user.username=:username and user.password=:password";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		query.setString("username", username);
		query.setString("password", password);
		List<User> list = query.list();
		session.close();
		if( list.size()==0 ){
			return "{\"status\":\"0\"}";
		} else {
			Cookie cookieUid = new Cookie("uid",Integer.toString(list.get(0).getUid()));
			Cookie cookieType = new Cookie("type",list.get(0).getUsertype());
			Cookie cookieUsername = new Cookie("username",list.get(0).getUsername());
			Cookie cookieName = new Cookie("name",URLEncoder.encode(list.get(0).getName(), "UTF-8"));
			response.addCookie(cookieType);
			response.addCookie(cookieUid);
			response.addCookie(cookieName);
			response.addCookie(cookieUsername);
			return "{\"status\":\"1\",\"type\":\""+list.get(0).getUsertype()+"\"}";
		}
	}
}
