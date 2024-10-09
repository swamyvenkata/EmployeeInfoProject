package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.serviceInterface.HomeServiceInterface;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class HomeFethEmp {
	
	@Autowired
	private HomeServiceInterface homeServiceInterface;
	
	@GetMapping("/fetchEmp ")
	public String EmpDetailsAdmin(HttpServletRequest request, HttpServletResponse response) {
		String user= homeServiceInterface.EmpDetailsAdmin(request,response);
		if ("admin".equals(user)) {
			return "redirect:/admin";
		}else {
			return "redirect:/";
		}
		
		
	}
	@PostMapping("/ResetPassword")
	public void ResetPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
			String username= request.getParameter("username");
			int count=0;		
			if(username!=null) {
				try {
					count=homeServiceInterface.resetEmployeePassword(username);
				} catch (Exception e) {				
					e.printStackTrace();
				}
			}
			if(count==1) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("fail");
			}
		}

	@PostMapping("/resetBulkPassword")
    public ResponseEntity<String> resetBulkPassword(@RequestParam String username) {
        Map<String, String> strMap = new HashMap<>();
        int count = 0;

        if (username != null) {
            try {
                strMap = homeServiceInterface.resetBulkEmployeePassword(username);
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseEntity.status(500).body("An error occurred while processing the request.");
            }
        }

        count = Integer.parseInt(strMap.getOrDefault("count", "0"));
        if (count > 0) {
            return ResponseEntity.ok("Reset Success: " + strMap.get("Success") + " <br/>Failed: " + strMap.get("Fail"));
        } else {
            return ResponseEntity.ok("All fail");
        }
    }
		
	}


