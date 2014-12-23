package com.kkxixi.assignment.controllers;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StuCodeassignController {
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/stucodeassign")
	public ModelAndView stuCodeAssign(){
		ModelAndView model = new ModelAndView();
		model.setViewName("stucodeassign");
		return model;
	}
	
	@RequestMapping(value="/stucodedescassign")
	public ModelAndView stuCodeDescassign(){
		ModelAndView model = new ModelAndView();
		model.setViewName("stucodedescassign");
		return model;
	}
	
	@RequestMapping(value="/stucodeperassign")
	public ModelAndView stuCodePerassign(){
		ModelAndView model = new ModelAndView();
		model.setViewName("stucodeperassign");
		return model;
	}
}
