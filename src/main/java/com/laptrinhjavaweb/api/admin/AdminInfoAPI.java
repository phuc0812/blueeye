package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.AdminInfoDTO;
import com.laptrinhjavaweb.service.IAdminInfoService;

@RestController(value = "AdminInfoAPIOfAdmin")
public class AdminInfoAPI {
	
	@Autowired
	private IAdminInfoService adminInfoService;
	
	@PutMapping("/api/info")
	public AdminInfoDTO updateInfo(@RequestBody AdminInfoDTO aid) {
		return adminInfoService.update(aid);
	}
}
