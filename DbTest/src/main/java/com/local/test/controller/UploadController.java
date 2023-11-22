package com.local.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/upload")
public class UploadController {

	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/uploadTest", method= RequestMethod.GET)
	public String uploadFormGET() throws Exception{
		System.out.println("업로드 테스트 화면 열림.");
		return "file/uploadTest";
	}
	
	@RequestMapping(value="/upload", method =  RequestMethod.POST)
	public String uploadFormPOST(@RequestPart MultipartFile file, Model model) throws Exception{
		System.out.println(file.isEmpty());
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		System.out.println(file.getContentType());
		
		String saveFileName = uploadFile(file);
		model.addAttribute("saveFileName",saveFileName);
		
		return "file/uploadTest";
	}

	private String uploadFile(MultipartFile file) throws IOException{
		// TODO Auto-generated method stub
		String fileName = UUID.randomUUID().toString()+"_"+file.getOriginalFilename();
		File target = new File(uploadPath, fileName);
		FileCopyUtils.copy(file.getBytes(),target);
		
		return fileName;
	}
}

