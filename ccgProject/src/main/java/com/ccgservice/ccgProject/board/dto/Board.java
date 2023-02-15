package com.ccgservice.ccgProject.board.dto;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Board {
	
	private int boardIdx;
	private String categoryName;
	private String boardTitle;
	private String boardContent;
	private String writer;
	private LocalDateTime regdateTime;
	private LocalDateTime updateTime;
	
	private List<BoardFile> fileList;

}
