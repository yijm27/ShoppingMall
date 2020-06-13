package com.mycompany.project.dao;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Member;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class MemberDao extends EgovAbstractMapper{
	private static final Logger LOGGER = LoggerFactory.getLogger(MemberDao.class);
	
	public Member selectByMid(String mid) {
		LOGGER.info("실행");
		Member member = selectOne("member.selectByMid", mid);
		
		return member;
	}
	public int insert(Member member) {
		LOGGER.info("실행");
		int rows = insert("member.insert", member);
		return rows;
	}
	public int update(Member member) {
		LOGGER.info("실행");
		int rows = update("member.updateMember", member);
		return rows;
	}
	public void deletebyMid(String mid) {
		LOGGER.info("실행");
		int rows = delete("member.deleteByMid", mid);
	}
	public Member selectByMemail(String memail) {
		LOGGER.info("실행");
		Member member = selectOne("member.selectByMemail", memail);
		
		return member;
	}
	public void updateBymid(String key2, String pmid) {
		LOGGER.info("실행");
		Map map = new HashMap();
		map.put("mpassword", key2);
		map.put("mid", pmid);
		int rows = update("member.updateByMid",map);
		
	}
	
	
}	
