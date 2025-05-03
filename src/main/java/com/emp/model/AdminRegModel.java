package com.emp.model;

public class AdminRegModel {
	private int adminId;
    private String adminName;
    private String email;
    private String phone;
    private String password;

    
    public AdminRegModel() {
    }


	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	@Override
	public String toString() {
		return "AdminRegModel [adminId=" + adminId + ", adminName=" + adminName + ", email=" + email + ", phone="
				+ phone + ", password=" + password + "]";
	}


	
	
	
    
	
}
