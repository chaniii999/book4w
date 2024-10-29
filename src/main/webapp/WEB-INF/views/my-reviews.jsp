<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Reviews</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 10px 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.2s;
            text-decoration: none;
            color: inherit;
        }

        .card:hover {
            transform: scale(1.02);
            background-color: #fafafa;
        }

        .card-header {
            font-size: 1.2em;
            font-weight: bold;
        }

        .card-rating {
            color: #ffcc00; /* Star color */
        }

        .card-content {
            margin-top: 10px;
            font-size: 0.9em;
            color: #555;
        }

        .no-reviews {
            text-align: center;
            margin-top: 20px;
            color: #888;
        }
    </style>
</head>
<body>
    <h1>내 리뷰 관리</h1>

    <c:set var="user" value="${sessionScope['login']}" />
    <c:if test="${empty user}">
        <p>로그인이 필요합니다.</p>
    </c:if>

    <c:if test="${not empty myReviews}">
        <div>
            <c:forEach var="review" items="${myReviews}">
                <a href="/board/detail/${review.bookId}" class="card">
                    <div class="card-header">
                        ${review.bookName} - ${review.writer}
                    </div>
                    <div class="card-rating">
                        평점: ${review.rating} ★
                    </div>
                    <div class="card-content">
                        ${review.content}
                    </div>
                </a>
            </c:forEach>
        </div>
    </c:if>

    <c:if test="${empty myReviews and not empty user}">
        <p class="no-reviews">리뷰 목록이 없습니다.</p>
    </c:if>
</body>
</html>
