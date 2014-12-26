package com.kkxixi.assignment.controllers;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kkxixi.assignment.entities.Assign;
import com.kkxixi.assignment.entities.Course;
import com.kkxixi.assignment.entities.Grade;
import com.kkxixi.assignment.entities.User;

@Controller
public class StuAssignController {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/stushowassign")
	public ModelAndView stuShowAssign(HttpServletRequest request,@RequestParam(value="cid")int cid){
		ModelAndView model = new ModelAndView();
		model.setViewName("stushowassign");
		model.addObject("cid",cid);
	    //String uid = cookies[i].getValue();
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select head,content,start,deadline,aid,cid from assignment where cid=:cid ");
		//query.setString("uid",uid);
		query.setString("cid", Integer.toString(cid));
		List list = query.list();
		model.addObject("assignlist", list);
		session.close();	
		
		return model;
	}
	//,cid=${cid}
	//,@RequestParam(value="cid")int cid
	@RequestMapping(value="/stushowdescassign")
	public ModelAndView stuShowDescassign(HttpServletRequest request,@RequestParam(value="aid")int aid,@RequestParam(value="cid")int cid){
		ModelAndView model = new ModelAndView();
		model.setViewName("stushowdescassign");
		model.addObject("cid",cid);
		model.addObject("aid",aid);
	    //String uid = cookies[i].getValue();
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select head,content,start,deadline from assignment where aid=:aid ");
		//query.setString("uid",uid);
		query.setString("aid", Integer.toString(aid));
		List list = query.list();
		model.addObject("assignlist", list.get(0));
		session.close();
		return model;
	}
	
	@RequestMapping(value="/stugiveassign")
	public ModelAndView stuGiveAssign(HttpServletRequest request,@RequestParam(value="aid")int aid,@RequestParam(value="cid")int cid){
		ModelAndView model = new ModelAndView();
		model.setViewName("stugiveassign");
		model.addObject("cid",cid);
		model.addObject("aid",aid);
		return model;
	}
	
	@RequestMapping(value="/subassign",method=RequestMethod.POST)
	public @ResponseBody String subAssign(@RequestParam(value="assigncontent")String assigncontent,@RequestParam(value="assignstucontent")String assignstucontent,@RequestParam(value="aid")int aid,
			HttpServletRequest request)throws UnsupportedEncodingException{
		Grade grade = new Grade();
		grade.setTittle(assigncontent);
		grade.setStucontent(assignstucontent);

		//assign.setCourse(cid);
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("from Assign as assign where assign.aid=:aid");
		query.setString("aid", Integer.toString(aid));
		List<Assign> ls = query.list();
		Assign us = ls.get(0);
		grade.setAid(us);
		
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("username"))
			{
				
				String senderName = cookies[i].getValue();
				Query nameQuery = session.createQuery("from User as user where user.username=:senderName");
				nameQuery.setParameter("senderName",senderName);
				List<User> senderList = nameQuery.list();
				User sender = senderList.get(0);
				grade.setUid(sender);
			}
			
		}
		
		
		Transaction tx = session.beginTransaction();
		session.save(grade);
		tx.commit();
		session.close();
		return "{\"status\":\"ok\"}";
	}
}
