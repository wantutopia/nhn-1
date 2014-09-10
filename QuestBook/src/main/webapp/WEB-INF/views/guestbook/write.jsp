<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<!DOCTYPE html>
<html lang="ko" ng-app>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Guestbook Write</title>

<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" media="screen">
<%-- <link href="<c:url value="/resources/css/bootstrap-responsive.min.css"/>" rel="stylesheet" media="screen"> --%>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/angular.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-1.11.1.js"/>"></script>

<script>
<!--
$(document).ready(function(){
	$('#submit').click(function(){
	 	if(confirm('정말로 글을 등록하시겠습니까?')) {
	 		$('form').submit();
	 	}
   });
});
// -->
</script>
</head>
<body>
 
<form:form name="guestbookVO" action="${commandUrl}" method="post" 
ng-init="name='${result.name}';mail='${result.mail}';pwd='';content='${result.content}'">
    <input type="hidden" name="id" value="${result.id}" />

<br/>
<div class="row-fluid">
  <div class="span8 offset2">

	<table class="table table-bordered">
    <tr>
        <th width="150px">
        	<p class="text-center"><label class="control-label" for="name">이 름</label></p>
        </th>
        <td>
        	<input type="text" id="name" name="name" value="${result.name}" placeholder="이름을 입력하세요." autofocus 
        	ng-model="name" ng-maxlength="15" ng-required="true"/>
        	<span class="text-error" ng-show="guestbookVO.name.$error.required">이름을 입력해주세요.</span>
        </td>
    </tr>
    <tr>
        <th>
        	<p class="text-center"><label class="control-label" for="mail">이메일</label></p>
        </th>
        <td>
        	<input type="email" id="mail" name="mail" value="${result.mail}" placeholder="메일주소를 입력하세요." 
        	ng-model="mail" ng-maxlength="25" ng-required="true"/>
        	<span class="text-error" ng-show="guestbookVO.mail.$error.required">이메일주소를 입력해주세요.</span>
        	<span class="text-error" ng-show="guestbookVO.mail.$error.email">이메일 형식이 다릅니다.</span>
        </td>
    </tr>
    <tr>
        <th>
        	<p class="text-center"><label class="control-label" for="pwd">비밀번호</label></p>
        </th>
        <td>
        	<input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요." 
        	ng-model="pwd" ng-maxlength="15" ng-required="true"/>
        	<span class="text-error" ng-show="guestbookVO.pwd.$error.required">비밀번호를 입력해주세요.</span>
        </td>
    </tr>
    <tr>
        <th>
        	<p class="text-center"><label class="control-label" for="content">내 용</label></p>
        </th>
        <td>
        	<textarea rows="4"  id="content" name="content" placeholder="내용을 입력하세요." class="span10"
        	ng-model="content" ng-maxlength="5000" ng-required="true">${result.content}</textarea>
        	<br/>
        	<span class="text-error" ng-show="guestbookVO.content.$error.required">내용을 입력해주세요.</span>
        </td>
    </tr>
    </table>
    
    <table width="100%">
	<tr>
		<td><button type="button" class="btn" onclick="location.href='list'";><i class="icon-list"></i> 목록으로</button></td>
		<td>
			<p class="text-right">
			<button id="submit" type="submit" class="btn btn-primary"><i class="icon-pencil"></i> 등록하기</button>
			<!-- <a href="#myModal" role="button" class="btn" data-toggle="modal"><i class="icon-pencil"></i> 등록하기</a> -->
			</p>
		</td>
	</tr>
	</table>
	
  </div>
</div>

</form:form>




<!-- <div class="modal hide" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">Modal header</h3>
	</div>
	<div class="modal-body">
		<p>One fine body…</p>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">
			Close</button>
		<button class="btn btn-primary">Save changes</button>
	</div>
</div> -->

</body>
</html>
