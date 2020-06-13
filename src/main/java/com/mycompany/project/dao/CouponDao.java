package com.mycompany.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Coupon;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class CouponDao extends EgovAbstractMapper{

	private static final Logger LOGGER = LoggerFactory.getLogger(CouponDao.class);
	
	public List<Coupon> selectListByMid(String cmid) {
		List<Coupon> clist = selectList("coupon.selectListByMid",cmid);
		return clist;
	}
	public int insert(String cmid,int cvalue) {
		Map<String,Object> map= new HashedMap();
		map.put("cmid", cmid);
		map.put("cvalue", cvalue);
		int rows= insert("coupon.insert", map);
		return rows;
	}
	public int delete(String cmid,int cvalue) {
		Map<String,Object> map= new HashedMap();
		map.put("cmid", cmid);
		map.put("cvalue", cvalue);
		int rows= delete("coupon.delete", map);
		return rows;
	}
}
