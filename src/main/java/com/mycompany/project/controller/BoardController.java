package com.mycompany.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.project.model.Board;
import com.mycompany.project.model.Pager;
import com.mycompany.project.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger LOGGER = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/list.do")
	public String list(@RequestParam(defaultValue="1") int pageNo, 
						@RequestParam(defaultValue="10") int rowsPerPage, Model model, HttpSession session) {
		
		LOGGER.info("실행");
		session.setAttribute("sortHit",0);
		session.setAttribute("sortOld",0);
		session.setAttribute("sortNew",1);
		session.setAttribute("sortPhoto",0);
		session.setAttribute("sortMe", 0);
		Pager pager = new Pager(rowsPerPage, 5, boardService.getTotalBoardNo(), pageNo);
		
		session.setAttribute("pager", pager);
		
		List<Board> list = boardService.getList(pageNo, rowsPerPage);
		model.addAttribute("boardlist", list);
		
		return "board/list";
	}
	//조회수 정렬
	@RequestMapping(value = "/sortbyHitcount.do")
	public String sortbyHitcount(@RequestParam(defaultValue="1") int pageNo, 
						@RequestParam(defaultValue="10") int rowsPerPage, Model model, HttpSession session) {
		
		LOGGER.info("실행");
		session.setAttribute("sortHit",1);
		session.setAttribute("sortOld",0);
		session.setAttribute("sortNew",0);
		session.setAttribute("sortPhoto",0);
		session.setAttribute("sortMe", 0);
		Pager pager = new Pager(rowsPerPage, 5, boardService.getTotalBoardNo(), pageNo);
		
		session.setAttribute("pager", pager);
		
		List<Board> list = boardService.getListbyHit(pageNo, rowsPerPage);
		model.addAttribute("boardlist", list);
		
		return "board/list";
	}
	@RequestMapping(value = "/sortbyDate.do")
	public String sortbyDate(@RequestParam(defaultValue="1") int pageNo, 
						@RequestParam(defaultValue="10") int rowsPerPage, Model model, HttpSession session) {
		LOGGER.info("실행");
		session.setAttribute("sortHit",0);
		session.setAttribute("sortOld",1);
		session.setAttribute("sortNew",0);
		session.setAttribute("sortPhoto",0);
		session.setAttribute("sortMe", 0);
		int pagesPerGroup = 5;
		int totalCountBoard = boardService.getTotalBoardNo();
		Pager pager = new Pager(rowsPerPage, pagesPerGroup, totalCountBoard, pageNo);
		
		session.setAttribute("pager", pager);
		
		List<Board> list = boardService.getListbydate(pageNo, rowsPerPage);
		model.addAttribute("boardlist", list);
		
		return "board/list";
	}
	@RequestMapping(value = "/reviewlist.do")
	public String reviewlist(@RequestParam(defaultValue="1") int pageNo, 
						@RequestParam(defaultValue="10") int rowsPerPage, Model model, HttpSession session) {
		
		LOGGER.info("실행");
		session.setAttribute("sortHit",0);
		session.setAttribute("sortOld",0);
		session.setAttribute("sortNew",0);
		session.setAttribute("sortPhoto",1);
		session.setAttribute("sortMe", 0);
		int pagesPerGroup = 5;
		int totalCountBoard = boardService.getcount();
		Pager pager = new Pager(rowsPerPage, pagesPerGroup, totalCountBoard, pageNo);
		
		session.setAttribute("pager", pager);
		
		ArrayList<Board> list =  (ArrayList<Board>) boardService.selectAllByPage(pageNo, rowsPerPage);
								
		LOGGER.info("{}",list);
		
		
		
		/*Iterator<Board> iterator = list.iterator();*/
		/*while(iterator.hasNext()) { //리스트에 목록이 있다면 true 리턴!!
			Board board = iterator.next();// list 에서 가져와라 
			if(board.getBattachtype() == null) {
				iterator. // 이터레이터에서 지워주기 -> next(); 한거에서 지운다!! 	 
			}
		}*/
		model.addAttribute("boardlist", list);
		
		return "board/list";
	}
	@RequestMapping(value = "/reviewMe.do")
	public String reviewMelist(@RequestParam(defaultValue="1") int pageNo, 
						@RequestParam(defaultValue="10") int rowsPerPage, Model model, HttpSession session, HttpServletResponse response) {
		LOGGER.info("실행");
		String mid = (String) session.getAttribute("sessionMid");
		LOGGER.info("mid:{}", mid);
		if(mid != null) {
			session.setAttribute("sortHit",0);
			session.setAttribute("sortOld",0);
			session.setAttribute("sortNew",0);
			session.setAttribute("sortPhoto",0);
			session.setAttribute("sortMe", 1);
			int pagesPerGroup = 5;
			int totalCountBoard = boardService.getcountMe(mid);
			Pager pager = new Pager(rowsPerPage, pagesPerGroup, totalCountBoard, pageNo);
			
			session.setAttribute("pager", pager);
			
			ArrayList<Board> list =  (ArrayList<Board>) boardService.selectAllByPage(pageNo, rowsPerPage);
									
			LOGGER.info("{}",list);
					
			model.addAttribute("boardlist", list);
			
			return "board/list";
		} else {
			
			session.setAttribute("sortHit",0);
			session.setAttribute("sortOld",0);
			session.setAttribute("sortNew",1);
			session.setAttribute("sortPhoto",0);
			session.setAttribute("sortMe", 0);
			
			response.setContentType("text/html; charset=UTF-8");
			Pager pager = new Pager(rowsPerPage, 5, boardService.getTotalBoardNo(), pageNo);
			
			session.setAttribute("pager", pager);
			
			List<Board> list = boardService.getList(pageNo, rowsPerPage);
			model.addAttribute("boardlist", list);
			PrintWriter outmail;
			try {
				outmail = response.getWriter();
				outmail.println(
						"<script>alert('There is no review. Please login first'); opener.parent.window.location.reload(); self.close();</script>");
				outmail.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "board/list";
		
		}
		
		
	}
	//리뷰 작성
	@GetMapping("/write.do")
	public String writeForm() {
		LOGGER.info("실행");
		return "board/writeForm";
	}
	
	//리뷰 작성 
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String write(Board board, HttpSession session, HttpServletResponse response) throws Exception {
		LOGGER.info("실행");
		
		String mid = (String) session.getAttribute("sessionMid");
		if(mid != null) {
			board.setBwriter(mid);
			
			MultipartFile mf = board.getBattach();
			if(!mf.isEmpty()) {
				String saveDir = "C:/MyWorkspace/product/";
				String saveFileName = mid+"-"+new Date().getTime()+ "-" + mf.getOriginalFilename();
				File filePath = new File(saveDir + saveFileName);
				mf.transferTo(filePath);
				//본 이름 
				board.setBattachoname(mf.getOriginalFilename());
				//저장 이름
				board.setBattachsname(saveFileName);
				//파일 유형
				board.setBattachtype(mf.getContentType());
			}
			
			boardService.write(board);
				
			return "redirect:/board/list.do";
		} 
		return "redirect:/home/main.do";
	}
	@RequestMapping(value = "/image.do")
	public void image(int bno, HttpSession session, HttpServletResponse response) throws Exception {
		LOGGER.info("실행");
		
		String saveDir = "C:/MyWorkspace/product/";
		LOGGER.info("{}",bno);
		Board board = boardService.selectByBno(bno);
		
		String saveName = board.getBattachsname();
		String filePath = saveDir + saveName;
		if (saveName != null) {
			
			LOGGER.info(filePath);
			//mime 타입
			response.setContentType(board.getBattachtype());
			response.setContentLength((int) new File(filePath).length());
			InputStream is = new FileInputStream(filePath);
			//다운로드 응답을 클라이언트에게 주기
			OutputStream os = response.getOutputStream();
			//spring 이용
			FileCopyUtils.copy(is, os);
			os.close();
			is.close();
		}
	}
	
	@GetMapping(value="/detail.do")
	public String detail(Model model, int bno) {
		//int bno = Integer.parseInt(request.getParameter("bno"));
		
		boardService.incrementBhitcount(bno);
		Board board = boardService.selectByBno(bno);
		
		model.addAttribute("board",board);
		return "board/detail";
	}
	
	
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String updateForm(int bno, Model model) {
		LOGGER.info("실행");
		
		//디폴트값 주기
		Board board = boardService.selectByBno(bno);
			
		model.addAttribute("board", board);
		
		return "board/updateForm";
		
	}
	@PostMapping("/update.do")
	public String update(Board board , HttpSession session) {
		
		LOGGER.info("실행");
		boardService.updateBoard(board);
		Pager pager = (Pager) session.getAttribute("pager");
		return "redirect:/board/list.do?pageNo=" + pager.getPageNo();
	}
	@PostMapping("/updateBstarscore.do")
	public String updateBstarcore(int bno, int bstarscore, HttpSession session) {
		LOGGER.info("실행");
		boardService.updateBstarscore(bno, bstarscore);
		
		return "redirect:/board/detail.do?bno=" + bno;
	}
	
	@GetMapping(value="/delete.do")
	public String delete(int bno, HttpSession session) {
		LOGGER.info("실행");
		//int bno = Integer.parseInt(request.getParameter("bno"));
		
		boardService.deleteBoard(bno);
		Pager pager = (Pager) session.getAttribute("pager");
		
		
		return "redirect:/board/list.do?pageNo=" + pager.getPageNo();
	}
	@GetMapping("/battachDownload.do")
	public void filedownload(int bno, HttpServletRequest request, HttpServletResponse response) throws Exception {
		LOGGER.info("실행");
		Board board = boardService.selectByBno(bno);
			
		String filePath = "C:/MyWorkspace/attachs/" + board.getBattachsname();
		
		response.setContentType(board.getBattachtype());
				
		String encodedfileName = new String(board.getBattachoname().getBytes("UTF-8"), "ISO-8859-1");
		
		//다운로드 창 뜨게 응답하기
		response.setHeader("Content-Disposition", "attachment;filename=\"" + encodedfileName + "\";");
		
		//파일의 크기
		response.setContentLength((int) new File(filePath).length());//file length는 long 리턴
		//DB로 부터 오는 것 inputstream
		InputStream is = new FileInputStream(filePath);
		//다운로드 응답을 클라이언트에게 주기
		OutputStream os = response.getOutputStream();
		//spring 이용
		FileCopyUtils.copy(is, os);
		os.close();
		is.close();
		
	}	
}
