package com.nit.beans;

import java.sql.Timestamp;

public class BugBean {
	private int bugId;
    private String title;
    private String severity;
	private String developer_id;
    private String status;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private String description;
    
	public BugBean() {
		super();
	}
	
	public int getBugId() {
		return bugId;
	}
	public void setBugId(int bugId) {
		this.bugId = bugId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}	
	public String getSeverity() {
		return severity;
	}
	public void setSeverity(String severity) {
		this.severity = severity;
	}
	public String getDeveloper_id() {
		return developer_id;
	}
	public void setDeveloper_id(String developer_id) {
		this.developer_id = developer_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
