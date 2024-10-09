package com.jdbcDao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.pojo.User;

@Repository
public class AuthenticationHome {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public User getEmployeeDetails(String username) {
		
		User user = null;
			
				 String query = "SELECT USERNAME,PASSWORD,EMPNAME,INIT_PWD_CHANGE,DESIGNATION FROM"
						+ " GPF_EMPLOYEELOGIN WHERE USERNAME=?";
				 try {
						User users=(User) jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(User.class), username);
						if (users !=null) {
							user = new User();
							user.setEmpname(users.getEmpname());
							user.setUsername(users.getUsername());
							user.setPassword(users.getPassword());
							user.setAuthenticated(true);
							user.setDesignation(users.getDesignation());
							if (Boolean.toString(users.isInitPwdChange()).equalsIgnoreCase("true")) {
							//if (Boolean.toString(users.isInitPwdChange()).equalsIgnoreCase("1")) {
								user.setInitPwdChange(true);
							}
						} else {
							throw new SQLException("Invalid User Details");
						}
						} catch (Exception e) {
							e.printStackTrace();
						}
		return user;
	}

	public String addEmployeeFromSAP(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	public int resetEmployeePassword(String username) {
		int count = 0;
		String query = "UPDATE GPF_EMPLOYEELOGIN SET PASSWORD=USERNAME,INIT_PWD_CHANGE=0 WHERE USERNAME=?";
		try {
			count=jdbcTemplate.update(query, username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public Map<String, String> resetBulkEmployeePassword(String usernames) {
		String query = null;
		int count = 0;
		String[] usernameArr = usernames.split(",");
		Map<String, String> resultMap = new HashMap<String, String>();
		String fail = "";
		String success = "";
		try {
			for (String username : usernameArr) {
		
			query = "UPDATE GPF_EMPLOYEELOGIN SET PASSWORD=USERNAME,INIT_PWD_CHANGE=0 WHERE USERNAME=?";
			
			int val = jdbcTemplate.update(query, username);
			if (val == 0) {
				fail = fail + username + ",";
			}
			if (val == 1) {
				success = success + username + ",";
				count++;
		} 
		}
			}catch (Exception e) {
			e.printStackTrace();
		}
	resultMap.put("Fail", fail);
	resultMap.put("Success", success);
	resultMap.put("count", String.valueOf(count));
	return resultMap;	

	}
}







