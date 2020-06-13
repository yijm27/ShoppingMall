package com.mycompany.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.BoardDao;
import com.mycompany.project.model.Board;

@Service
public class BoardService {
	private static final Logger LOGGER = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	private BoardDao boardDao;

	public List<Board> selectAllByPage(int pageNo, int rowsPerpage) {
		LOGGER.info("실행");
		List<Board> list = boardDao.selectAllByPage(pageNo, rowsPerpage);
		return list;
	}
	
	public void write(Board board) {
		LOGGER.info("실행");
		boardDao.insert(board);
	}

	public Board selectByBno(int bno) {
		LOGGER.info("실행");
		Board board = boardDao.selectByBno(bno);
		return board;
	}

	public void remove(int bno) {
		LOGGER.info("실행");
		boardDao.delete(bno);
		
	}

	/*public void update(Board updateBoard) {
		LOGGER.info("실행");
		boardDao.update(updateBoard);
		
	}*/
	//pagelist
	public List<Board> getList(int pageNo, int rowsPerPage){
		LOGGER.info("실행");
		List<Board> list = boardDao.selectByPage(pageNo, rowsPerPage);
		return list;
	}
	public int getTotalBoardNo() {
		LOGGER.info("실행");
		int totalBoardNo = boardDao.count();
		return totalBoardNo;
	}

	public void updateBoard(Board board) {
		LOGGER.info("실행");
		boardDao.updateByBno(board);
		
	}
	public void incrementBhitcount(int bno) {
		LOGGER.info("실행");
		boardDao.updateBhitcountByBno(bno);
	}

	public void deleteBoard(int bno) {
		boardDao.deleteByBno(bno);
		
	}

	public void updateBstarscore(int bno, int bstarscore) {
		LOGGER.info("실행");
		Board board = boardDao.selectByBno(bno);
		if(board.getBstarscore() != 0) {
			bstarscore =(int) ((bstarscore + board.getBstarscore())/2);
		}
		boardDao.updateBstarscoreByBno(bno, bstarscore);
		
	}

	public List<Board> getListbyHit(int pageNo, int rowsPerPage) {
		LOGGER.info("실행");
		List<Board> list = boardDao.selectByHit(pageNo, rowsPerPage);
		return list;
	}

	public List<Board> getListbydate(int pageNo, int rowsPerPage) {
		LOGGER.info("실행");
		List<Board> list = boardDao.selectByDate(pageNo, rowsPerPage);
		return list;
	}

	public List<Board> getListbyPhoto(int pageNo, int rowsPerPage) {
		LOGGER.info("실행");
		List<Board> list = boardDao.selectPhoto(pageNo, rowsPerPage);
		return list;
	}

	public int getcount() {
		LOGGER.info("실행");
		int count = boardDao.getCount();
		return count;
	}

	public int getcountMe(String mid) {
		LOGGER.info("실행");
		int count = boardDao.getCountMe(mid);
		return count;
	}
	

	
}
