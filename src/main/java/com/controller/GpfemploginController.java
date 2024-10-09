package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.serviceInterface.CaptchaServiceInterface;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class GpfemploginController {

	@Autowired
	private CaptchaServiceInterface captchaService;

	@GetMapping("/")
	public String loginpage() {
		return "gpfEmpLogin";
	}

	@GetMapping("/admin")
	public String adminloginpage() {
		return "admin";
	}

	@GetMapping("/SubmittedList")
	public String submittedList() {
		return "SubmittedList";
	}

	@GetMapping("/empHome")
	public String empHome() {
		return "empHome";
	}

	@GetMapping("/pwdChangeInit")
	public String pwdChangeInit() {
		return "pwdChangeInit";
	}

	@PostMapping("/gpfemplogin")
	public String gpfemploginMethod(@RequestParam("username") String username,
			@RequestParam("password") String password) {

		try {
			String users = captchaService.gpfemploginMethod(username, password);
			if ("empHome".equals(users)) {
				return "redirect:/empHome";
			} else if ("admin".equals(users)) {
				return "redirect:/admin";
			} else if ("SubmittedList".equals(users)) {
				return "redirect:/SubmittedList";
			} else if ("pwdChangeInit".equals(users)) {
				return "redirect:/pwdChangeInit";
			} else {
				return "redirect:/";
			}
		} catch (Exception e) {
			return "redirect:/";
		}

	}

	@PostMapping("/gpfemp")
	public String gpfemplogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			// if (username != null && !username.equals("") && password != null &&
			// !password.equals("")) {
			String users = captchaService.gpfemplogin(username, password, request, response, session);
			if ("empHome".equals(users)) {
				return "redirect:/empHome";
			} else if ("admin".equals(users)) {
				return "redirect:/admin";
			} else if ("SubmittedList".equals(users)) {
				return "redirect:/SubmittedList";
			} else if ("pwdChangeInit".equals(users)) {
				return "redirect:/pwdChangeInit";
			} else {
				return "redirect:/";
			}

		} catch (Exception e) {
			return "redirect:/";
		}

	}
}
