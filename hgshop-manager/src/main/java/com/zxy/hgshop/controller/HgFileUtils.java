package com.zxy.hgshop.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@PropertySource("classpath:hgshop.properties")
@Component
public class HgFileUtils {
	
	// 上传的根路径
	@Value("${pic.savepath}")
	private String uploadPath;
	
	// 路径的分隔符号
	private String pathSpit="/";
	

	
	public String upload(MultipartFile file) {
		
		//获取当前的时间 根据时间计算存放的路径
		SimpleDateFormat sdf =  new SimpleDateFormat("yyyyMMdd");
		String subPath = sdf.format(new Date());
		//要存放的文件的路径
		File filePath  = new File(uploadPath + pathSpit + subPath);
		// 如果路径不存在，则创建路径
		if(!filePath.exists()) {
			filePath.mkdirs();
		}
		
		//计算新的文件名
		//得到原来的文件名称
		String srcFileName = file.getOriginalFilename();
		
		//扩展名
		String suffixName  = srcFileName.substring(srcFileName.lastIndexOf("."));
		
		
		// 新的文件名称
		String newFileName = UUID.randomUUID().toString() + suffixName;
		
		//新文件的绝对路径
		File dstFile = new File(uploadPath + pathSpit + subPath + pathSpit + newFileName);
		
		try {
			file.transferTo(dstFile);
			return subPath + pathSpit + newFileName;
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
		
	}
	
}
