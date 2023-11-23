package com.local.test.dao;

import java.util.List;
import java.util.Map;

import com.local.test.model.FileVO;

public interface FileRepository {
	
	public List<FileVO> fileList();
	
	public int uploadFile(FileVO fileVO);
	
	public Map<String, Object> download_file(int doc_seq);
	
	public List<FileVO> myPageFile(String id);
	
	public List<FileVO> detail_file(int doc_seq);
}
