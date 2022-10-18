package com.ccgservice.ccgProject.board.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardFile {
	
	private int tIdx;
	private int boardIdx;
	private String originalFileName;
	private String storedFilePath;
	private long fileSize;
	private String writer;

}
