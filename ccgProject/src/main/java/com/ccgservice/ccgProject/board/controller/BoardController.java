package com.ccgservice.ccgProject.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ccgservice.ccgProject.board.dto.Board;
import com.ccgservice.ccgProject.board.dto.Category;
import com.ccgservice.ccgProject.board.service.BoardService;

@Controller
public class BoardController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/board/insert.do")
	public String insertBoard(@RequestParam Map<String,String> map,
							MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		Board board = new Board();
		board.setWriter(map.get("writer_name"));
		board.setCategoryName(map.get("category"));
		board.setBoardTitle(map.get("board_title"));
		board.setBoardContent(map.get("txtContent"));
		service.insertBoard(board, multipartHttpServletRequest);
		
		return "/admin/admin_board/admin_board_write";
	}
	
	@RequestMapping("/board/selectCategory.do")
	@ResponseBody
	public List<Category> selectCategory() {
		boolean cntBoolean = false;
		List<Category> list = service.selectCategory(cntBoolean);
		
		return list;
	}
	
	@RequestMapping("/admin/post/imageUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
							MultipartFile upload) throws Exception {
		
		logger.debug("post CKEditor img upload");
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		//?????????
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		try {
			//?????? ?????? ??????
			UUID uuid = UUID.randomUUID();
			//????????? ????????? ????????? ??????
			byte[] bytes=upload.getBytes();
			//?????? ?????? ????????????
			String fileName = upload.getOriginalFilename();
			
			//?????? ????????? ?????? ??????
			String imgUploadPath = request.getSession().getServletContext().getRealPath("/")+"resources/ckeditor/images/"+ File.separator + uuid + "_" + fileName;

			//????????? ??????
			out = new FileOutputStream(imgUploadPath);
			out.write(bytes);
			out.flush();
			
			//ckEditor??? ??????
			printWriter = response.getWriter();
			String callback = request.getParameter("CKEditorFuncNum");
			String fileUrl = request.getContextPath()+"/resources/ckeditor/images/" + uuid+"_"+fileName;
			
			printWriter.println("<script type='text/javascript'>"
					+"window.parent.CKEDITOR.tools.callFunction("
					+ callback + ",'" + fileUrl + "','???????????? ????????????????????????.')"
					+"</script>");
			
			printWriter.flush();
			
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) {out.close();}
				if(printWriter !=null) {printWriter.close();}
			}catch(IOException e) {e.printStackTrace();}
		}
		return ;
	}
	
//	@RequestMapping("/admin/admin_board_List.do")
//	public ModelAndView boardList(ModelAndView mv) {
//		boolean cntBoolean = true;
//		//?????????????????????
//		List<Category> Categorylist = service.selectCategory(cntBoolean);
//		logger.info(Categorylist.toString());
//		//??????????????????
//		List<Board> Boardlist = service.boardList();
//		//?????????????????? ????????????
//		List<String> Datelist = new ArrayList<>();
//		for (int i = 0; i < Boardlist.size(); i++) {
//			LocalDateTime date = Boardlist.get(i).getRegdateTime();
//			Datelist.add(i, date.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
//		}
//		HashMap<String,Object> map = new HashMap<String,Object>();
//		map.put("Boardlist", Boardlist);
//		map.put("Datelist", Datelist);
//		
//		logger.info("map.get(Boardlist) : " + map.get("Boardlist").toString());
//		logger.info("map.get(Datelist) : " + map.get("Datelist").toString());
//		
//		mv.addObject("Boardlist", Boardlist);
//		mv.addObject("Datelist", Datelist);
//		mv.addObject("Categorylist", Categorylist);
//		mv.setViewName("/admin/admin_board/admin_board_List");
//		return mv;
//	}
	@RequestMapping("/admin/move_admin_board_List.do")
	public String moveBoardList() {
		return "/admin/admin_board/admin_board_List";
	}
	
	@RequestMapping("/admin/admin_board_List.do")
	@ResponseBody
	public HashMap<String,Object> boardList(@RequestParam Map<String, Object> param) {
		String categoryName = (String) param.get("categoryName");
		boolean cntBoolean = true;
		//?????????????????????
		List<Category> Categorylist = service.selectCategory(cntBoolean);
		//??????????????????
		List<Board> Boardlist = service.boardList(categoryName);
		//?????????????????? ????????????
		List<String> Datelist = new ArrayList<>();
		for (int i = 0; i < Boardlist.size(); i++) {
			LocalDateTime date = Boardlist.get(i).getRegdateTime();
			Datelist.add(i, date.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
		}
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("Categorylist", Categorylist);
		map.put("Boardlist", Boardlist);
		map.put("Datelist", Datelist);
		
		return map;
	}
	
	@RequestMapping("/index_board_List.do")
	@ResponseBody
	public HashMap<String,Object> boardList2(@RequestParam Map<String, Object> param) {
		String categoryName = (String) param.get("categoryName");
		boolean cntBoolean = true;
		//?????????????????????
		List<Category> Categorylist = service.selectCategory(cntBoolean);
		//??????????????????
		List<Board> Boardlist = service.boardList(categoryName);
		//?????????????????? ????????????
		List<String> Datelist = new ArrayList<>();
		for (int i = 0; i < Boardlist.size(); i++) {
			LocalDateTime date = Boardlist.get(i).getRegdateTime();
			Datelist.add(i, date.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
		}
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("Categorylist", Categorylist);
		map.put("Boardlist", Boardlist);
		map.put("Datelist", Datelist);
		
		return map;
	}
	
	@RequestMapping("/board/Board_View.do")
	public ModelAndView Board_View(@RequestParam String boardIdx, ModelAndView mv) {
		Board board = service.selectBoardView(boardIdx);
		LocalDateTime date = board.getRegdateTime();
		String formatDate = date.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
		
		mv.addObject("board", board);
		mv.addObject("formatDate", formatDate);
		mv.setViewName("/admin/admin_board/admin_Board_View");
		
		return mv;
	}
	
	@RequestMapping("/board/index_Board_View.do")
	public ModelAndView index_Board_View(@RequestParam String boardIdx, ModelAndView mv) {
		Board board = service.selectBoardView(boardIdx);
		LocalDateTime date = board.getRegdateTime();
		String formatDate = date.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
		
		mv.addObject("board", board);
		mv.addObject("formatDate", formatDate);
		mv.setViewName("/board/Board_View");
		
		return mv;
	}
	
	@RequestMapping("/admin/board_update_page.do")
	public ModelAndView board_update_page(@RequestParam String boardIdx, ModelAndView mv) {
		Board board = service.selectBoardView(boardIdx);
		mv.addObject("updateIdx", boardIdx);
		mv.addObject("board", board);
		mv.setViewName("/admin/admin_board/admin_board_update");
		
		return mv;
	}
	
	@RequestMapping("/admin/board_delete.do")
	public String board_delete(@RequestParam String boardIdx) {

		int result = service.board_delete(boardIdx);
		if(result ==1) 	return moveBoardList();
		else return "/";
		
	}
	
	@RequestMapping("/board/board_update.do")
	public String board_update(@RequestParam String updateIdx, @RequestParam Map<String,String> map) {
		
		
		Board board = new Board();
		board.setBoardIdx(Integer.parseInt(updateIdx));
		board.setCategoryName(map.get("category"));
		board.setBoardTitle(map.get("board_title"));
		board.setBoardContent(map.get("txtContent"));
		
		service.update_Board(board);
		
		
		return moveBoardList();
	}
	
}
