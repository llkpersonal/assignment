package com.kkxixi.assignment.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TeacherIndexController {
	@RequestMapping("/teacherindex")
	public ModelAndView teacherindex(){
		ModelAndView model = new ModelAndView();
		model.setViewName("teacherhomepage");
		return model;
	}
}
