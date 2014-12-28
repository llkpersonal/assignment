package com.kkxixi.assignment.controllers;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kkxixi.assignment.entities.Attachment;
import com.kkxixi.assignment.entities.User;

@Controller
public class StuGradeController {
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/stugrademan")
	public ModelAndView stuGradeMan(HttpServletRequest request,@RequestParam(value="cid")int cid){
		ModelAndView model = new ModelAndView();
		model.setViewName("stugrademan");
		model.addObject("cid",cid);
		Session session = sessionFactory.openSession();
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("uid"))
			{
				
				String uid = cookies[i].getValue();
				Query query = session.createSQLQuery("select head,start,deadline,score,t.aid from (select head,start,deadline,aid from assignment where cid=:cid)t, grade g where t.aid=g.aid and g.uid=:uid");
				query.setString("cid", Integer.toString(cid));
				query.setString("uid", uid);
				List list = query.list();
				model.addObject("gradelist", list);
			}
			
		}
		session.close();
		return model;
	}
	
	@RequestMapping(value="/stugradedesc")
	public ModelAndView stuGradeDesc(HttpServletRequest request,@RequestParam(value="aid")int aid,@RequestParam(value="cid")int cid){
		ModelAndView model = new ModelAndView();
		model.setViewName("stugradedesc");
		model.addObject("cid",cid);
		model.addObject("aid",aid);
		Session session = sessionFactory.openSession();
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("uid"))
			{
				
				String uid = cookies[i].getValue();
				Query query = session.createSQLQuery("select head,start,deadline,content,score,stucontent from (select head,start,deadline,content from assignment where aid=:aid)t, grade g where g.uid=:uid and aid=:aid");
				query.setString("aid", Integer.toString(aid));
				query.setString("uid", uid);
				List list = query.list();
				model.addObject("gradelist", list.get(0));
			}
			
		}
		Query attachment = session.createQuery("from Attachment where aid=:aid");
		attachment.setString("aid", Integer.toString(aid));
		List<Attachment> att = attachment.list();
		model.addObject("list",att);
		session.close();
		return model;
	}
	

}
