package com.kkxixi.assignment.controllers;

import java.util.List;
import java.util.Map;
import java.util.Set;

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
import com.kkxixi.assignment.entities.User;

@Controller
public class AdminCourseController {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/admincourseman")
	public ModelAndView adminCourseMan(){
		ModelAndView model = new ModelAndView();
		model.setViewName("admincourseman");
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select courseid,coursename,name,classroom,coursetime,studentnumber,cid from user,course where user.uid = course.teacher_uid");
		List list = query.list();
		model.addObject("courselist", list);
		session.close();
		return model;
	}
	
	@RequestMapping(value="/adminaddcourse")
	public ModelAndView adminAddCourse(){
		ModelAndView model = new ModelAndView();
		model.setViewName("adminaddcourse");
		return model;
	}
	
	@RequestMapping(value="/addacourse",method=RequestMethod.POST)
	public @ResponseBody String addCourse(@RequestParam(value="courseid")String courseid,@RequestParam(value="coursename")String coursename,@RequestParam(value="teachername")int teachername,
			@RequestParam(value="classroom")String classroom,@RequestParam(value="coursetime")String coursetime){
		
		Course course = new Course();
		//course.setCid(2);
		course.setCourseid(courseid);
		course.setCoursename(coursename);
		course.setClassroom(classroom);
		course.setCoursetime(coursetime);
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("from User as user where user.uid=:uid");
		query.setParameter("uid", teachername);
		List<User> ls = query.list();
		User us = ls.get(0);
		
		course.setTeacher(us);		
		
		Transaction tx = session.beginTransaction();
		session.save(course);
		tx.commit();
		session.close();
		return "{\"status\":\"ok\"}";
	}
	
	@RequestMapping(value="/fetchacourse",produces = "text/html;charset=UTF-8")
	public @ResponseBody String fetchACourse(@RequestParam(value="cid")int cid){
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Course where cid=:cid");
		query.setString("cid", Integer.toString(cid));
		List<Course> list = query.list();
		session.close();
		JSONObject json = JSONObject.fromObject(list.get(0));
		return json.toString();
	}
	
	@RequestMapping(value="/modifycourse",method=RequestMethod.POST)
	public @ResponseBody String modifyUser(@RequestParam(value="cid")int cid,@RequestParam(value="courseid")String courseid,@RequestParam("coursetime")String coursetime,
			@RequestParam("classroom")String classroom,@RequestParam("coursename")String coursename,@RequestParam("teachername")int teachername){
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("from Course where cid=:cid");
		query.setString("cid", Integer.toString(cid));
		List<Course> list = query.list();
		Course course = list.get(0);
		course.setClassroom(classroom);
		course.setCourseid(courseid);
		course.setCoursename(coursename);
		course.setCoursetime(coursetime);
		//course.setTeacher(teachername);
		session.update(course);
		tx.commit();
		session.close();
		return "{\"status\":\"ok\"}";
	}
	
	@RequestMapping(value="/delacourse")
	public @ResponseBody String delacourse(@RequestParam(value="cid")int cid){
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Course course = new Course();
		course.setCid(cid);
		session.delete(course);
		tx.commit();
		session.close();
		return "{\"status\":\"ok\"}";
	}
}
