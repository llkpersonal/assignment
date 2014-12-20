package com.kkxixi.assignment.controllers;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StuMessageBox {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/stuappealman")
	public ModelAndView stuShowAssign(){
		ModelAndView model = new ModelAndView();
		model.setViewName("stuappealman");
		return model;
	}
	
	@RequestMapping(value="/stusendmail")
	public ModelAndView stuShowDescassign(){
		ModelAndView model = new ModelAndView();
		model.setViewName("stusendmail");
		return model;
	}
	
}
