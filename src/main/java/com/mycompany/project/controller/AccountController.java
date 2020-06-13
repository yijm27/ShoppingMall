package com.mycompany.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.Account;
import com.mycompany.project.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	private AccountService accountService;
	
	@GetMapping("/mypoint.do")
	public String mypoint(String mid) throws Exception {
		LOGGER.info("실행");
		
		accountService.updateAccount(mid, "jdkjdk", 60000);
		Account acc = accountService.selectAccountByMid(mid);
		LOGGER.info("apoint:{}",acc.getApoint());
		
		return "member/mypage";
	}
}
