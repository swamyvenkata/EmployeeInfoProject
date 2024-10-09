package com.serviceImplemention;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jdbcDao.AuthenticationHome;

import com.pojo.User;
import com.serviceInterface.HomeServiceInterface;
@Service
public class HomeServiceImpl implements HomeServiceInterface{
	
	
	@Autowired
	private AuthenticationHome auth;

	@Override
	public String EmpDetailsAdmin(HttpServletRequest request, HttpServletResponse response) {
		String username=(String) request.getParameter("search");
		try{
		User user=auth.getEmployeeDetails(username);
		request.setAttribute("searcheduser", user);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Local Message  "+e.getLocalizedMessage());
			if(e.getLocalizedMessage().equalsIgnoreCase("Invalid User Details")){
				//EmpAddService	empAddserObj = new EmpAddService();
				//HRSAPOUTPUT data = empAddserObj.POSTRequest(username);
				User user = new User();//empAddserObj.convertJsonToJavaObj(data);
				user.setUsername(username);
				//user.setEmpname(data.getE_NAME());
				user.setPassword(username);
			      //  user.setDesignation(data.getE_PTEXT());
			        user.setAuthenticated(true);
			        user.setInitPwdChange(false);
			        user.setGpfavailable(true);
			        if(user.getError()!=null) {
						if( user.getError().equalsIgnoreCase("User Not Found")) {
							request.setAttribute("error", "No Record Found!!");
						//	request.setAttribute("searcheduser", user);
						}if( user.getError().equalsIgnoreCase("Invalid ID")) {
							request.setAttribute("error", "Not a valid Employee id!!");
						//	request.setAttribute("searcheduser", user);
						}
						}else {
						request.setAttribute("searcheduser", user);
						try {
							String  inserted = auth.addEmployeeFromSAP(user);
							//System.out.println("Data inserted @@@@@:"+inserted);
						} catch (Exception e1) {
						
							e1.printStackTrace();
						}
						}
			
			}else{
				request.setAttribute("error", "Oops! Something went wrong. Please try Again!!");
			}
		}
	
		return "admin";
	}

	@Override
	public int resetEmployeePassword(String username) {
		
		return auth.resetEmployeePassword(username);
	}

	@Override
	public Map<String, String> resetBulkEmployeePassword(String username) {
	
		return auth.resetBulkEmployeePassword( username);
	}

}
