package com.kkxixi.assignment.controllers;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

@Controller
public class AdminMessageBox {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/showadminmessagebox")
	public ModelAndView showAdminMessageBox(
	        HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView model = new ModelAndView();
		model.setViewName("adminappealman");
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("username"))
			{
				String username = cookies[i].getValue();
				Session session = sessionFactory.openSession();
				Query query = session.createQuery("from Message as message where message.receiver=:username");
				query.setString("username",username);
				List<Message> list = query.list();
				model.addObject("messagelist", list);
				session.close();
				
			}
		}
		
		
		return model;
	}
	
	@RequestMapping(value="/showadminsendmailbox")
	public ModelAndView showAdminSendMailBox(
	        HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView model = new ModelAndView();
		model.setViewName("adminsendbox");
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("username"))
			{
				String username = cookies[i].getValue();
				Session session = sessionFactory.openSession();
				Query query = session.createQuery("from Message as message where message.sender=:username");
				query.setString("username",username);
				List<Message> list = query.list();
				model.addObject("messagelist", list);
				session.close();
				
			}
		}
		return model;
	}
	
	
	@RequestMapping(value="/sendamessage",method=RequestMethod.POST)
	public @ResponseBody String sendmessage(@RequestParam(value="receiver")String receiver,@RequestParam(value="messagecontent")String messagecontent,
			HttpServletRequest request) throws UnsupportedEncodingException{
		Message message = new Message();
		message.setReceiver(receiver);
		message.setMessagecontent(messagecontent);
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("username"))
			{
				
				String sender = cookies[i].getValue();
				message.setSender(sender);
			}
			
		}
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(message);
		tx.commit();
		session.close();
		return "{\"status\":\"ok\"}";
	}
	
	@RequestMapping(value="/getmsginfo",produces = "text/html;charset=UTF-8")
	public @ResponseBody String getmsginfo(@RequestParam("mid")int mid){
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Message where mid=:mid");
		query.setString("mid", Integer.toString(mid));
		List<Message> list = query.list();
		Message message = list.get(0);
		JSONObject json = JSONObject.fromObject(message);
		return json.toString();
	}
}
