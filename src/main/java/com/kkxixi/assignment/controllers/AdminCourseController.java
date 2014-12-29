package com.kkxixi.assignment.controllers;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;
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
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("from User as user where user.usertype='teacher'");
		
		List ls = query.list();
		
		model.addObject("teacherlist",ls);
		
		model.setViewName("adminaddcourse");
		session.close();
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
		
		
		course.setTeacher_uid(teachername);		
		
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
		Course course = list.get(0);
		int uid = course.getTeacher().getUid();
		return "{\"courseid\":\""+course.getCourseid()+"\",\"teachername\":\""+Integer.toString(uid)+"\",\"coursetime\":\""+course.getCoursetime()+"\",\"coursename\":\""+course.getCoursename()+"\",\"classroom\":\""+course.getClassroom()+"\"}";
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
	
	@RequestMapping(value="/uploadcourse")
	public String uploaduser(HttpServletRequest request,@RequestParam(value="fileupload")MultipartFile file){	
		if(!file.isEmpty()){
				String ctxPath = request.getSession().getServletContext().getRealPath("/")+"\\"+"upload\\";
				System.out.println("路径:"+ctxPath);
				File uploadfile = new File(ctxPath+"/"+file.getOriginalFilename());
				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(uploadfile));
	                stream.write(bytes);
	                stream.close();
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 try {
					Session session = sessionFactory.openSession();
					Transaction tx = session.beginTransaction();
					InputStreamReader isr = new InputStreamReader(new FileInputStream(uploadfile));
					BufferedReader bf = new BufferedReader(isr);
					String line = null;
					while((line = bf.readLine())!=null){
						String courses[] = line.split("\t");
						Course course = new Course();
						//course.setCid(2);
						course.setCourseid(courses[0]);
						course.setCoursename(courses[1]);
						course.setClassroom(courses[3]);
						course.setCoursetime(courses[4]);
						
						course.setTeacher_uid(Integer.parseInt(courses[2]));
						
						session.save(course);
					}
					tx.commit();
					session.close();
					isr.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		return "redirect:/ admincourseman";
	}
	
	@RequestMapping(value="/adminimportnamelist")
	public ModelAndView adminimportnamelist(@RequestParam(value="cid")int cid){
		ModelAndView model = new ModelAndView();
		model.setViewName("adminimportnamelist");
		model.addObject("cid",cid);
		return model;
	}
	
	@RequestMapping(value="/uploadnamelist")
	public String uploadnamelist(HttpServletRequest request,@RequestParam(value="fileupload")MultipartFile file,@RequestParam(value="cid")int cid){	
		if(!file.isEmpty()){
				String ctxPath = request.getSession().getServletContext().getRealPath("/")+"\\"+"upload\\";
				System.out.println("路径:"+ctxPath);
				File uploadfile = new File(ctxPath+"/"+file.getOriginalFilename());
				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(uploadfile));
	                stream.write(bytes);
	                stream.close();
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 try {
					Session session = sessionFactory.openSession();
					Transaction tx = session.beginTransaction();
					InputStreamReader isr = new InputStreamReader(new FileInputStream(uploadfile));
					BufferedReader bf = new BufferedReader(isr);
					String line = null;
					int number = 0;
					while((line = bf.readLine())!=null){
						int uid = Integer.parseInt(line);
						Query query = session.createSQLQuery("insert into study values(:cid,:uid)");
						query.setString("cid", Integer.toString(cid));
						query.setString("uid", Integer.toString(uid));
						query.executeUpdate();
						number++;
					}
					Query query = session.createSQLQuery("update course set studentnumber = studentnumber+:number where cid=:cid");
					query.setString("number", Integer.toString(number));
					query.setString("cid",Integer.toString(cid));
					query.executeUpdate();
					tx.commit();
					session.close();
					isr.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		return "redirect:/ admincourseman";
	}
}
