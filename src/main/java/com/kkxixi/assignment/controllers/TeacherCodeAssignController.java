package com.kkxixi.assignment.controllers;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kkxixi.assignment.entities.Course;
import com.kkxixi.assignment.entities.Problem;
import com.kkxixi.assignment.entities.Testcases;


@Controller
public class TeacherCodeAssignController {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/teachercodeassign")
	public ModelAndView teachercodeassign(@RequestParam(value="cid")int cid){
		ModelAndView model = new ModelAndView();
		model.setViewName("teachercodeassign");
		model.addObject("cid",cid);
		
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select problems.pid,title,begindate,duedate,timelimit,memorylimit,totalnum,submitnum from problems,(select cid,studentnumber as totalnum from course)t,(select pid,ifnull(submitnum,0) as submitnum from problems left join (select problem,count(*) as submitnum from submissions group by problem) q on problems.pid=q.problem)qq where t.cid=problems.cid and problems.pid=qq.pid and problems.cid=:cid");
		query.setString("cid", Integer.toString(cid));
		
		List ls = query.list();
		
		model.addObject("codelist",ls);
		
		session.close();
		return model;
	}
	
	@RequestMapping(value="/givecodeassign")
	public ModelAndView givecodeassign(@RequestParam(value="cid")int cid){
		ModelAndView model = new ModelAndView();
		model.setViewName("teachergivecodeassign");
		model.addObject("cid",cid);
		return model;
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/formaddcodeassign")
	public String formaddcodeassign(@RequestParam(value="cid")int cid,
									@RequestParam(value="title")String title,
									@RequestParam(value="timelimit")int timelimit,
									@RequestParam(value="memorylimit")int memorylimit,
									@RequestParam(value="description")String description,
									@RequestParam(value="date")String date,
									@RequestParam(value="time")String time){
		Session session = sessionFactory.openSession();
		Problem problem = new Problem();
		
		problem.setCid(cid);
		problem.setTitle(title);
		problem.setDescription(description);
		problem.setTimelimit(timelimit);
		problem.setMemorylimit(memorylimit);
		
		
		String date1[] = date.split("/");
		String times[] = null;
		
		date= date1[2]+"-"+date1[0]+"-"+date1[1];
		String time1[] = time.split(" ");
		if( time1[1].equals("AM") ){
			time= time1[0];
		} else {
			times = time1[0].split(":");
			time= Integer.toString(Integer.parseInt(times[0])+12)+":"+times[1];
		}

		times = time.split(":");
		problem.setDuedate(new Timestamp(Integer.parseInt(date1[2])-1900,
										 Integer.parseInt(date1[0])-1,
										 Integer.parseInt(date1[1]),
										 Integer.parseInt(times[0]),
										 Integer.parseInt(times[1]),
										 0,
										 0));
		
		Transaction tx = session.beginTransaction();
		session.save(problem);
		tx.commit();
		session.close();
		
		return "redirect:/ teachercodeassign.html?cid="+cid;
	}
	
	@RequestMapping(value="/showcodeassign")
	public ModelAndView showcodeassign(@RequestParam(value="cid")int cid,@RequestParam(value="pid")int pid){
		ModelAndView model = new ModelAndView();
		model.setViewName("teachershowcodeassign");
		model.addObject("cid",cid);
		model.addObject("pid",pid);
		
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select title,description,timelimit,memorylimit,begindate,duedate from problems where pid=:pid");
		query.setString("pid",Integer.toString(pid));
		
		List ls = query.list();
		
		Object pb = ls.get(0);
		
		model.addObject("pb",pb);
		
		session.close();
		return model;
	}
	
	@RequestMapping(value="/codedescassign")
	public ModelAndView codedescassign(@RequestParam(value="cid")int cid,@RequestParam(value="pid")int pid){
		ModelAndView model = new ModelAndView();
		model.setViewName("codedescassign");
		model.addObject("cid",cid);
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("select title,begindate,duedate,submittime,name,verdict from problems,submissions,user where problems.pid=submissions.problem and user.uid=submissions.uid and pid=:pid");
		query.setString("pid",Integer.toString(pid));
		List ls = query.list();
		
		model.addObject("submissionList",ls);
		
		session.close();
		
		return model;
	}
	
	@RequestMapping(value="/showtestcase")
	public ModelAndView showtestcase(@RequestParam(value="cid")int cid,@RequestParam(value="pid")int pid){
		ModelAndView model = new ModelAndView();
		model.setViewName("teachershowtestcase");
		model.addObject("cid", cid);
		model.addObject("pid", pid);
		Session session = sessionFactory.openSession();
		Query q = session.createQuery("from Testcases where pid=:pid");
		q.setString("pid", Integer.toString(pid));
		List<Testcases> ls = q.list();
		
		model.addObject("list",ls);
		
		System.out.println(ls.size());
		
		session.close();
		return model;
	}
	
	@RequestMapping(value="/addtestcase")
	public ModelAndView addtestcase(@RequestParam(value="cid")int cid,@RequestParam(value="pid")int pid){
		ModelAndView model = new ModelAndView();
		model.setViewName("teacheraddtestcase");
		model.addObject("cid", cid);
		model.addObject("pid", pid);
	
		return model;
	}
	
	
	@RequestMapping(value="/formaddtestcase")
	public String formaddtestcase(@RequestParam(value="cid")int cid,@RequestParam(value="pid")int pid,
								  @RequestParam(value="input")String input,@RequestParam(value="output")String output){
		Testcases ts = new Testcases();
		ts.setInput(input);
		ts.setRealinput(input);
		ts.setOutput(output);
		ts.setRealoutput(output);
		ts.setPid(pid);
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(ts);
		tx.commit();
		session.close();
		return "redirect:/ showtestcase.html?cid="+cid+"&pid="+pid;
	}
	
	@RequestMapping(value="/deletetestcase")
	public @ResponseBody String deletetestcase(@RequestParam(value="tid")int tid){
		Testcases ts = new Testcases();
		ts.setTid(tid);
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(ts);
		tx.commit();
		session.close();
		return "{\"ret\":\"ok\"}";
	}
	
}
