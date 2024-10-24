<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>내 프로필</title>
</head>
<body>

<h1>내 프로필</h1>

<h2>내 좋아요 리스트</h2>
<c:if test="${not empty likedBooks}">
    <ul>
        <c:forEach var="book" items="${likedBooks}">
            <li>${book.bookName} - 작가: ${book.bookWriter}</li>
        </c:forEach>
    </ul>
</c:if>
<c:if test="${empty likedBooks}">
    <p>좋아요 리스트가 없습니다.</p>
</c:if>

</body>
</html>
