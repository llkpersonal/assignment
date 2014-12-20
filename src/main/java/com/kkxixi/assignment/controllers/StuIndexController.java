package com.kkxixi.assignment.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StuIndexController {
	@RequestMapping(value="/stuhomepage")
	public ModelAndView adminHomePage(){
		ModelAndView model = new ModelAndView();
		model.setViewName("stuhomepage");
		return model;
	}
}
