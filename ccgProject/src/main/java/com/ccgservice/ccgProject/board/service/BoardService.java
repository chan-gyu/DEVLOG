package com.ccgservice.ccgProject.board.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
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
	
	public List<Board> boardList(String categoryName){
		List<Board> list = mapper.boardList(categoryName);
		
		return list;
	}
	
	public Board selectBoardView(String boardIdx) {
		Board b = mapper.selectBoardView(boardIdx);
		
		return b;
				
	}

}
