package com.kkxixi.assignment.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminIndexController {
	@RequestMapping(value="/adminhomepage")
	public ModelAndView adminHomePage(){
		ModelAndView model = new ModelAndView();
		model.setViewName("adminhomepage");
		return model;
	}
}
