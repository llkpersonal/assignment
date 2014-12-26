package com.kkxixi.assignment.controllers;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StuIndexController {
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/stuhomepage")
	public ModelAndView stuHomePage(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView model = new ModelAndView();
		model.setViewName("stuhomepage");
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("uid"))
			{
				String uid = cookies[i].getValue();
				Session session = sessionFactory.openSession();
				Query query = session.createSQLQuery("select coursename,classroom,name,coursetime,t.cid from (select coursename,classroom,coursetime,cid,name from course,user where teacher_uid=uid)t, (select cid from study where uid=:uid)u where t.cid=u.cid;");
				query.setString("uid",uid);
				List list = query.list();
				model.addObject("courselist", list);
				session.close();
				
			}
		}
		return model;
	}
}
