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
public class StuAssignController {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/stushowassign")
	public ModelAndView stuShowAssign(){
		ModelAndView model = new ModelAndView();
		model.setViewName("stushowassign");
		return model;
	}
	
	@RequestMapping(value="/stushowdescassign")
	public ModelAndView stuShowDescassign(){
		ModelAndView model = new ModelAndView();
		model.setViewName("stushowdescassign");
		return model;
	}
}
