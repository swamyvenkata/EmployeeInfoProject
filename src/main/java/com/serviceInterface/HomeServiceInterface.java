package com.serviceInterface;

import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.pojo.User;

public interface HomeServiceInterface {

	String EmpDetailsAdmin(HttpServletRequest request, HttpServletResponse response);

	int resetEmployeePassword(String username);

	Map<String, String> resetBulkEmployeePassword(String username);

}
