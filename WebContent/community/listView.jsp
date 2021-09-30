<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리 커뮤니티</title>
<link rel="stylesheet" href="../css/boardlist.css?v=3">
</head>
<body>
<h3>동아리 커뮤니티</h3>
<hr>
<div style="margin:auto;">
<ul id="main">
	<li>
		<ul  class="row">
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>조회수</li>
			<li>작성일</li>
		</ul>
	</li>
 	<c:forEach var="vo" items="${list}"> 
	<li>
	<ul  class="row">
		<li>${vo.idx }</li>
		<li><a href="detailAction.jsp?idx=${vo.idx}&page=1" class="title">${vo.subject }</a>
	 		...<span style="color:orange;font-size: 80%;">(${vo.commentCount })
	 		</span></li>
		<li>${vo.name }</li>
		<li>${vo.readCount }</li>
		<li>
		<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd" var="wdate"/>
		<!-- 오늘 작성한 글은 시간으로 표시 -->
		<c:if test='${wdate == today}'>
		<fmt:formatDate value="${vo.wdate }" type="time"/>
		</c:if>
		<!-- 오늘 이전에 작성한 글은 날짜로 표시 -->
		<c:if test='${wdate != today}'>
		<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd"/>
		</c:if>
		</li>
	</ul>
	</li>
 	</c:forEach>
</ul>
<div style="margin:auto;">
 	Go!<a class="button" href="insertView.jsp">글쓰기</a>&nbsp;&nbsp;
 	<a class="button" href="${pageContext.request.contextPath }">홈 : ${pageContext.request.contextPath }
 	</a>&nbsp;&nbsp;&nbsp;작성글 총 개수 : 
</div>
<!-- 글목록 페이지 처리 : pagination -->
<div style="text-align: center;">
<hr>
<!-- href= "listAction.jsp?page=1" 요청 url은 현재와 같을 때 생략하고  ? 뒤에 파라미터값만 변경합니다. -->
	<a class="pagenum" href="?page=1">&lt;&lt;</a>
	<a class="pagenum" href="?page=1">&lt;</a> <!-- startPage를 현재 startPage -10 -->
	<c:forEach var="i" begin="${pageDto.startPge }" end="${pageDto.endPge }">
		<a class="pagenum" href="?page=${i}">${i }</a>
	</c:forEach>
	<a class="pagenum" href="?page=10">&gt;</a> <!-- startPage를 현재 startPage +10 -->
	<a class="pagenum" href="?page=10">&gt;&gt;</a> <!-- 마지막페이지 -->
</div>

</div>
<!-- request.contextPath : request.getContextPath 메소드 실행 결과와 동일. 
		   listAction.jsp 에서 pageContext 객체를 사용하여 listView.jsp로 요청이 전달되었기 때문에
		   pageContext.request 로 합니다.
		   
		   pageContext 객체(jsp내장객체) : jsp 파일(jsp페이지) 1개와 대응되는 객체.
		   
		-->	
</body>
</html>

