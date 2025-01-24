package com.nit.beans;

import java.util.Date;

public class TasksBean {

    private int taskId;
    private String taskName;
    private String description;
    private String status;
    private Date dueDate;
    private int projectId;       // Foreign key to link the task to a project
    private String assignedUser;  // Username of the user assigned to the task
    private Date createdOn;
    private String assignedBy;
    private String priority;
    private int progress;
    private Date completionDate;

    // Getters and Setters

    public TasksBean(int i, String string, String string2, String string3, java.sql.Date valueOf, int j,
			String string4) {
		super();
	}

	public TasksBean() {
		super();
	}

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getAssignedUser() {
        return assignedUser;
    }

    public void setAssignedUser(String assignedUser) {
        this.assignedUser = assignedUser;
    }

    
    // Optional: toString method for easy debugging

    public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date date) {
		this.createdOn = date;
	}

	public String getAssignedBy() {
		return assignedBy;
	}

	public void setAssignedBy(String assignedBy) {
		this.assignedBy = assignedBy;
	}
	
	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	
	public Date getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}

	@Override
    public String toString() {
        return "TasksBean{" +
                "taskId=" + taskId +
                ", taskName='" + taskName + '\'' +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                ", dueDate=" + dueDate +
                ", projectId=" + projectId +
                ", assignedUser='" + assignedUser + '\'' +
                '}';
    }
}
