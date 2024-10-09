package com.pojo;

import java.io.Serializable;
import java.util.Map;

public class User implements Serializable {
	private static final long serialVersionUID = 4615872949936784403L;
	

	private String username;
	
	private String password;

	private String empname;
	
	private boolean initPwdChange;
	
	private boolean gpfavailable;
	
	private boolean authenticated;
	
	private String error;
	
	private String old_password;

	private Map<String,String> servicenos;
	
	private String designation;
	private String office;
	private String empGroup;
	private String service;
	private String serviceInfo;
	private String unitInfo;
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public boolean isInitPwdChange() {
		return initPwdChange;
	}

	public void setInitPwdChange(boolean initPwdChange) {
		this.initPwdChange = initPwdChange;
	}

	public boolean isGpfavailable() {
		return gpfavailable;
	}

	public void setGpfavailable(boolean gpfavailable) {
		this.gpfavailable = gpfavailable;
	}

	public boolean isAuthenticated() {
		return authenticated;
	}

	public void setAuthenticated(boolean authenticated) {
		this.authenticated = authenticated;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getOld_password() {
		return old_password;
	}

	public void setOld_password(String old_password) {
		this.old_password = old_password;
	}

	public Map<String, String> getServicenos() {
		return servicenos;
	}

	public void setServicenos(Map<String, String> servicenos) {
		this.servicenos = servicenos;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public String getEmpGroup() {
		return empGroup;
	}

	public void setEmpGroup(String empGroup) {
		this.empGroup = empGroup;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getServiceInfo() {
		return serviceInfo;
	}

	public void setServiceInfo(String serviceInfo) {
		this.serviceInfo = serviceInfo;
	}

	public String getUnitInfo() {
		return unitInfo;
	}

	public void setUnitInfo(String unitInfo) {
		this.unitInfo = unitInfo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/*
	 * public String getServiceInfo() { return serviceInfo; } public void
	 * setServiceInfo(String serviceInfo) { this.serviceInfo = serviceInfo; }
	 * 
	 * 
	 * public String getUnitInfo() { return unitInfo; } public void
	 * setUnitInfo(String unitInfo) { this.unitInfo = unitInfo; } public String
	 * getService() { return service; } public void setService(String service) {
	 * this.service = service; } public String getOffice() { return office; } public
	 * void setOffice(String office) { this.office = office; } public String
	 * getEmpGroup() { return empGroup; } public void setEmpGroup(String empGroup) {
	 * this.empGroup = empGroup; } private boolean authorization=false;
	 * 
	 * public boolean getAuthorization() { return authorization; } public void
	 * setAuthorization(boolean authorization) { this.authorization = authorization;
	 * } public String getEmpname() { return empname; } public void
	 * setEmpname(String empname) { this.empname = empname; }
	 * 
	 * public String getOld_password() { return old_password; } public void
	 * setOld_password(String old_password) { this.old_password = old_password; }
	 * 
	 * public Map<String, String> getServicenos() { return servicenos; } public void
	 * setServicenos(Map<String, String> servicenos) { this.servicenos = servicenos;
	 * } public String getUsername() { return username; } public void
	 * setUsername(String username) { this.username = username; } public String
	 * getPassword() { return password; } public void setPassword(String password) {
	 * this.password = password; }
	 * 
	 * public boolean isAuthenticated() { return authenticated; } public void
	 * setAuthenticated(boolean authenticated) { this.authenticated = authenticated;
	 * } public String getError() { return error; } public void setError(String
	 * error) { this.error = error; } public static long getSerialversionuid() {
	 * return serialVersionUID; } public boolean isInitPwdChange() { return
	 * initPwdChange; } public void setInitPwdChange(boolean initPwdChange) {
	 * this.initPwdChange = initPwdChange; } public boolean isGpfavailable() {
	 * return gpfavailable; } public void setGpfavailable(boolean gpfavailable) {
	 * this.gpfavailable = gpfavailable; }
	 * 
	 * public String getDesignation() { return designation; } public void
	 * setDesignation(String designation) { this.designation = designation; }
	 * 
	 * @Override public String toString() { return "User [username=" + username +
	 * ", designation="+designation+", password=" + password + ", empname=" +
	 * empname + ", initPwdChange=" + initPwdChange + ", authenticated=" +
	 * authenticated + ", error=" + error + ", old_password=" + old_password +
	 * ", servicenos=" + servicenos + "]"; }
	 */
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", empname=" + empname + ", initPwdChange="
				+ initPwdChange + ", gpfavailable=" + gpfavailable + ", authenticated=" + authenticated + ", error="
				+ error + ", old_password=" + old_password + ", servicenos=" + servicenos + ", designation="
				+ designation + ", office=" + office + ", empGroup=" + empGroup + ", service=" + service
				+ ", serviceInfo=" + serviceInfo + ", unitInfo=" + unitInfo + "]";
	}
	
}
