package com.mycompany.project.service;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.mycompany.project.dao.AccountDao;
import com.mycompany.project.model.Account;

@Service
public class AccountService {
	private static final Logger LOGGER = LoggerFactory.getLogger(AccountService.class);
	
	
	
	@Autowired
	private AccountDao accountDao;
	
	public Account selectAccountByMid(String mid) {
		LOGGER.info("실행");
		Account acc = accountDao.selectAccountByMid(mid);
		return acc;
	}
	public void updateAccount(String fromMid, String toMid, int point) {
		LOGGER.info("실행");
		accountDao.updateAccount(fromMid, toMid, point);
		
	}
}
