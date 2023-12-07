package com.laptrinhjavaweb.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.AdminInfoDTO;
import com.laptrinhjavaweb.service.IAdminInfoService;
import com.laptrinhjavaweb.service.ICategoryService;


@Controller(value = "AdminInfoControllerOfWeb")
public class AdminInfoController {
	
	@Autowired
	private IAdminInfoService adminInfoService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value = "/gioi-thieu", method = RequestMethod.GET)
	public ModelAndView infoPage() {
		AdminInfoDTO admin = new AdminInfoDTO();
		ModelAndView mav = new ModelAndView("/web/info/info");
		admin = adminInfoService.findById(1);
		mav.addObject("admin", admin);
		mav.addObject("categories", categoryService.findList());
		return mav;
	}
	
}
