package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.AdminInfoDTO;

public interface IAdminInfoService {
	AdminInfoDTO findById(long id);
	AdminInfoDTO update(AdminInfoDTO aid);
}
