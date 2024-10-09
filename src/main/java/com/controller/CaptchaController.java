package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.serviceInterface.CaptchaServiceInterface;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CaptchaController {

    @Autowired
    private CaptchaServiceInterface captchaService;

    @GetMapping("/getCaptcha")
    public String getCaptcha(HttpServletRequest request) {
        try {
            String captcha = captchaService.generateCaptchaCode();
            log.info("Generated CAPTCHA code: {}", captcha);

      
            HttpSession session = request.getSession();
            session.setAttribute("captcha", captcha);
           
            return captcha; 
        } catch (Exception e) {
            log.error("Error generating CAPTCHA", e);
            return "Error generating CAPTCHA";
        }
    }
}
