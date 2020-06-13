package com.mycompany.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.LikeyDao;
import com.mycompany.project.model.Likey;
import com.mycompany.project.model.Product;

@Service
public class LikeyService {

	@Autowired
	private LikeyDao likeyDao;
	
	public Likey getCountByPno(int lkpno) {
		Likey likey= likeyDao.selectCountByPno(lkpno);
		return likey;
	}
	public List<Likey> getListByMid(String lkoid) {
		List<Likey> lklist= likeyDao.selectListByMid(lkoid);
		return lklist;
	}
	public int insert(String lkoid, int lkpno) {
		int rows = likeyDao.insert(lkoid,lkpno);
		return rows;
	}
	public int delete(String lkoid, int lkpno) {
		int rows = likeyDao.delete(lkoid,lkpno);
		return rows;
	}
}
