package com.laptrinhjavaweb.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.AdminInfoDTO;
import com.laptrinhjavaweb.service.IAdminInfoService;
import com.laptrinhjavaweb.util.MessageUtil;


@Controller(value = "AdminInfoControllerOfAdmin")
public class AdminInfoController {
	
	@Autowired
	private IAdminInfoService adminInfoService;
	
	@Autowired 
	private MessageUtil messageUtil;
	
	@RequestMapping(value = "/quan-tri/thong-tin", method = RequestMethod.GET)
	public ModelAndView infoPage(@RequestParam("id") Long id, HttpServletRequest request) {
		AdminInfoDTO model = new AdminInfoDTO();
		ModelAndView mav = new ModelAndView("/admin/info/info");
		model = adminInfoService.findById(id);
		if(request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}
	
}
