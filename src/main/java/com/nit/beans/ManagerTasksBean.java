package com.nit.beans;

import java.sql.Date;

public class ManagerTasksBean {
	private int taskId;
	private String taskName;
	private String taskDescription;
	private String assignedByClient;
	private String priority;
	private Date assignedDate;
	private Date dueDate;
	private Date completionDate;
	private String projectName;
	
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getTaskDescription() {
		return taskDescription;
	}
	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}
	public String getAssignedByClient() {
		return assignedByClient;
	}
	public void setAssignedByClient(String assignedByClient) {
		this.assignedByClient = assignedByClient;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public Date getAssignedDate() {
		return assignedDate;
	}
	public void setAssignedDate1(Date assignedDate) {
		this.assignedDate = assignedDate;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public Date getCompletionDate() {
		return completionDate;
	}
	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public void setAssignedDate(Date date) {
		// TODO Auto-generated method stub
		
	}
		
}
