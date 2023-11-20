package com.local.test.model;

import java.sql.Date;

public class FileVo {
	private int fileId;
	private String file_title;
	private byte[] file_data;
	private Date file_upload_date;
	
	
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFile_title() {
		return file_title;
	}
	public void setFile_title(String file_title) {
		this.file_title = file_title;
	}
	public byte[] getFile_data() {
		return file_data;
	}
	public void setFile_data(byte[] file_data) {
		this.file_data = file_data;
	}
	public Date getFile_upload_date() {
		return file_upload_date;
	}
	public void setFile_upload_date(Date file_upload_date) {
		this.file_upload_date = file_upload_date;
	}
	
	
	
}
