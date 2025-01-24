package com.nit.beans;

public class DocumentationBean {
	private int id;
	private String doc_title;
	private String doc_url;
	private String description;
	public DocumentationBean() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDoc_title() {
		return doc_title;
	}
	public void setDoc_title(String doc_title) {
		this.doc_title = doc_title;
	}
	public String getDoc_url() {
		return doc_url;
	}
	public void setDoc_url(String doc_url) {
		this.doc_url = doc_url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
