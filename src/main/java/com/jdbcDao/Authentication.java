package com.jdbcDao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.pojo.User;
import com.utils.PwsEncryptDecrypt;

@Repository
public class Authentication {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public User authenticateEmployee(User user) throws Exception {
		String query = "SELECT USERNAME,PASSWORD,EMPNAME,INIT_PWD_CHANGE,GPF,DESIGNATION,"
				+ " EMP_OFFICE, EMP_WG, SERVICE, SERVICEINFO, UNITINFO "
				+ "FROM GPF_EMPLOYEELOGIN WHERE USERNAME=?";
		try {
			User users=(User) jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(User.class), user.getUsername());
			if (users !=null) {
				boolean matched = user.getPassword().equals(users.getPassword());
				if (matched) {
					user.setEmpname(users.getEmpname());
					user.setUsername(users.getUsername());
					user.setAuthenticated(true);
					user.setDesignation(users.getDesignation());
					if (Boolean.toString(users.isInitPwdChange()).equalsIgnoreCase("true")) {
						//if (Boolean.toString(users.isInitPwdChange()).equalsIgnoreCase("1")) {//true
					user.setInitPwdChange(true);
					}
					if (Boolean.toString(users.isGpfavailable()).equalsIgnoreCase("true")) {
						//if (Boolean.toString(users.isGpfavailable()).equalsIgnoreCase("1")) {//false
						user.setGpfavailable(true);
					}
					user.setOffice(users.getOffice());
					user.setEmpGroup(users.getEmpGroup());
					user.setService(users.getService());
					user.setServiceInfo(users.getServiceInfo());
					user.setUnitInfo(users.getUnitInfo());
				}else {
					if(user.getUsername().equals(users.getPassword())) {//if username and password same then encrypt the password and save in database
						//ENCRYPET PASSWORD
						PwsEncryptDecrypt pws = new PwsEncryptDecrypt();
						String passwordEncrypt = "";
						try {
							passwordEncrypt = pws.passwordEncrypt(users.getUsername());
							int changeEmployeePassword = changeEmployeePassword(users.getUsername(), passwordEncrypt);
							User user1 = new User();
							user1.setUsername(users.getUsername());
							user1.setPassword(passwordEncrypt);
							if(changeEmployeePassword == 1) {
								user = authenticateEmployee(user1);
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}else {
						user.setAuthenticated(false);
						user.setError("Invalid Password");
					}
				}
			} else {
				user.setError("Invalid Username");
			}
		} catch (EmptyResultDataAccessException e) { throw new
			  Exception("User not found"); }
		return user;
	} 
				
	
			public int changeEmployeePassword(String username, String password) throws Exception {
				int count = 0;
			
				try {
					
						 String query = "UPDATE GPF_EMPLOYEELOGIN SET PASSWORD=?,INIT_PWD_CHANGE=0 WHERE USERNAME=?";
						 count = jdbcTemplate.update(query,password,username);
					 
				} catch (Exception ex) {
					ex.printStackTrace();
					throw ex;
				} 
				return count;
			}
			
	


	
}
