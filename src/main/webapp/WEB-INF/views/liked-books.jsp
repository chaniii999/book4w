<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liked Books</title>
    <link rel="stylesheet" href="/css/style.css"> <!-- CSS 파일 링크 추가 -->
    <style>
        .card {
            border: 1px solid #ccc;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
            text-decoration: none;
            color: inherit;
            display: block;
        }
        .card:hover {
            background-color: #f9f9f9;
        }
        .card-header {
            font-weight: bold;
            font-size: 1.2em;
        }
        .card-rating {
            color: #f39c12;
        }
    </style>
</head>
<body>
<h1>내 좋아요 목록</h1>

<c:set var="user" value="${sessionScope['login']}" />
<c:if test="${empty user}">
    <p>로그인이 필요합니다.</p>
</c:if>

<c:if test="${not empty user}">
    <c:if test="${not empty likedBooks}">
        <div>
            <c:forEach var="book" items="${likedBooks}">
                <a href="/board/detail/${book.id}" class="card">
                    <div class="card-header">
                        ${book.name} - ${book.writer}
                    </div>
                    <div class="card-rating">
                        평점: ${book.rating} ★
                    </div>
                    <div class="card-content">
                        좋아요 수: ${book.likeCount}
                    </div>
                </a>
            </c:forEach>
        </div>
    </c:if>

    <c:if test="${empty likedBooks}">
        <p>좋아요 목록이 없습니다.</p>
    </c:if>
</c:if>
</body>
</html>
