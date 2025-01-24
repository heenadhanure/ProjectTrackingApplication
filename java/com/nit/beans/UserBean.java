package com.nit.beans;

import java.io.InputStream;

import jakarta.servlet.http.Part;

public class UserBean {
	
	private String userName;
    private String firstName;
    private String lastName;
    private String email;
    private String role;
    private String password;
    private String confirmPassword;
    private long phone;
    private InputStream profileImage;
    
    public UserBean() {
		super();
	}
    
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public long getPhone() {
		return phone;
	}
	public long setPhone(long l) {
		return this.phone = l;
	} 
	 public InputStream getProfileImage() {
			return profileImage;
		}
		public void setProfileImage(InputStream profileImage) {
			this.profileImage=profileImage;
		}
	
	@Override
	public String toString() {
	    return "Manager{" +
	            "userName='" + userName + '\'' +
	            ", firstName='" + firstName + '\'' +
	            ", lastName='" + lastName + '\'' +
	            ", email='" + email + '\'' +
	            ", role='" + role + '\'' +
	            ", password='" + password + '\'' +
	            ", confirmPassword='" + confirmPassword + '\'' +
	        //    ", phone=" + phone +
	            '}';
	     
	}	
}
