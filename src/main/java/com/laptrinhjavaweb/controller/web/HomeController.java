package com.laptrinhjavaweb.controller.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.IAdminInfoService;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	
	@Autowired
	private INewService newService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IAdminInfoService adminInfoService;
	
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "limit", required = false) Integer limit) {
		NewDTO model = new NewDTO();
		if(limit==null & page == null) {
			page = 1;
			limit = 2;
		}
		model.setPage(page);
		model.setLimit(limit);
		Pageable pageable = PageRequest.of(page-1, limit, Sort.by("id").descending());
		model.setListResult(newService.findAll(pageable));
		model.setTotalItem(newService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double)model.getTotalItem()/model.getLimit()));
		ModelAndView mav = new ModelAndView("/web/home");
		List<NewDTO> listThreeModel = newService.findAll(Sort.by("id").descending());
		mav.addObject("firstModelOfList", listThreeModel.get(0));
		List<NewDTO> twoModelOfList = new ArrayList<>();
		twoModelOfList.add(listThreeModel.get(1));
		twoModelOfList.add(listThreeModel.get(2));
		mav.addObject("model", model);
		mav.addObject("categories", categoryService.findList());
		mav.addObject("admin", adminInfoService.findById(1));
		mav.addObject("twoModelOfList", twoModelOfList);
		return mav;
	}
	
}
