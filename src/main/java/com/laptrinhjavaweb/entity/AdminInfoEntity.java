package com.laptrinhjavaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="admininfo")
public class AdminInfoEntity extends BaseEntity{
	
	@Column(name = "name")
	private String name;

	@Column(name = "content", columnDefinition = "TEXT")
	private String content;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "facebook")
	private String facebook;
	
	@Column(name = "thumbnail")
	private String thumbnail;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
}
