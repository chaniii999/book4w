<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liked Books</title>
</head>
<body>
    <h1>내 좋아요 목록</h1>

    <c:set var="user" value="${sessionScope['login']}" />
    <c:if test="${not empty user}">
        <c:choose>
            <c:when test="${not empty user.likedBooks}">
                <ul>
                    <c:forEach var="book" items="${user.likedBooks}">
                        <li>${book.title} - ${book.author}</li> <!-- 책 제목과 저자 출력 -->
                    </c:forEach>
                </ul>
            </c:when>
            <c:otherwise>
                <p>좋아요 목록이 없습니다.</p>
            </c:otherwise>
        </c:choose>
    </c:if>
    <c:if test="${empty user}">
        <p>로그인이 필요합니다.</p>
    </c:if>
</body>
</html>
