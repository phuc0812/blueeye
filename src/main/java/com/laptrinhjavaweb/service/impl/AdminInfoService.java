package com.laptrinhjavaweb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.AdminInfoConverter;
import com.laptrinhjavaweb.dto.AdminInfoDTO;
import com.laptrinhjavaweb.entity.AdminInfoEntity;
import com.laptrinhjavaweb.repository.AdminInfoRepository;
import com.laptrinhjavaweb.service.IAdminInfoService;
import com.laptrinhjavaweb.util.FileUtil;

@Service
public class AdminInfoService implements IAdminInfoService{
	
	@Autowired
	private AdminInfoRepository adminInfoRepository;
	
	
	@Autowired
	private AdminInfoConverter adminInfoConverter;
	
	@Autowired
	private FileUtil fileUtil;
	
	@Override
	public AdminInfoDTO update(AdminInfoDTO aid) {
		AdminInfoEntity entity = new AdminInfoEntity();
		AdminInfoEntity oldEntity = adminInfoRepository.findById(aid.getId()).get();
		entity = adminInfoConverter.toEntity(oldEntity, aid);
		return adminInfoConverter.toDto(adminInfoRepository.save(entity));
	}

	@Override
	public AdminInfoDTO findById(long id) {
		AdminInfoEntity aie = adminInfoRepository.findById(id).get();
		return adminInfoConverter.toDto(aie);
	}
	
}
