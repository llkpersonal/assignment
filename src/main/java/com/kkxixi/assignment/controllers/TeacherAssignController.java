package com.kkxixi.assignment.controllers;

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
import com.kkxixi.assignment.entities.User;

@Controller
public class TeacherAssignController{
	@Autowired
	private SessionFactory sessionFactory;
	@RequestMapping("/teachergiveassign")
	public ModelAndView teachergiveassign(@RequestParam(value="cid")int cid)
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("teachergiveassign");
		model.addObject("cid",cid);
		return model;
		
	}
	@RequestMapping("/teachershowassign")
	public ModelAndView teachershowassign(HttpServletRequest request,@RequestParam(value="cid")int cid)
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("teachershowassign");
		model.addObject("cid",cid);
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("uid"))
			{
				String uid = cookies[i].getValue();
				Session session = sessionFactory.openSession();
				Query query = session.createSQLQuery("select head,content,start,deadline from assignment,course where course.teacher_uid=:uid and course.cid=:cid");
				query.setString("uid",uid);
				query.setString("cid", Integer.toString(cid));
				List list = query.list();
				model.addObject("assignlist", list);
				session.close();
				
			}
		}
		return model;
		
	}
	
	@RequestMapping(value="/addaassign",method=RequestMethod.POST)
	public @ResponseBody String addAssign(@RequestParam(value="assignhead")String assignhead,@RequestParam(value="assigncontent")String assigncontent,@RequestParam(value="datepicker")String datepicker,
			@RequestParam(value="timepicker1")String timepicker1,
			@RequestParam(value="datepicker1")String datepicker1,
			@RequestParam(value="timepicker2")String timepicker2,
			@RequestParam(value="cid")int cid){
		Assign assign = new Assign();
		assign.setContent(assigncontent);
		assign.setHead(assignhead);
		//修改起始日期格式
		String date1[] = datepicker1.split("/");
		datepicker1= date1[2]+"-"+date1[0]+"-"+date1[1];
		String time1[] = timepicker2.split(" ");
		if( time1[1].equals("AM") ){
			timepicker2= time1[0];
		} else {
			String times[] = time1[0].split(":");
			timepicker2= Integer.toString(Integer.parseInt(times[0])+12)+":"+times[1];
		}

		assign.setStart(datepicker1+" "+timepicker2);
		//修改截止日期格式
		String date[] = datepicker.split("/");
		datepicker= date[2]+"-"+date[0]+"-"+date[1];
		String time[] = timepicker1.split(" ");
		if( time[1].equals("AM") ){
			timepicker1= time[0];
		} else {
			String times[] = time[0].split(":");
			timepicker1= Integer.toString(Integer.parseInt(times[0])+12)+":"+times[1];
		}

		assign.setDeadline(datepicker+" "+timepicker1);
		//assign.setCourse(cid);
		Session session = sessionFactory.openSession();
		
		Query query1 = session.createQuery("from Course as course where course.cid=:cid");
		query1.setParameter("cid", cid);
		List<Course> ls = query1.list();
		Course cs = ls.get(0);
		
		assign.setCourse(cs);	
		
				
		
		Transaction tx = session.beginTransaction();
		session.save(assign);
		tx.commit();
		session.close();
		return "{\"status\":\"ok\"}";
	}
	
}

