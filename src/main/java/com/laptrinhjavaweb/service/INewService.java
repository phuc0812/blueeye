package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.laptrinhjavaweb.dto.NewDTO;

public interface INewService {
	List<NewDTO> findAll(Pageable pageable);
	List<NewDTO> findAllByCategoryCode(String code, Pageable pageable);
	List<NewDTO> findAllByString(String s, Pageable pageable);
	List<NewDTO> findAll(Sort sort);
	int getTotalItem();
	int getTotalItemWithCategory(String code);
	int getTotalItemWithString(String s);
	NewDTO findById(long id);
	NewDTO save(NewDTO dto);
	void delete(long[] ids);
}
