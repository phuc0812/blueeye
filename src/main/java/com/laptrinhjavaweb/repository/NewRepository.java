package com.laptrinhjavaweb.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.entity.NewEntity;

public interface NewRepository extends JpaRepository<NewEntity, Long>{
	@Query("FROM NewEntity n where n.category.code = :categorycode")
	Page<NewEntity> findAllByCategoryCode(@Param("categorycode") String categoryCode ,Pageable pageable);
	
	@Query("SELECT COUNT(*) FROM NewEntity n WHERE n.category.code = :categorycode")
	long countWithCategory(@Param("categorycode") String code);
	
	@Query("FROM NewEntity n where n.title like %?1% or n.shortDescription like %?1% or n.content like %?1%")
	Page<NewEntity> findAllByString(String s, Pageable pageable);
	
	@Query("SELECT COUNT(*) FROM NewEntity n WHERE n.title like %?1% or n.shortDescription like %?1% or n.content like %?1%")
	long countWithString(String s);
}
