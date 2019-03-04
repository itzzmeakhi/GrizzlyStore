package com.cognizant.bean;

public class LoginBean {
	
	
	private int userId;
	private String username;
	private String password;
	private String role;
	private int isBlocked;
	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}
	/**
	 * @return the isBlocked
	 */
	public int getIsBlocked() {
		return isBlocked;
	}
	/**
	 * @param isBlocked the isBlocked to set
	 */
	public void setIsBlocked(int isBlocked) {
		this.isBlocked = isBlocked;
	}


}
