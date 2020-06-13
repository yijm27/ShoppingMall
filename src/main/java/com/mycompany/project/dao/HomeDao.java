package com.mycompany.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Home;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class HomeDao extends EgovAbstractMapper{

	private static final Logger LOGGER = LoggerFactory.getLogger(HomeDao.class);


	public List selectAll() {
		LOGGER.info("실행");
		List<Home> list1= new ArrayList();
		list1= selectList("home.selectAll");
		return list1;
	}


	public List<Home> selectBypcolor(String pcolor) {
		LOGGER.info("실행");
		List<Home> list1= new ArrayList();
		list1= selectList("home.selectBypcolor",pcolor);
		return list1;
	}
	public List<Home> selectBypname(String pname) {
		pname="%"+pname+"%";
		LOGGER.info("실행");
		List<Home> list1= new ArrayList();
		list1= selectList("home.selectBypname",pname);
		return list1;
	}
	public List<Home> selectByPage(int pageNo, int rowsPerPage){
		int startIndex=rowsPerPage*(pageNo-1);
		Map<String,Integer> map = new HashMap<>();
		map.put("startIndex", startIndex);
		map.put("rowsPerPage", rowsPerPage);
		List<Home> homelist= selectList("home.selectByPage",map);
		return homelist;
	}
	public int count() {
		int totalRows = selectOne("home.count");
		return totalRows;
	}


	public List<Home> selectByPage(String pcolor, int pageNo, int rowsPerPage) {
		int startIndex = rowsPerPage*(pageNo-1);
		Map<String,Object> map = new HashMap<>();
		map.put("pcolor", pcolor);
		map.put("startIndex", startIndex);
		map.put("rowsPerPage", rowsPerPage);
		List<Home> homelist= selectList("home.selectBypcolorByPage",map);
		return homelist;
	}


	public int countBypcolor(String pcolor) {
		int totalRows = selectOne("home.countBypcolor",pcolor);
		return totalRows;
	}


	public List<Home> searchByHtitle(String searchHtitle, int pageNo, int rowsPerPage) {
		int startIndex = rowsPerPage*(pageNo-1);
		Map<String,Object> map = new HashMap<>();
		searchHtitle="%"+searchHtitle+"%";
		map.put("searchHtitle", searchHtitle);
		map.put("startIndex", startIndex);
		map.put("rowsPerPage", rowsPerPage);
		List<Home> searchHlist= selectList("home.selectByHtitle",map);
		return searchHlist;
	}


	public int countByhtitle(String searchHtitle) {
		searchHtitle="%"+searchHtitle+"%";
		int totalRows = selectOne("home.countByhtitle",searchHtitle);
		return totalRows;
	}


	public int countBypname(String pname) {
		pname="%"+pname+"%";
		int totalRows = selectOne("home.countBypname",pname);
		return totalRows;
	}


	public List<Home> selectByPageBypname(String pname, int pageNo, int rowsPerPage) {
		int startIndex = rowsPerPage*(pageNo-1);
		pname="%"+pname+"%";
		Map<String,Object> map = new HashMap<>();
		map.put("pname", pname);
		map.put("startIndex", startIndex);
		map.put("rowsPerPage", rowsPerPage);
		List<Home> homelist= selectList("home.selectBypnameByPage",map);
		return homelist;
	}


	
}
