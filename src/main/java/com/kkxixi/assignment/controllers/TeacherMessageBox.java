package com.kkxixi.assignment.controllers;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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

import com.kkxixi.assignment.entities.Course;
import com.kkxixi.assignment.entities.Message;
import com.kkxixi.assignment.entities.User;

@Controller
public class TeacherMessageBox {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/teacherappealman")
	public ModelAndView showAdminMessageBox(
	        HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView model = new ModelAndView();
		model.setViewName("teacherappealman");
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("uid"))
			{
				String uid = cookies[i].getValue();
				Session session = sessionFactory.openSession();
				//Query query = session.createQuery("from Message as message where message.receiver=:uid");
				Query query=session.createSQLQuery("select mid,messagecontent,sender,name as receiver,sendtime from (select mid,left(messagecontent,20) as messagecontent,name as sender,sender_uid,receiver_uid,sendtime from user uo,message where sender_uid = uo.uid  and receiver_uid=:uid)t, user ut where ut.uid=t.receiver_uid;");
				query.setString("uid", uid);
				List list = query.list();
				for(int j=0;j<=list.size();j++)
				model.addObject("messagelist", list);
				session.close();
				
			}
		}
		
		
		return model;
	}
	
	@RequestMapping(value="/teachersendmail")
	public ModelAndView showAdminSendMailBox(
	        HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView model = new ModelAndView();
		model.setViewName("teachersendmail");
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("uid"))
			{
				String username = cookies[i].getValue();
				Session session = sessionFactory.openSession();
				Query query = session.createSQLQuery("select mid,messagecontent,receiver,name as sender from (select mid,left(messagecontent,20) as messagecontent,name as receiver,sender_uid,receiver_uid from user uo,message where receiver_uid = uo.uid  and sender_uid=:uid)t,user ut where ut.uid=t.sender_uid;");
				query.setString("uid",username);
				//List<Message> list = query.list();
				//model.addObject("messagelist", list);
				List list = query.list();
				model.addObject("messagelist", list);
				session.close();
				
			}
		}
		return model;
	}
	
	
	@RequestMapping(value="/teachersendamessage",method=RequestMethod.POST)
	public @ResponseBody String sendmessage(@RequestParam(value="receivername")String receivername,@RequestParam(value="messagecontent")String messagecontent,
			HttpServletRequest request) throws UnsupportedEncodingException{
		Message message = new Message();
		message.setMessagecontent(messagecontent);
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("from User as user where user.username=:receivername");
		query.setParameter("receivername", receivername);
		List<User> ls = query.list();
		User us = ls.get(0);
		message.setReceiver(us);
		
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
				message.setSender(sender);
			}
			
		}
		
		Transaction tx = session.beginTransaction();
		session.save(message);
		tx.commit();
		session.close();
		return "{\"status\":\"ok\"}";
	}
	
	@RequestMapping(value="/getteachermsginfo",produces = "text/html;charset=UTF-8")
	public @ResponseBody String getmsginfo(@RequestParam("mid")int mid){
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select mid,messagecontent,sendtime,name as receiver,sender,sendername,username as receivername from (select mid,messagecontent,sendtime,username as sendername,name as sender,receiver_uid from user uo,message where message.mid = :mid  and sender_uid=uo.uid)t,user ut where ut.uid=t.receiver_uid;");
		query.setString("mid", Integer.toString(mid));
		
		
		List list = query.list();
		Object obj = list.get(0);
		JSONArray json = JSONArray.fromObject(obj);
		session.close();
		return json.toString();
	}
}
