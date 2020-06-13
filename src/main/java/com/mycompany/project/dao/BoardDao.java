package com.mycompany.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.project.model.Board;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Service
public class BoardDao extends EgovAbstractMapper{
	private static final Logger LOGGER = LoggerFactory.getLogger(BoardDao.class);
	
	public int insert(Board board) {
		LOGGER.info("실행");
		
		//insert를 실행하면 자동적으로 board에 bno가 들어가 있다(by useGeneratedKeys="true" keyProperty="bno")
		int rows = insert("board.insert", board);
		return rows;
	}
	public Board selectByBno(int bno) {
		LOGGER.info("실행");
		Board board = selectOne("board.selectByBno", bno);
		return board;
	}
	public List<Board> selectAllByPage(int pageNo, int rowsPerPage) {
		LOGGER.info("실행");
		int startIndex = (pageNo-1) * rowsPerPage;
		Map<String, Integer> map = new HashMap<>();
		map.put("startIndex", startIndex);
		map.put("rowsPerPage", rowsPerPage);
		
		List<Board> list = selectList("board.selectAllByPage", map);
		return list;
		
	}
	public List<Board> selectByPage(int pageNo, int rowsPerPage) {
		LOGGER.info("실행");
		int startIndex = (pageNo-1) * rowsPerPage;
		Map<String, Integer> map = new HashMap<>();
		map.put("startIndex", startIndex);
		map.put("rowsPerPage", rowsPerPage);
		List<Board> list = selectList("board.selectByPage", map);
		return list;
			
	}
	public int count() {
		int totalRows = selectOne("board.count");
		return totalRows;
	}
	public void delete(int bno) {
		LOGGER.info("실행");
		int rows = delete("board.delete",bno);
	}
	public void update(Board board) {
		LOGGER.info("실행");
		int rows = update("board.update", board);
	}
	public void updateByBno(Board board) {
		LOGGER.info("실행");
		int rows = update("board.updateByBno", board);
	}
	public void updateBhitcountByBno(int bno) {
		LOGGER.info("실행");
		int rows = update("board.updateBhitcountByBno", bno);
	}
	public void deleteByBno(int bno) {
		int rows = delete("board.deleteByBno", bno);
		
	}
	public void updateBstarscoreByBno(int bno, int bstarscore) {
		Map<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("bstarscore", bstarscore);
		
		int rows = update("board.updateBstarscoreByBno", map);
		
	}
	public List<Board> selectByHit(int pageNo, int rowsPerPage) {
		LOGGER.info("실행");
		int startIndex = (pageNo-1) * rowsPerPage;
		Map<String, Integer> map = new HashMap<>();
		map.put("startIndex", startIndex);
		map.put("rowsPerPage", rowsPerPage);
		List<Board> list = selectList("board.selectByPageHit", map);
		return list;
	}
	public List<Board> selectByDate(int pageNo, int rowsPerPage) {
		LOGGER.info("실행");
		int startIndex = (pageNo-1) * rowsPerPage;
		Map<String, Integer> map = new HashMap<>();
		map.put("startIndex", startIndex);
		map.put("rowsPerPage", rowsPerPage);
		List<Board> list = selectList("board.selectByPageDate", map);
		return list;
	}
	public List<Board> selectPhoto(int pageNo, int rowsPerPage) {
		LOGGER.info("실행");
		int startIndex = (pageNo-1) * rowsPerPage;
		Map<String, Integer> map = new HashMap<>();
		map.put("startIndex", startIndex);
		map.put("rowsPerPage", rowsPerPage);
		List<Board> list = selectList("board.selectByPagePhoto", map);
		return list;
	}
	public int getCount() {
		LOGGER.info("실행");
		int count = selectOne("board.getcount");
		return count;
	}
	public int getCountMe(String mid) {
		LOGGER.info("실행");
		
		int count = selectOne("board.getcountMe", mid);
		return count;
	}
	
}
