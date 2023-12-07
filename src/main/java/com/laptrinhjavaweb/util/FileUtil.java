package com.laptrinhjavaweb.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtil {
	
	public String saveFile(MultipartFile file) {
		if(file != null && file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				String rootPath = System.getProperty("catalina.home");
				// creating the directory to store file
				File dir = new File(rootPath + File.separator + "assets/user/img");
				if(!dir.exists()) {
					dir.mkdir();
				}
				
				// creating the file on server
				String name = String.valueOf(new Date().getTime() + ".jpg");
				File serverFile = new File(dir.getAbsoluteFile()+File.separator+name);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				return name;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
