package com.util;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
//文件上传
public class FileUpload {
	public static String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException { 
			
		 String contentType = request.getContentType();
		System.out.println("======"+contentType);
		
	        String fileName = file.getOriginalFilename(); //获取上传文件的原名 
	        String path=request.getSession().getServletContext().getRealPath("images/"); //找到tomcat服务器文件保存目录
	        File tempFile = new File(path, new Date().getTime() + String.valueOf(fileName));  //给文件重命名
	        if (!tempFile.getParentFile().exists()) {  //
	            tempFile.getParentFile().mkdir();  
	        }  
	        if (!tempFile.exists()) {  //判断文件是否存在
	            tempFile.createNewFile();  
	        }  
	        file.transferTo(tempFile);  
	        return "images/" + tempFile.getName();  
	    } 
	
}
