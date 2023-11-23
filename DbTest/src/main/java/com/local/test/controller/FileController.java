package com.local.test.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.local.test.model.FileVO;
import com.local.test.service.FileService;

@Controller
@RequestMapping("/file")
public class FileController {

	@Autowired
	FileService fileService;

	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	// 파일 목록
	@RequestMapping("/fileList")
	public String fileList(Model model) {
		List<FileVO> fileList = fileService.fileList();

		model.addAttribute("fileList", fileList);
		return "file/fileList";
	}

	// 신규파일업로드 화면
	@RequestMapping("/uploadFileForm")
	public String uploadForm() {
		System.out.println("신규 파일 업로드 화면 열림");
		return "file/uploadFileForm";
	}
	
	//파일업로드
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public String uploadFormPOST(@ModelAttribute FileVO fileVO, @RequestPart MultipartFile file,HttpSession session) throws Exception{
		System.out.println("파일 null여부 :"+ file.isEmpty());
		System.out.println("파일 이름  :"+ file.getOriginalFilename());
		System.out.println("파일 사이즈 :"+ file.getSize());
		System.out.println("파일 타입 :"+ file.getContentType());
		
		String fileName = UUID.randomUUID().toString()+"_"+file.getOriginalFilename();	//파일이름을 랜덤말고 날짜나 버전으로 관리되도록 수정할것.
		String filePath = makeDir();
		
		System.out.println("파일 경로 : "+filePath);
		System.out.println("파일 이름 : "+fileName);
		
		File target = new File(filePath, fileName);
		
		try {
			file.transferTo(target); //파일 저장 , MultipartFile 클래스에서 제공하는 메소드 
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		/*Object userVO = session.getAttribute("userInfo");
		System.out.println(userVO);*/
		
		fileVO.setFile_nm(fileName);
		fileVO.setFile_pos(filePath);
		fileVO.setFile_dn_link(filePath);
		fileVO.setId("test");  			//로그인한 아이디로 저장되도록 수정. 
		fileService.uploadFile(fileVO);
		
		return "redirect:fileList";
	}
	
	//날짜별로 폴더 생성 
	public String makeDir() {

		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		String now=sdf.format(date);

		String path= uploadPath + "\\" +now; //경로
		File file = new File(path);

		if(file.exists()==false) { //파일이 존재하면 true
			file.mkdir(); //폴더생성
		}

		return path;
	}
	
	
	//파일다운로드
	@RequestMapping(value="/download")
	public void downloadPOST(@RequestParam("doc_seq") int doc_seq, HttpServletRequest request, 
				HttpServletResponse response) throws Exception{
		
		//DB에서 doc_seq로 조회해와서 그 파일 경로에 있는 파일을 새로운 파일 경로를 생성하여 다운로드. 
		Map<String, Object> map = fileService.download_file(doc_seq);
		System.out.println(map);
		
		String fileName =  (String) map.get("file_nm");
		String filePath = (String) map.get("file_pos");
		System.out.println(fileName);
		System.out.println(filePath);
		
		File file = new File(filePath, fileName);
		
		byte[] byteFile = FileUtils.readFileToByteArray(file);
		
		//파일유형설정    이진 파일을 위한 기본 값. 
		response.setContentType("application/octet-stream");         
		//파일길이설정        
		response.setContentLength(byteFile.length);        
		//데이터형식/성향설정 (attachment: 첨부파일)        
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName,"UTF-8")+"\";");        
		//내용물 인코딩방식설정       
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Cache-Control","no-cache");

		
		response.getOutputStream().write(byteFile);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
	//문서 정보 상세 보기 
	@RequestMapping(value="/detail" , method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("doc_seq") int doc_seq) {
		List<FileVO> fileDetail = fileService.detail_file(doc_seq);
		System.out.println(fileDetail);
		
		String viewName = "/file/file_detail";
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(viewName);
		mav.addObject("fileDetail", fileDetail);
		
		return mav;
	}
}
