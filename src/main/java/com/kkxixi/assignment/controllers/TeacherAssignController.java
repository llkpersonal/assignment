package com.kkxixi.assignment.controllers;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
				Query query = session.createSQLQuery("select head,content,start,deadline,aid from assignment,course where course.teacher_uid=:uid and course.cid=:cid and assignment.cid=course.cid");
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
	
	@RequestMapping(value="/delaassign")
	public @ResponseBody String delaassign(@RequestParam(value="aid")int aid){
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Assign assign = new Assign();
		assign.setAid(aid);
		session.delete(assign);
		tx.commit();
		session.close();
		return "{\"status\":\"ok\"}";
		
	}
	
	@RequestMapping(value="/fetchaassign",produces = "text/html;charset=UTF-8")
	public @ResponseBody String fetchAAssign(@RequestParam(value="aid")int aid){
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Assign where aid=:aid");
		query.setString("aid", Integer.toString(aid));
		List<Assign> list = query.list();
		
		Assign assign = list.get(0);
		
		query = session.createQuery("from Attachment where aid=:aid");
		query.setString("aid", Integer.toString(aid));
		Attachment att = (Attachment)query.list().get(0);
		
		session.close();
		return "{\"assignhead\":\""+assign.getHead()+"\",\"assigncontent\":\""+assign.getContent()+
				"\","+ "\"start\":\""+assign.getStart()+"\",\"deadline\":\""+assign.getDeadline()+
				"\",\"attachment\":\""+att.getFilename()+"\"}";
	}
	
	@RequestMapping(value="/modifyassign",method=RequestMethod.POST)
	public @ResponseBody String modifyAssign(@RequestParam(value="aid")int aid,@RequestParam(value="assignhead")String assignhead,@RequestParam("assigncontent")String assigncontent,
			@RequestParam("start")String start,@RequestParam("deadline")String deadline){
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("from Assign where aid=:aid");
		query.setString("aid", Integer.toString(aid));
		List<Assign> list = query.list();
		Assign assign = list.get(0);
		assign.setHead(assignhead);
		assign.setContent(assigncontent);
		assign.setStart(start);
		assign.setDeadline(deadline);
		
		session.update(assign);
		tx.commit();
		session.close();
		return "{\"status\":\"ok\"}";
	}
	
	@RequestMapping("/teachercheckassign")
	public ModelAndView teachercheckassign(@RequestParam(value="cid")int cid)
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("teachercheckassign");
		model.addObject("cid",cid);
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select assignment.aid,assignment.cid,head,start,deadline,studentnumber,ifnull(t.cnt,0) as submitnumber,ifnull(p.cnt,0) notverdictnum from assignment,course,(select assignment.aid,assignment.cid,cnt from assignment left join (select aid,count(*) as cnt from grade group by aid)q on q.aid=assignment.aid)t,(select assignment.aid,assignment.cid,cnt from assignment left join (select aid,count(*) as cnt from grade where state=0 group by aid)q on q.aid=assignment.aid)p where assignment.cid=:cid and assignment.cid=course.cid and t.aid=assignment.aid and p.aid=assignment.aid;");
		
		query.setString("cid", Integer.toString(cid));
		List list = query.list();
		model.addObject("checklist", list);
		session.close();
		return model;
		
	}
	
	@RequestMapping("/teachercheckdescassign")
	public ModelAndView teachercheckdescassign(@RequestParam(value="cid")int cid,@RequestParam(value="aid")int aid,@RequestParam(value="head")String head)
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("teachercheckdescassign");
		model.addObject("cid",cid);
		model.addObject("aid",aid);
		model.addObject("head",head);
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select head,start,deadline,submit,username,state,score,gid from assignment a,grade g,user u where a.aid=g.aid and u.uid=g.uid and g.aid=:aid order by state");
		query.setString("aid", Integer.toString(aid));
		List list = query.list();
		model.addObject("desclist",list);
		session.close();
		return model;
		
	}
	@RequestMapping("/teachercheckperassign")
	public ModelAndView teachercheckperassign(@RequestParam(value="cid")int cid,@RequestParam(value="aid")int aid,@RequestParam(value="gid")int gid,@RequestParam(value="head")String head)
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("teachercheckperassign");
		model.addObject("cid",cid);
		model.addObject("aid",aid);
		model.addObject("gid", gid);
		model.addObject("head",head);
		
		Session session = sessionFactory.openSession();
		Query idQuery = session.createQuery("from Stuattachment as stuattachment where stuattachment.gid=:gid");
		idQuery.setString("gid", Integer.toString(gid));
		List<Stuattachment> idList = idQuery.list();
		model.addObject("idlist",idList);
		session.close();
		return model;
		
	}
	
	@RequestMapping(value="/fetchperassign",produces = "text/html;charset=UTF-8")
	public @ResponseBody String fetchPerAssign(@RequestParam(value="gid")int gid){
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select head,deadline,submit,g.stucontent,score,name from assignment a,grade g,user where a.aid=g.aid and g.gid=:gid and user.uid=g.uid");
		query.setString("gid", Integer.toString(gid));
		List<Grade> list = query.list();
		
		Object object = list.get(0);
		JSONArray json = JSONArray.fromObject(object);
		session.close();
		return json.toString();
	}
	
	@RequestMapping(value="/modifyscore",method=RequestMethod.POST)
	public @ResponseBody String modifyScore(@RequestParam(value="gid")int gid,@RequestParam(value="score")Double score){
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("from Grade where gid=:gid");
		query.setString("gid", Integer.toString(gid));
		List<Grade> list = query.list();
		Grade grade = list.get(0);
		grade.setScore(score);
		grade.setState(1);
		session.update(grade);
		tx.commit();
		session.close();
		return "{\"status\":\"ok\"}";
	}
	
	@RequestMapping("/teachergrademan")
	public ModelAndView teachergrademan(@RequestParam(value="cid")int cid)
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("teachergrademan");
		model.addObject("cid",cid);
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select assignment.aid,assignment.cid,head,start,deadline,max(score),min(score),avg(score),studentnumber,ifnull(t.cnt,0) as submitnumber from assignment,course,grade,(select assignment.aid,assignment.cid,cnt from assignment left join (select aid,count(*) as cnt from grade group by aid)q on q.aid=assignment.aid)t,(select assignment.aid,assignment.cid,cnt from assignment left join (select aid,count(*) as cnt from grade where state=0 group by aid)q on q.aid=assignment.aid)p where assignment.cid=:cid and assignment.cid=course.cid and t.aid=assignment.aid and p.aid=assignment.aid and p.aid=grade.aid group by grade.aid;");
		
		query.setString("cid", Integer.toString(cid));
		List list = query.list();
		model.addObject("manlist",list);
		session.close();
		return model;
		
	}
	
	@RequestMapping("/teachergradedesc")
	public ModelAndView teachergradedesc(@RequestParam(value="cid")int cid,@RequestParam(value="aid")int aid,@RequestParam(value="head")String head)
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("teachergradedesc");
		model.addObject("cid",cid);
		model.addObject("aid",aid);
		model.addObject("head",head);
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select name,score,user.uid,head,gid from assignment a,grade,user where grade.uid=user.uid and grade.aid=a.aid and a.cid=:cid and a.aid=:aid");
		
		query.setString("cid", Integer.toString(cid));
		query.setString("aid", Integer.toString(aid));
		List list = query.list();
		model.addObject("desclist",list);
		session.close();
		return model;
		
	}
	
	@RequestMapping(value="/getattach")
	public String getattach(@RequestParam(value="assignhead")String assignhead,@RequestParam(value="assigncontent")String assigncontent,@RequestParam(value="datepicker")String datepicker,
			@RequestParam(value="timepicker1")String timepicker1,
			@RequestParam(value="datepicker1")String datepicker1,
			@RequestParam(value="timepicker2")String timepicker2,
			@RequestParam(value="cid")int cid,
			HttpServletRequest request,
			@RequestParam(value="fileupload")MultipartFile file
			){
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
		
		if(!file.isEmpty()){
			
			Attachment attachment = new Attachment();
			attachment.setAid(assign.getAid());
			attachment.setFilename(file.getOriginalFilename());
			String ctxPath = request.getSession().getServletContext().getRealPath("/")+"\\"+"upload\\";
			attachment.setFilepath(ctxPath);
			System.out.println("路径:"+ctxPath);
			session.save(attachment);
			File uploadfile = new File(ctxPath+"/"+attachment.getAttachmentid());
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
		return "redirect:/ teachergiveassign.html?cid="+cid;
	}
	
	
	@RequestMapping("/download/{fileName}")  
    public ModelAndView download(@PathVariable("fileName")  
    String fileName, HttpServletRequest request, HttpServletResponse response)  
            throws Exception {  
		Session session = sessionFactory.openSession();
		Query q = session.createQuery("from Attachment where attachmentid=:id");
		q.setString("id", fileName);
		Attachment att = (Attachment) q.list().get(0);
        response.setContentType("text/html;charset=utf-8");  
        request.setCharacterEncoding("UTF-8");  
        java.io.BufferedInputStream bis = null;  
        java.io.BufferedOutputStream bos = null;  
  
        String ctxPath = request.getSession().getServletContext().getRealPath(  
                "/")  
                + "\\" + "upload\\";  
        String downLoadPath = ctxPath + fileName;  
        System.out.println(downLoadPath);  
        try {  
            long fileLength = new File(downLoadPath).length();  
            response.setContentType("application/x-msdownload;");  
            response.setHeader("Content-disposition", "attachment; filename="  
                    + att.getFilename());  
            response.setHeader("Content-Length", String.valueOf(fileLength));  
            bis = new BufferedInputStream(new FileInputStream(downLoadPath));  
            bos = new BufferedOutputStream(response.getOutputStream());  
            byte[] buff = new byte[2048];  
            int bytesRead;  
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
                bos.write(buff, 0, bytesRead);  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        } finally {  
            if (bis != null)  
                bis.close();  
            if (bos != null)  
                bos.close();  
            session.close();
        }  
        
        return null;  
    }  
	
	@RequestMapping("/downloadstu/{fileName}")  
    public ModelAndView downloadstu(@PathVariable("fileName")  
    String fileName, HttpServletRequest request, HttpServletResponse response)  
            throws Exception {  
		Session session = sessionFactory.openSession();
		Query q = session.createQuery("from Stuattachment where stuattachmentid=:id");
		q.setString("id", fileName);
		Stuattachment att = (Stuattachment) q.list().get(0);
        response.setContentType("text/html;charset=utf-8");  
        request.setCharacterEncoding("UTF-8");  
        java.io.BufferedInputStream bis = null;  
        java.io.BufferedOutputStream bos = null;  
  
        String ctxPath = request.getSession().getServletContext().getRealPath(  
                "/")  
                + "\\" + "upload\\";  
        String downLoadPath = ctxPath + fileName;  
        System.out.println(downLoadPath);  
        try {  
            long fileLength = new File(downLoadPath).length();  
            response.setContentType("application/x-msdownload;");  
            response.setHeader("Content-disposition", "attachment; filename="  
                    + att.getStufilename());  
            response.setHeader("Content-Length", String.valueOf(fileLength));  
            bis = new BufferedInputStream(new FileInputStream(downLoadPath));  
            bos = new BufferedOutputStream(response.getOutputStream());  
            byte[] buff = new byte[2048];  
            int bytesRead;  
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
                bos.write(buff, 0, bytesRead);  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        } finally {  
            if (bis != null)  
                bis.close();  
            if (bos != null)  
                bos.close();  
            session.close();
        }  
        
        return null;  
    }  
	
}

