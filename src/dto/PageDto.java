package dto;

import lombok.Data;

@Data
public class PageDto {
	private int currentPage; 	//현재페이지
	private int totalCount;		//글의 전체 갯수
	private int pageSize;		//한개 페이지에 보여줄 글 갯수
	
	private int totalPage;		//전체 페이지 갯수
	private int startPage;
	private int endPage;		//꼭 필요하지 않습니다.
	
	private int startNo;
	
	public PageDto(int currentPage, int totalCount, int pageSize) { //외부(비즈니스 로직)에서 결정되는 값
		this.currentPage =currentPage;
		this.totalCount=totalCount;
		this.pageSize=pageSize;
		
		//totalCoung = 367개, pageSize=20, totalPage =?
		totalPage = (totalCount-1)/pageSize+1;
		//현재페이지 범위(1~totalPage)의 유효성을 체크
		this.currentPage=(currentPage>totalPage)? totalPage:currentPage;
		this.currentPage=(currentPage<1)? 1:currentPage;
		
		//mysql 의 limit 사용할 때
		startNo=(this.currentPage-1)*pageSize;
		
		startPage=(this.currentPage-1)/10*10+1; //페이지 번호 리스트 10개씩
		//현재 페이지 57 , startPage=51;
		//현재 페이지 7 , startPage=1;
		//현재 페이지 156 , startPage=151;
		//현재 페이지 160 , startPage=151;
		endPage = startPage+9;
		endPage = endPage > totalPage ? totalPage:endPage; //totalPage보다 큰값에 대한 제한.
	}
}
