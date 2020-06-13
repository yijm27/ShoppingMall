package com.mycompany.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.HomeDao;
import com.mycompany.project.model.Home;


@Service
public class HomeService {

	@Autowired
	private HomeDao homeDao;
	
	public List<Home> getList() {
		List<Home> list = homeDao.selectAll();
		return list;
	}

	public List<Home> getListBypcolor(String pcolor) {
		List<Home> list = homeDao.selectBypcolor(pcolor);
		return list;
	}
	public List<Home> getListBypname(String pname) {
		List<Home> list = homeDao.selectBypname(pname);
		return list;
	}
	public List<Home> getList(int pageNo, int rowsPerPage){
		List<Home> list= homeDao.selectByPage(pageNo, rowsPerPage);
		return list;
	}
	public int getTotalHomeNo() {
		int totalHomeNo= homeDao.count();
		return totalHomeNo;
	}

	public List<Home> getListBypcolor(String pcolor, int pageNo, int rowsPerPage) {
		List<Home> list= homeDao.selectByPage(pcolor,pageNo, rowsPerPage);
		return list;
	}

	public int getTotalHomeNoBypcolor(String pcolor) {
		int totalHomeNo= homeDao.countBypcolor(pcolor);
		return totalHomeNo;
	}

	public List<Home> getListBysearchHtitle(String searchHtitle, int pageNo, int rowsPerPage) {
		List<Home> searchlist= homeDao.searchByHtitle(searchHtitle,pageNo, rowsPerPage);
		return searchlist;
	}

	public int getTotalHomeNoByhtitle(String searchHtitle) {
		int totalHomeNo= homeDao.countByhtitle(searchHtitle);
		return totalHomeNo;
	}

	public int getTotalHomeNoBypname(String pname) {
		int totalHomeNo= homeDao.countBypname(pname);
		return totalHomeNo;
	}

	public List<Home> getListBypname(String pname, int pageNo, int rowsPerPage) {
		List<Home> list= homeDao.selectByPageBypname(pname,pageNo, rowsPerPage);
		return list;
	}
	

	
}
