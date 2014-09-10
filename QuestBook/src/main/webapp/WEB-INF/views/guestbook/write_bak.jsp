<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Guestbook Write</title>

<!-- script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script-->
<script src="<c:url value="/resources/js/jquery-1.11.1.js"/>"></script>
<script>
<!--
$(document).ready(function(){
	var name = $('#name');
	var mail = $('#mail');
	var pwd = $('#pwd');
	var content = $('#content');
	
	$('#submit').click(function(){
	    // 정규식 - 이메일 유효성 검사
/* 	    var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	    if(!name.val()) {
	        alert('이름을 입력해주세요.');
	        name.focus();
	        return false;
	    } else if(!mail.val()){
	        alert('이메일주소를 입력해주세요.');
	        mail.focus();
	        return false;
	    } else if(!regEmail.test(mail.val())) {//클라이언트측 이메일 검증
	            alert('이메일주소가 유효하지 않습니다');
	            mail.focus();
	            return false;
	    } else if(!pwd.val()){
	        alert('비밀번호를 입력해주세요.');
	        pwd.focus();
	        return false;
	    } else if(!content.val()){
	        alert('내용을 입력해주세요.');
	        content.focus();
	        return false;
	    } */
	    
	 	if(confirm('정말로 글을 등록하시겠습니까?')) {
	 		$('form').attr({action:'${commandUrl}'}).submit();
	 	}
   });
});
// -->
</script>
<style>
table {width:100%; border-top:dotted;}
</style>
</head>
<body>
 
<form:form id="guestbookVO" name="guestbookVO" method="post">
    <input type="hidden" name="id" value="${result.id}" />
     
    <table>
        <tr>
            <th>이름</th>
            <td><input id="name" name="name" size="20" value="${result.name}" placeholder="이름을 입력하세요." autofocus /></td>
        </tr>
        <tr>
            <th>메일</th>
            <td><input type="email" id="mail" name="mail" size="20" value="${result.mail}" placeholder="메일주소를 입력하세요." /></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" id="pwd" name="pwd" size="20" placeholder="비밀번호를 입력하세요." /></td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
            	<textarea rows="4" cols="50"  id="content" name="content" placeholder="내용을 입력하세요.">${result.content}</textarea>
            </td>
        </tr>
    </table>
    
    <table>
	<tr>
		<td align="left"><br/><input type="button" id="button" value="목록" onClick="location.href='list'"; /></td>
		<td align="right"><br/><input type="submit" id="submit" value="등록" /></td>
	</tr>
	</table> 
</form:form>

</body>
</html>
