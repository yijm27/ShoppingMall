package com.mycompany.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.MemberDao;
import com.mycompany.project.model.Account;
import com.mycompany.project.model.Member;

@Service
public class MemberService {
	private static final Logger LOGGER = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	private MemberDao memberDao;
	
	public Member selectByMid(String mid) {
		LOGGER.info("실행");
		Member member = memberDao.selectByMid(mid);
		return member;
	}

	public void insert(Member member) {
		LOGGER.info("실행");
		memberDao.insert(member);
		
		
	}

	public void update(Member member) {
		LOGGER.info("실행");
		memberDao.update(member);
		
	}

	public void deleteByMid(String mid) {
		LOGGER.info("실행");
		memberDao.deletebyMid(mid);
	}

	public Member selectByMemail(String memail) {
		LOGGER.info("실행");
		Member member = memberDao.selectByMemail(memail);
		return member;
	}

	public void updateBypmid(String key2, String pmid) {
		memberDao.updateBymid(key2, pmid);
		
	}

	

	
	
}
