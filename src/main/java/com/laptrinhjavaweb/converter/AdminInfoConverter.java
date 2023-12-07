package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.AdminInfoDTO;
import com.laptrinhjavaweb.entity.AdminInfoEntity;

@Component
public class AdminInfoConverter {
	
	public AdminInfoDTO toDto(AdminInfoEntity entity) {
		AdminInfoDTO dto = new AdminInfoDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setContent(entity.getContent());
		dto.setEmail(entity.getEmail());
		dto.setFacebook(entity.getFacebook());
		dto.setThumbnail(entity.getThumbnail());
		return dto;
	}
	
	public AdminInfoEntity toEntity(AdminInfoEntity entity ,AdminInfoDTO dto) {
		entity.setName(dto.getName());
		entity.setContent(dto.getContent());
		entity.setEmail(dto.getEmail());
		entity.setFacebook(dto.getFacebook());
		entity.setThumbnail(dto.getThumbnail());
		return entity;
	}

}
