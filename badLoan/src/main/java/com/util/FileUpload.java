package com.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUpload {
	public static String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException { 
			
	        String fileName = file.getOriginalFilename(); //获取上传文件的原名 
	       // String path=request.getSession().getServletContext().getRealPath("images/"); //找到tomcat服务器文件保存目录
	        String path ="F:\\upload\\"; //找到本地路径
	        System.out.println("================="+path);
	        
	        String photoName = new Date().getTime() + fileName.substring(fileName.lastIndexOf(".") -1);//重命名
	       // String photoName = new Date().getTime() + String.valueOf(fileName);//重命名
	        File tempFile = new File(path, photoName);  //查找路径文件是否有这个名字
	        if (!tempFile.getParentFile().exists()) {  //
	            tempFile.getParentFile().mkdir();  
	        }  
	        if (!tempFile.exists()) {  //判断文件是否存在
	            tempFile.createNewFile();  
	        }  
	        file.transferTo(tempFile);//上传文件的位置
	        System.out.println("------------"+request.getContextPath());
	        return "/upload/"+ tempFile.getName();  
	    } 
	
	public static List uploadFile1(MultipartFile[] file, HttpServletRequest request)  { 
		List<String> listImagePath = new ArrayList<String>();
		String path ="D:\\upload\\"; //找到本地路径
		String photoPath="";
			for (MultipartFile mf : file) {
				if(!mf.isEmpty()){
					
					String fileName = mf.getOriginalFilename(); //获取上传文件的原名 
					System.out.println("原名文件名："+fileName);
					String photoName = new Date().getTime() + fileName.substring(fileName.lastIndexOf(".") -1);//重命名
					File tempFile = new File(path, photoName);  //查找路径文件是否有这个名字
					 if (!tempFile.getParentFile().exists()) {  //
				            tempFile.getParentFile().mkdir();  
				        }  
					 try {
						 if (!tempFile.exists()) {  //判断文件是否存在
					            tempFile.createNewFile();  
					        }  
					        mf.transferTo(tempFile);//上传文件的位置
					} catch (IOException e) {
						// TODO: handle exception
						System.out.println("====异常==="+e.getMessage());
					}
				       
				         photoPath = "/upload/"+ tempFile.getName();
				        listImagePath.add(photoPath);
				        
				}
			}
			System.out.println(photoPath);
			//request.setAttribute("imagePathList", listImagePath);
			return   listImagePath;
    } 
	
}
