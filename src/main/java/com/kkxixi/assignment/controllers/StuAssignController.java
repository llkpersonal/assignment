package com.kkxixi.assignment.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kkxixi.assignment.entities.Assign;
import com.kkxixi.assignment.entities.Attachment;
import com.kkxixi.assignment.entities.Course;
import com.kkxixi.assignment.entities.Grade;
import com.kkxixi.assignment.entities.Stuattachment;
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
		
		query = session.createQuery("from Attachment where aid=:aid");
		query.setString("aid", Integer.toString(aid));
		List<Attachment> att = query.list();
		model.addObject("list",att);
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
	public String subAssign(@RequestParam(value="assigncontent")String assigncontent,@RequestParam(value="assignstucontent")String assignstucontent,
			@RequestParam(value="aid")int aid,
			@RequestParam(value="cid")int cid,
			@RequestParam(value="fileupload")MultipartFile file,
			HttpServletRequest request)throws UnsupportedEncodingException{
		
		Session session = sessionFactory.openSession();
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("uid"))
			{
				String uid = cookies[i].getValue();
				Query search = session.createQuery("from Grade where aid=:aid and uid=:uid");
				search.setString("aid", Integer.toString(aid));
				search.setString("uid", uid);
				List<Grade> stateList = search.list();
				if(stateList.isEmpty())
				{
					Grade grade = new Grade();
					grade.setTittle(assigncontent);
					grade.setStucontent(assignstucontent);
					
					Query query = session.createQuery("from Assign as assign where assign.aid=:aid");
					query.setString("aid", Integer.toString(aid));
					List<Assign> ls = query.list();
					Assign us = ls.get(0);
					grade.setAid(us);
					
					for(int j=0;j<cookies.length;j++)
					{
						if(cookies[j].getName().equals("username"))
						{
							
							String studentName = cookies[j].getValue();
							Query nameQuery = session.createQuery("from User as user where user.username=:studentName");
							nameQuery.setParameter("studentName",studentName);
							List<User> senderList = nameQuery.list();
							User student = senderList.get(0);
							grade.setUid(student);
						}
						
					}
					Transaction tx = session.beginTransaction();
					session.save(grade);
					
					if(!file.isEmpty()){
						Query idQuery = session.createQuery("from Grade as grade where grade.aid=:aid and grade.uid=:uid");
						idQuery.setString("aid", Integer.toString(aid));
						idQuery.setString("uid", uid);
						List<Grade> idList = idQuery.list();
						Grade il = idList.get(0);
						Stuattachment attachment = new Stuattachment();
						attachment.setGid(il.getGid());
						attachment.setStufilename(file.getOriginalFilename());
						String ctxPath = request.getSession().getServletContext().getRealPath("/")+"\\"+"upload\\";
						attachment.setStufilepath(ctxPath);
						System.out.println("路径:"+ctxPath);
						session.save(attachment);
						File uploadfile = new File(ctxPath+"/"+attachment.getStuattachmentid());
							try {
								byte[] bytes = file.getBytes();
								BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(uploadfile));
				                stream.write(bytes);
				                stream.close();
							} catch (IllegalStateException | IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
					}
					tx.commit();
					session.close();
					//return "{\"status\":\"ok\"}";
				}
				else
				{
					Grade existence = stateList.get(0);
					int gradestate = existence.getState();
					if(gradestate==0)
					{
						existence.setTittle(assigncontent);
						existence.setStucontent(assignstucontent);
						
						Query query = session.createQuery("from Assign as assign where assign.aid=:aid");
						query.setString("aid", Integer.toString(aid));
						List<Assign> ls = query.list();
						Assign us = ls.get(0);
						existence.setAid(us);
						
						for(int j=0;j<cookies.length;j++)
						{
							if(cookies[j].getName().equals("username"))
							{
								
								String studentName = cookies[j].getValue();
								Query nameQuery = session.createQuery("from User as user where user.username=:studentName");
								nameQuery.setParameter("studentName",studentName);
								List<User> senderList = nameQuery.list();
								User student = senderList.get(0);
								existence.setUid(student);
							}
							
						}
						Transaction tx = session.beginTransaction();
						session.save(existence);
						
						if(!file.isEmpty()){
							Query idQuery = session.createQuery("from Grade as grade where grade.aid=:aid and grade.uid=:uid");
							idQuery.setString("aid", Integer.toString(aid));
							idQuery.setString("uid", uid);
							List<Grade> idList = idQuery.list();
							Grade il = idList.get(0);
							Stuattachment attachment = new Stuattachment();
							attachment.setGid(il.getGid());
							attachment.setStufilename(file.getOriginalFilename());
							String ctxPath = request.getSession().getServletContext().getRealPath("/")+"\\"+"upload\\";
							attachment.setStufilepath(ctxPath);
							System.out.println("路径:"+ctxPath);
							session.save(attachment);
							File uploadfile = new File(ctxPath+"/"+attachment.getStuattachmentid());
								try {
									byte[] bytes = file.getBytes();
									BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(uploadfile));
					                stream.write(bytes);
					                stream.close();
								} catch (IllegalStateException | IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								
						}
						tx.commit();
						session.close();
						
					}else
					{
						//return "{\"status\":\"checked\"}";
						
					}
					
				}
				
			}
		}
		//return "{\"status\":\"failed\"}";
		return "redirect:/ stushowassign.html?cid="+cid;
	}
	
}
