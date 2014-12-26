package com.kkxixi.assignment.controllers;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StuGradeController {
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value="/stugrademan")
	public ModelAndView stuGradeMan(){
		ModelAndView model = new ModelAndView();
		model.setViewName("stugrademan");
		return model;
	}
	
	@RequestMapping(value="/stugradedesc")
	public ModelAndView stuGradeDesc(){
		ModelAndView model = new ModelAndView();
		model.setViewName("stugradedesc");
		return model;
	}
	

}
