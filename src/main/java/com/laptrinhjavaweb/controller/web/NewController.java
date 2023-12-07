package com.laptrinhjavaweb.controller.web;

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

@Controller(value="newControllerOfWeb")
public class NewController {
	
	@Autowired
	private INewService newService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IAdminInfoService adminInfoService;
	
	@RequestMapping(value="/bai-viet", method = RequestMethod.GET)
	public ModelAndView newPage(@RequestParam("id") Long id) {
		ModelAndView mav = new ModelAndView("/web/new/new");
		NewDTO model = new NewDTO();
		model = newService.findById(id);
		mav.addObject("model", model);
		mav.addObject("categories", categoryService.findList());
		mav.addObject("admin", adminInfoService.findById(1));
		return mav;
	}
	
	@RequestMapping(value = "/bai-viet/the-loai", method = RequestMethod.GET)
	public ModelAndView listPage(@RequestParam(value="page", required = false) Integer page, @RequestParam(value="limit", required = false) Integer limit, @RequestParam("categoryCode") String code) {
		NewDTO model = new NewDTO();
		if(limit == null & page == null) {
			page = 1;
			limit = 4;
		}
		model.setPage(page);
		model.setLimit(limit);
		Pageable pageable = PageRequest.of(page-1, limit, Sort.by("id").descending());
		model.setListResult(newService.findAllByCategoryCode(code, pageable));
		model.setTotalItem(newService.getTotalItemWithCategory(code));
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		ModelAndView mav = new ModelAndView("/web/new/list");
		mav.addObject("model", model);
		mav.addObject("categories", categoryService.findList());
		mav.addObject("admin", adminInfoService.findById(1));
		mav.addObject("categoryCode", code);
		mav.addObject("category", categoryService.findAll().get(code));
		return mav;
	}
	
	@RequestMapping(value = "/tim-kiem", method = RequestMethod.GET)
	public ModelAndView searchPage(@RequestParam("s") String s, @RequestParam(value="page", required = false) Integer page, @RequestParam(value="limit", required = false) Integer limit) {
		NewDTO model = new NewDTO();
		if(limit == null & page == null) {
			page = 1;
			limit = 2;
		}
		model.setPage(page);
		model.setLimit(limit);
		Pageable pageable = PageRequest.of(page-1, limit, Sort.by("id").descending());
		model.setListResult(newService.findAllByString(s, pageable));
		model.setTotalItem(newService.getTotalItemWithString(s));
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/model.getLimit()));
		ModelAndView mav = new ModelAndView("/web/new/search");
		mav.addObject("model", model);
		mav.addObject("categories", categoryService.findList());
		mav.addObject("admin", adminInfoService.findById(1));
		mav.addObject("s", s);
		return mav;
	}

}
