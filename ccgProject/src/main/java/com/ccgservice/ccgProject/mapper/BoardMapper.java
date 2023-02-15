package com.ccgservice.ccgProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.ccgservice.ccgProject.board.dto.Board;
import com.ccgservice.ccgProject.board.dto.BoardFile;
import com.ccgservice.ccgProject.board.dto.Category;

@Mapper
@Repository
public interface BoardMapper {
	
	List<Category> selectCategory(boolean cntBoolean);
	int insertBoard(Board board);
	void insertBoardFileList(List<BoardFile> list)throws Exception;
	List<Board> boardList(@Param("categoryName") String categoryName, @Param("cPage") int cPage, @Param("numPerPage") int numPerPage);
	int boardListCount(String categoryName);
	Board selectBoardView(String boardIdx);
	int addCategory(String addCate);
	int deleteCategory(String deleteCate);
	int board_delete(String boardIdx);
	int update_Board(Board board);
	List<BoardFile> selectBoardFileList(int boardIdx) throws Exception;
	BoardFile selectBoardFileInfo(@Param("tidx") int tidx, @Param("boardIdx") int boardIdx) throws Exception;
	
}
