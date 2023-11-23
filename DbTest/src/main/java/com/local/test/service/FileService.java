package com.local.test.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.local.test.dao.FileRepository;
import com.local.test.model.FileVO;

@Service
public class FileService {

	@Autowired
	FileRepository fileRepository;
	
	public List<FileVO> fileList(){
		return fileRepository.fileList();
	}
	
	public int uploadFile(FileVO fileVO) {
		return fileRepository.uploadFile(fileVO);
	}
	
	public Map<String, Object> download_file(int doc_seq){
		return fileRepository.download_file(doc_seq);
	}
	
	public List<FileVO> myPageFile(String id) {
		return fileRepository.myPageFile(id);
	}
	
	public List<FileVO> detail_file(int doc_seq){
		return fileRepository.detail_file(doc_seq);
	}
}
