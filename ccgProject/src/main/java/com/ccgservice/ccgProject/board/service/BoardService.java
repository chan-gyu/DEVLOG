package com.ccgservice.ccgProject.board.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ccgservice.ccgProject.board.dto.Board;
import com.ccgservice.ccgProject.board.dto.BoardFile;
import com.ccgservice.ccgProject.board.dto.Category;
import com.ccgservice.ccgProject.board.util.FileUtils;
import com.ccgservice.ccgProject.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private FileUtils fileUtils;
	
	public List<Category> selectCategory(boolean cntBoolean){
		List<Category> list = mapper.selectCategory(cntBoolean);
		return list;
	}
	public void insertBoard(Board board, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		mapper.insertBoard(board);
		
		
		List<BoardFile> list = fileUtils.parseFileInfo(board.getBoardIdx(),board.getWriter(),multipartHttpServletRequest);
		if(CollectionUtils.isEmpty(list) == false) {
			mapper.insertBoardFileList(list); 
		}
		
		
		
		/*
		 * if(ObjectUtils.isEmpty(multipartHttpServletRequest)==false) { //getFileNames를
		 * 사용하면 서버로 한번에 전송되는 한 개 이상의 파일 태그 이름을 iterator 형식으로 가져올 수 있다. Iterator<String>
		 * iterator = multipartHttpServletRequest.getFileNames(); String name;
		 * while(iterator.hasNext()) { name = iterator.next();
		 * log.debug("file tag name : " + name); List<MultipartFile> list =
		 * multipartHttpServletRequest.getFiles(name); for(MultipartFile multipartFile :
		 * list) { log.info("start file information"); log.info("file name : " +
		 * multipartFile.getOriginalFilename()); log.info("file size : " +
		 * multipartFile.getSize()); log.info("file content type : " +
		 * multipartFile.getContentType()); log.info("end file information.\n"); } } }
		 */
	}
	
	public Board selectBoardDetail(int boardIdx) throws Exception {
		Board board = mapper.selectBoardView(Integer.toString(boardIdx));
		List<BoardFile> fileList = mapper.selectBoardFileList(boardIdx);
		board.setFileList(fileList);
		
		//mapper.updateHitCount(boardIdx);
		
		return board;
	}
	
	
	public List<Board> boardList(String categoryName, int cPage, int numPerPage){
		List<Board> list = mapper.boardList(categoryName, cPage, numPerPage);
		
		return list;
	}
	
	public int boardListCount(String categoryName) {
		return mapper.boardListCount(categoryName);
	}
	
	public Board selectBoardView(String boardIdx) {
		Board b = mapper.selectBoardView(boardIdx);
		
		return b;
				
	}
	
	public int addCategory(String addCate) {
		int result = mapper.addCategory(addCate);
		return result;
	}
	
	public int deleteCategory(String deleteCate) {
		int result = mapper.deleteCategory(deleteCate);
		return result;
	}
	
	public int board_delete(String boardIdx) {
		int result = mapper.board_delete(boardIdx);
		return result;
	}
	
	public int update_Board(Board board) {
		int result = mapper.update_Board(board);
		return result;
	}
	
	public BoardFile selectBoardFileInfo(int tidx, int boardIdx)throws Exception{
		return mapper.selectBoardFileInfo(tidx, boardIdx);
	}

}
