package com.ccgservice.ccgProject.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ccgservice.ccgProject.board.dto.Board;
import com.ccgservice.ccgProject.board.dto.BoardFile;
import com.ccgservice.ccgProject.board.dto.Category;
import com.ccgservice.ccgProject.board.service.BoardService;
import com.ccgservice.ccgProject.common.PageFactory;

@Controller
public class BoardController {
	
	ArrayList<Category> list = new ArrayList<>();
	
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
		
		//인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		try {
			//랜덤 문자 생성
			UUID uuid = UUID.randomUUID();
			//파일을 바이트 배열로 변환
			byte[] bytes=upload.getBytes();
			//파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			
			//실제 이미지 저장 경로
			String imgUploadPath = request.getSession().getServletContext().getRealPath("/")+"resources/ckeditor/images/"+ File.separator + uuid + "_" + fileName;

			//이미지 저장
			out = new FileOutputStream(imgUploadPath);
			out.write(bytes);
			out.flush();
			
			//ckEditor로 전송
			printWriter = response.getWriter();
			String callback = request.getParameter("CKEditorFuncNum");
			String fileUrl = request.getContextPath()+"/resources/ckeditor/images/" + uuid+"_"+fileName;
			
			printWriter.println("<script type='text/javascript'>"
					+"window.parent.CKEDITOR.tools.callFunction("
					+ callback + ",'" + fileUrl + "','이미지를 업로드하였습니다.')"
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
//		//카테고리리스트
//		List<Category> Categorylist = service.selectCategory(cntBoolean);
//		logger.info(Categorylist.toString());
//		//게시판리스트
//		List<Board> Boardlist = service.boardList();
//		//게시판리스트 시간수정
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
	public HashMap<String,Object> boardList(@RequestParam Map<String, Object> param,
											@RequestParam(value="cPage", defaultValue="1") int cPage,
											@RequestParam(value="numPerPage", defaultValue="5") int numPerPage) {
		String categoryName = (String) param.get("categoryName");
		boolean cntBoolean = true;
		//게시판리스트
		List<Board> Boardlist = service.boardList(categoryName, (cPage-1)*numPerPage , numPerPage);
		int totalData = service.boardListCount(categoryName);
		
		//카테고리리스트
		List<Category> Categorylist = service.selectCategory(cntBoolean);
		//게시판리스트 시간수정
		List<String> Datelist = new ArrayList<>();
		for (int i = 0; i < Boardlist.size(); i++) {
			LocalDateTime date = Boardlist.get(i).getRegdateTime();
			Datelist.add(i, date.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
		}
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("Boardlist", Boardlist);
		map.put("totalData", totalData);
		map.put("pageBar", PageFactory.getPageBar(cPage, numPerPage, totalData, 5, "${path}/admin/admin_board_List.do"));
		map.put("Categorylist", Categorylist);
		map.put("Datelist", Datelist);
		
		return map;
	}
	
	@RequestMapping("/index_board_List.do")
	@ResponseBody
	public HashMap<String,Object> boardList2(@RequestParam Map<String, Object> param,
											@RequestParam(value="cPage", defaultValue="1") int cPage,
											@RequestParam(value="numPerPage", defaultValue="5") int numPerPage) {
		String categoryName = (String) param.get("categoryName");
		boolean cntBoolean = true;
		
		//게시판리스트
		List<Board> Boardlist = service.boardList(categoryName, (cPage-1)*numPerPage , numPerPage);
		int totalData = service.boardListCount(categoryName);
		
		
		//카테고리리스트
		List<Category> Categorylist = service.selectCategory(cntBoolean);
		//게시판리스트 시간수정
		List<String> Datelist = new ArrayList<>();
		for (int i = 0; i < Boardlist.size(); i++) {
			LocalDateTime date = Boardlist.get(i).getRegdateTime();
			Datelist.add(i, date.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
		}
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("Boardlist", Boardlist);
		map.put("totalData", totalData);
		map.put("pageBar", PageFactory.getPageBar(cPage, numPerPage, totalData, 5, "${path}/index_board_List.do"));
		map.put("Categorylist", Categorylist);
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
	public ModelAndView index_Board_View(@RequestParam String boardIdx, ModelAndView mv) throws Exception{
		//Board board = service.selectBoardView(boardIdx);
		Board board = service.selectBoardDetail(Integer.parseInt(boardIdx));
		LocalDateTime date = board.getRegdateTime();
		String formatDate = date.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
		LocalDateTime update = board.getUpdateTime();
		
		if(update !=null) {
			String formatUpdateDate = update.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
			mv.addObject("formatUpdateDate", formatUpdateDate);
		}
		
		
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
	
	@RequestMapping("board/downloadBoardFile.do")
	public void downloadBoardFile(@RequestParam int tidx, @RequestParam int boardIdx, HttpServletResponse  response) throws Exception{
		BoardFile boardFile = service.selectBoardFileInfo(tidx, boardIdx);
		if(ObjectUtils.isEmpty(boardFile)==false) {
			String fileName = boardFile.getOriginalFileName();
			byte[] files = FileUtils.readFileToByteArray(new File(boardFile.getStoredFilePath()));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(files.length);
			response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(fileName, "UTF-8")+"\";");
			response.getOutputStream().write(files);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
	}
}
