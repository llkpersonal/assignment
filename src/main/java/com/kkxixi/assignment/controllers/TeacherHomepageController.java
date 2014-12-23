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

import com.kkxixi.assignment.entities.Message;

@Controller
public class TeacherHomepageController {
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping("/teacherhomepage")
	public ModelAndView teacherindex(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView model = new ModelAndView();
		model.setViewName("teacherhomepage");
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("uid"))
			{
				String uid = cookies[i].getValue();
				Session session = sessionFactory.openSession();
				Query query = session.createSQLQuery("select coursename,classroom,studentnumber,coursetime,cid from course where course.teacher_uid=:uid");
				query.setString("uid",uid);
				List list = query.list();
				model.addObject("courselist", list);
				session.close();
				
			}
		}
		return model;
	}
	
	
}
