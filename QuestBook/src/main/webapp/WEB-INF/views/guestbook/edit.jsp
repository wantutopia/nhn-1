<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<!DOCTYPE html>
<html lang="ko" ng-app>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Guestbook Password Confirm</title>

<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" media="screen">
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/angular.js"/>"></script>

</head>
<body>

<form:form name="guestbookVO" action="${commandUrl}" method="post">
    <input type="hidden" name="articleId" value="${articleId}" />

	<div class="row-fluid">
	  <div class="span8 offset2">
	
		<div class="form-actions">
		<p class="text-center">
			<input type="password" id="pwdInput" name="pwdInput" placeholder="비밀번호" 
			ng-model="pwdInput" ng-maxlength="20" ng-required="true"/>
			<br/>
			<button id="submit" type="submit" class="btn btn-primary"><i class="icon-ok"></i> 비밀번호 확인</button>
			<button type="button" class="btn" onclick="history.back(-1)"><i class="icon-remove"></i> 취소</button>
		</p>
		</div>
	
	  </div>
	</div>

</form:form>

</body>
</html>
