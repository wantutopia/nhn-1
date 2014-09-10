<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Guestbook List</title>

<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" media="screen">
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-1.11.1.js"/>"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('#submit').click(function(){
	    $('#articleId').val(0);
	    $('form').attr({action:'form'}).submit();
	});
});
 
function fnCmdEdit(articleId) {
	$('#articleId').val(articleId);
    $('#commandUrl').val('form');
    $('form').attr({action:'edit'}).submit();
}
 
function fnCmdDelete(articleId) {
	$('#articleId').val(articleId);
	$('#commandUrl').val('delete');
	$('form').attr({action:'edit'}).submit();
}

</script>

</head>
<body>

<form:form id="guestbookVO" name="guestbookVO" method="post">
    <input type="hidden" id="articleId" name="articleId" />
    <input type="hidden" id="commandUrl" name="commandUrl" />

	<br/>
	<div class="row-fluid">
	  <div class="span8 offset2">
	
		<table class="table table-striped">
			<c:forEach var="result" items="${list}" varStatus="status">
			    <tr>
			        <td><strong>${result.name}</strong> ${result.mail}</td>
			        <td width="148px">
			        	<p class="text-right">${result.cdate}&nbsp;&nbsp;</p>
			        </td>
			    </tr>
			    <tr>
			        <td>${result.content}</td>
			        <td>
			       		<p class="text-right">
			        		<button class="btn btn-link" onclick="fnCmdEdit('${result.id}')"><i class="icon-edit"></i> 수정</button>
			        		<button class="btn btn-link" onclick="fnCmdDelete('${result.id}')"><i class="icon-remove"></i> 삭제</button>
			        	</p>
			        </td>
			    </tr>
			</c:forEach>
			    <tr>
			        <td colspan="2">
			        	<p class="text-right">
			        		<button id="submit" type="submit" class="btn btn-primary"><i class="icon-pencil"></i> 새글쓰기</button>
			        	</p>
			        </td>
			    </tr>
		</table>
	
	  </div>
	</div>
</form:form>

</body>
</html>
