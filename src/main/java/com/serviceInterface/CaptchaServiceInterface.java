package com.serviceInterface;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface CaptchaServiceInterface {
   
	String generateCaptchaCode();



String gpfemploginMethod(String username, String password);



String gpfemplogin(String username, String password, HttpServletRequest request,
		HttpServletResponse response, HttpSession session);





}
