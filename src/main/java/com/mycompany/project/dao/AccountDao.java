package com.mycompany.project.dao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.mycompany.project.model.Account;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class AccountDao extends EgovAbstractMapper {
	private static final Logger LOGGER = LoggerFactory.getLogger(AccountDao.class);
	
	@Resource(name="transactionManager")
    PlatformTransactionManager transactionManager;
    	
	public Account selectAccountByMid(String mid) {
		LOGGER.info("실행");
		Account acc = selectOne("account.selectAccount",mid);
		return acc;
	}

	

	public void updateAccount(String fromMid, String toMid, int point) {
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		LOGGER.info("실행");	   
			try {
				
				int fpoint = selectAccountByMid(fromMid).getApoint();
				int tpoint = selectAccountByMid(toMid).getApoint();
				
				int rows=0;
				Map map = new HashMap();
				map.put("faid", fromMid);
				map.put("point", point);
				map.put("taid", toMid);
				if(fpoint < point) {
					throw new Exception("포인트가 부족합니다.");
				}else {
					update("account.withdraw",map);
					update("account.save",map);
					LOGGER.info("commit");
					transactionManager.commit(txStatus);
				}
				
				
			} catch (Exception e) {
			  transactionManager.rollback(txStatus);
			  LOGGER.info("rollback");
			  e.printStackTrace();
			}
			
		
	}
}

