package com.serviceImplemention;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jdbcDao.Authentication;
import com.pojo.User;
import com.serviceInterface.CaptchaServiceInterface;
import com.utils.PwsEncryptDecrypt;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class CaptchaServiceImpl implements CaptchaServiceInterface {

	@Autowired
	private Authentication authentication;

	private static final char[][] DATA = { { '1', '4', '1', '9', '8' }, { '2', '3', '5', '1', '8' },
			{ '7', '3', '1', '4', '9', '5', '6' }, { '1', '8', '4', '4', '2', '2' }, { '3', '3', '6', '2', '9', '4' } };

	@Override
	public String generateCaptchaCode() {
		Random r = new Random();
		int index = r.nextInt(DATA.length);

		return String.copyValueOf(DATA[index]);
	}

	@Override
	public String gpfemploginMethod(String username, String password) {
		/*
		 * String username = gpfemploginreq.getUsername();
		 * 
		 * String captcha = gpfemploginreq.getCaptcha(); HttpSession session =
		 * request.getSession(true); session.setAttribute("authType", "EMP"); if
		 * (session != null && session.getAttribute("captcha") != null && captcha !=
		 * null) { String sessioncaptcha = (String) session.getAttribute("captcha"); if
		 * (!captcha.equals(sessioncaptcha)) { request.setAttribute("error",
		 * "Invalid Captcha");
		 * 
		 * 
		 * ServletContext context = getServletContext(); RequestDispatcher rd =
		 * context.getRequestDispatcher("/empLogin.jsp");
		 * 
		 * 
		 * return"empLogin"; } } else { request.setAttribute("error",
		 * "Invalid Captcha"); ServletContext context = getServletContext();
		 * RequestDispatcher rd = context.getRequestDispatcher("/gpfEmpLogin.jsp");
		 * rd.forward(request, response); return"gpfEmpLogin"; }
		 * 
		 * //HttpSession session =request.getSession(true); String password =
		 * gpfemploginreq.getPassword();
		 */
		User user = new User();
		if (username != null && !username.equals("") && password != null && !password.equals("")) {
			user.setUsername(username);
			PwsEncryptDecrypt pws = new PwsEncryptDecrypt();
			String passwordEncrypt = "";
			try {
				passwordEncrypt = pws.passwordEncrypt(password);
			} catch (Exception e) {
				e.printStackTrace();
			}
			user.setPassword(passwordEncrypt);
			user.setAuthenticated(false);
			user.setError("");
			try {
				user = (User) authentication.authenticateEmployee(user);
				if (user.isAuthenticated()) {
					if (user.isInitPwdChange()) {
						// session = request.getSession(true);
						// session.setAttribute("USER", user);
						// session.setAttribute("DESIGNATION", user.getDesignation());
						if (user.getUsername().equalsIgnoreCase("ADMIN")) {// no username as "ADMIN" by me
							// response.sendRedirect(request.getContextPath()+"/pages/admin.jsp");
							return "admin";
						} else {
							String desg = user.getDesignation();
							if (loginChk(desg)) {
								// session.setAttribute("authType", "AUTH");
								// response.sendRedirect(request.getContextPath()+"/SubmittedList");
								return "SubmittedList";
							} else {
								// response.sendRedirect(request.getContextPath()+"/pages/empHome.jsp");
								return "empHome";
							}

						}
					} else {
						// request.setAttribute("userid", user.getUsername());
						// request.setAttribute("empname", user.getEmpname());
						// request.getRequestDispatcher("/pages/pwdChangeInit.jsp").forward(request,
						// response);
						return "pwdChangeInit";
					}
				} else {
					// request.setAttribute("error", user.getError());
					/*
					 * ServletContext context = getServletContext(); RequestDispatcher rd =
					 * context.getRequestDispatcher("/gpfEmpLogin.jsp"); rd.forward(request,
					 * response);
					 */
					return "gpfEmpLogin";
				}
			} catch (Exception e) {
				e.printStackTrace();
				// response.sendRedirect(request.getContextPath()+"/gpfEmpLogin.jsp");
				return "gpfEmpLogin";
			}
		} else {// made by me if username and password is not valid data
			// request.setAttribute("error", "Please Enter Valid Details");
			/*
			 * ServletContext context = getServletContext(); RequestDispatcher rd =
			 * context.getRequestDispatcher("/gpfEmpLogin.jsp"); rd.forward(request,
			 * response);
			 */
			return "gpfEmpLogin";
		}
	}

	private boolean loginChk(String user) {

		boolean exists = false;
		List<String> list = new ArrayList<String>();
		list.add("DGMM");
		list.add("GMM");
		list.add("IAM");
		list.add("JSM");
		list.add("DIRECTORM");
		list.add("DETPT");
		list.add("SETPT");
		list.add("DENEL");
		list.add("SENEL");

		list.add("DEKDP");
		list.add("SEKDP");
		list.add("DEKUR");
		list.add("SEKUR");
		list.add("DEANA");
		list.add("SEANA");

		if (list.contains(user)) {
			exists = true;
		}
		return exists;
	}

	@Override
	public String gpfemplogin(String username, String password, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		 session = request.getSession(true);
		session.setAttribute("authType", "EMP");
		User user = new User();
		if (username != null && !username.equals("") && password != null && !password.equals("")) {
			user.setUsername(username);
			PwsEncryptDecrypt pws = new PwsEncryptDecrypt();
			String passwordEncrypt = "";
			try {
				passwordEncrypt = pws.passwordEncrypt(password);
			} catch (Exception e) {
				e.printStackTrace();
			}
			user.setPassword(passwordEncrypt);
			user.setAuthenticated(false);
			user.setError("");
			try {
				user = (User) authentication.authenticateEmployee(user);
				if (user.isAuthenticated()) {
					if (user.isInitPwdChange()) {
						 session = request.getSession(true);
						 session.setAttribute("USER", user);
						 session.setAttribute("DESIGNATION", user.getDesignation());
						if (user.getUsername().equalsIgnoreCase("ADMIN")) {
							return "admin";
						} else {
							String desg = user.getDesignation();
							if (loginChk(desg)) {
								 session.setAttribute("authType", "AUTH");
								return "SubmittedList";
							} else {
								return "empHome";
							}

						}
					} else {
						 request.setAttribute("userid", user.getUsername());
						 request.setAttribute("empname", user.getEmpname());
						
						return "pwdChangeInit";
					}
				} else {
					 request.setAttribute("error", user.getError());
					return "gpfEmpLogin";
				}
			} catch (Exception e) {
				e.printStackTrace();
				return "gpfEmpLogin";
			}
		} else {
			 request.setAttribute("error", "Please Enter Valid Details");
			return "gpfEmpLogin";
		}
	}

	

}
