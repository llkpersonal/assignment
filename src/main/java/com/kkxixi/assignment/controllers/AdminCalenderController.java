package com.kkxixi.assignment.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminCalenderController {
	@RequestMapping(value="/showadmincalender")
	public ModelAndView showAdminCalender(){
		ModelAndView model = new ModelAndView();
		model.setViewName("admincalender");
		return model;
	}
}
