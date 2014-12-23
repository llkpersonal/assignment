package com.kkxixi.assignment.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StuCalendarController {
	@RequestMapping(value="/showstucalendar")
	public ModelAndView showAdminCalender(){
		ModelAndView model = new ModelAndView();
		model.setViewName("stucalendar");
		return model;
	}
}
