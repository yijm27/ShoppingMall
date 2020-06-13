package com.mycompany.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.CouponDao;
import com.mycompany.project.model.Coupon;
import com.mycompany.project.model.Likey;

@Service
public class CouponService {

	@Autowired
	private CouponDao couponDao;
	
	public List<Coupon> getListByMid(String cmid) {
		List<Coupon> clist= couponDao.selectListByMid(cmid);
		return clist;
	}
	public int insert(String cmid, int cvalue) {
		int rows = couponDao.insert(cmid,cvalue);
		return rows;
	}
	public int delete(String cmid, int cvalue) {
		int rows = couponDao.delete(cmid,cvalue);
		return rows;
	}
}
