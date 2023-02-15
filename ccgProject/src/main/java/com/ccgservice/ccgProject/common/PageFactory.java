package com.ccgservice.ccgProject.common;

public class PageFactory {

	public static String getPageBar(int cPage, int numPerPage, int totalData, int pageBarSize, String url) {
		
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageNo = ((cPage-1)/pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String pageBar = "";
		
		pageBar +="<ul id='pageBar' class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo == 1) {
			pageBar += "<li class='page-item' disabled>";
			pageBar += "<a class='page-link' href='#'>[이전]</a>";
			pageBar += "</li>";
		}else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:pagebarMove(" + (pageNo-1) + ")'>[이전]</a>";
			pageBar += "</li>";
		}
		
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(cPage == pageNo) {
				pageBar += "<li class='page-item' disabled>";
				pageBar += "<a class='page-link' href='#'>" + pageNo + "</a>";
				pageBar += "</li>";
			}else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:pagebarMove(" + pageNo + ")'>" + pageNo + "</a>";
				pageBar += "</li>";
			}
			
			pageNo++;
			
		}
		
		if(pageNo > totalPage) {
			pageBar += "<li class='page-item' disabled>";
			pageBar += "<a class='page-link' href='#'>[다음]</a>";
			pageBar += "</li>";
		}else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:pagebarMove(" + pageNo + ")'>[다음]</a>";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		return pageBar;
	}
	
}
