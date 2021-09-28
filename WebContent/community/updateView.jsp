<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리 커뮤니티</title>
<script type="text/javascript">
function post_data() {
	frm1.submit();
}
</script>
<link rel="stylesheet" href="../css/temp.css">
</head>
<body>
<h3>동아리 커뮤니티 글 수정</h3>
<hr>
<form name="frm1" method="post" action="updateAction.jsp">
 
 <table>
 	<tr><td width="35%" class="td1">제목</td>
 		<td><input type="text" name="subject" value="${bean.subject }" size="50" required="required"></td>
 	</tr>
 	<tr><td class="td1">작성자</td>
 		<td><input type="text" name="name" value="name" size="50" disabled></td>
 	</tr>
 	
 	<tr><td class="td1">글 비밀번호</td>
 		<td><input type="password" name="password" size="70" class="input1"></td>
 	</tr>
 	<tr><td class="td1">내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td><textarea  rows="20" cols="80" name="content" required="required">${bean.content}</textarea></td>
 	</tr>
 	<tr><td colspan="2" align="center">
 	<input type="submit" value="저장">
 	<input type="reset"  value="다시쓰기">
 	<input type="button" value="목록">
 	</td></tr>
 </table>
 </form>
</body>
</html>