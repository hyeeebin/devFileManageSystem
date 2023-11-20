package com.local.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/file")
public class FileController {

	@RequestMapping("/upload_form")
	public String uploadForm() {
		return "file/file_upload";
	}
}
