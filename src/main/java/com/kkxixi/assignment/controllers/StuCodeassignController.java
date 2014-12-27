package com.kkxixi.assignment.controllers;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kkxixi.assignment.entities.Problem;
import com.kkxixi.assignment.entities.Submission;
import com.kkxixi.assignment.entities.User;
import com.kkxixi.assignment.utils.CookieUtil;

@Controller
public class StuCodeassignController {
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/stucodeassign")
	public ModelAndView stuCodeAssign(HttpServletRequest request,@RequestParam(value="cid")int cid){
		ModelAndView model = new ModelAndView();
		model.addObject("cid",cid);
		model.setViewName("stucodeassign");
		Session session = sessionFactory.openSession();
		Query q = session.createSQLQuery("select user.uid,title,begindate,duedate,timelimit,memorylimit,ifnull(verdict,'未提交') as verdict,ifnull(score,0) as score,pid "+
										" from user " + 
										" left join problems on 1=1 "+
										" left join ( "+
										" select uid,verdict,tested/submitcnt*100 as score from( "+
										" select pid,count(*) as submitcnt from testcases group by pid)q,submissions "+
										" where q.pid=submissions.problem)s "+
										" on s.uid=user.uid "+
										" where user.uid=:uid");
		q.setString("uid", CookieUtil.getUid(request));
		List ls = q.list();
		model.addObject("list",ls);
		session.close();
		return model;
	}
	
	@RequestMapping(value="/stucodedescassign")
	public ModelAndView stuCodeDescassign(@RequestParam(value="cid")int cid,@RequestParam(value="pid")int pid){
		ModelAndView model = new ModelAndView();
		
		model.setViewName("stucodedescassign");
		model.addObject("cid",cid);
		model.addObject("pid",pid);
		Session session = sessionFactory.openSession();
		Query q = session.createQuery("from Problem where pid=:pid");
		q.setString("pid", Integer.toString(pid));
		List<Problem> ls = q.list();
		Problem pb = ls.get(0);
		
		model.addObject("pb",pb);
		
		session.close();		
		return model;
	}
	
	@RequestMapping(value="/formsubmitcode")
	public String formsubmitcode(HttpServletRequest request,@RequestParam(value="cid")int cid,@RequestParam(value="pid")int pid,@RequestParam(value="language")String language,@RequestParam(value="code")String code){
		Submission submission = new Submission();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		submission.setCode(code);
		submission.setLanguage(language);
		submission.setProblem(pid);
		String struid = CookieUtil.getUid(request);
		int uid = Integer.parseInt(struid);
		submission.setUid(uid);
		submission.setVerdict("PENDING");
		submission.setSubmittime(new Timestamp(System.currentTimeMillis()));
		Query q = session.createQuery("from Submission where problem=:pid and uid=:uid");
		
		
		q.setString("pid", Integer.toString(pid));
		q.setString("uid",struid);
		List<Submission> ls = q.list();
		int cnt = ls.size();

		if( cnt==0 ){
			session.save(submission);
		} else {
			session.clear();
			int runid = ls.get(0).getRunid();
			System.out.println("runid:"+runid);
			submission.setRunid(runid);
			System.out.println("seted!");
			session.update(submission);
			System.out.println("updated!");
		}
		
		tx.commit();
		
		session.close();
		
		return "redirect:/ stucodeassign.html?cid="+cid;
	}
	
	
	@RequestMapping(value="/stucodeperassign")
	public ModelAndView stuCodePerassign(@RequestParam(value="cid")int cid,@RequestParam(value="pid")int pid){
		ModelAndView model = new ModelAndView();
		model.setViewName("stucodeperassign");
		return model;
	}
}
