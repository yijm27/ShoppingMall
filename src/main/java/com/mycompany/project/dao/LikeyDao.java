package com.mycompany.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Likey;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class LikeyDao extends EgovAbstractMapper{

	private static final Logger LOGGER = LoggerFactory.getLogger(LikeyDao.class);
	
	public Likey selectCountByPno(int lkpno) {
		Likey likey = selectOne("likey.selectCountByPno",lkpno);
		return likey;
	}
	public List<Likey> selectListByMid(String lkoid) {
		List<Likey> lklist = selectList("likey.selectListByMid",lkoid);
		return lklist;
	}
	public int insert(String lkoid,int lkpno) {
		Map<String,Object> map= new HashedMap();
		map.put("lkoid", lkoid);
		map.put("lkpno", lkpno);
		int rows= insert("likey.insert", map);
		return rows;
	}
	public int delete(String lkoid,int lkpno) {
		Map<String,Object> map= new HashedMap();
		map.put("lkoid", lkoid);
		map.put("lkpno", lkpno);
		int rows= delete("likey.delete", map);
		return rows;
	}
}
