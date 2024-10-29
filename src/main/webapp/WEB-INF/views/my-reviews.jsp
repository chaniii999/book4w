<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a, .pagination span {
            margin: 0 5px;
            padding: 8px 12px;
            text-decoration: none;
            color: #007bff;
            border: 1px solid #007bff;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .pagination a:hover {
            background-color: #007bff;
            color: white;
        }

        .pagination .active {
            background-color: #007bff;
            color: white;
            border: none; /* Remove border for the active page */
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
        <c:if test="${not empty myReviews.content}">
            <div>
                <c:forEach var="review" items="${myReviews.content}">
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

            <div class="pagination">
                <c:if test="${myReviews.hasPrevious()}">
                    <a href="?page=${myReviews.number - 1}" aria-label="Previous">&laquo; 이전</a>
                </c:if>
                <c:forEach var="i" begin="0" end="${myReviews.totalPages - 1}">
                    <c:choose>
                        <c:when test="${i == myReviews.number}">
                            <span class="active">${i + 1}</span> <!-- Active class applied here -->
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${i}">${i + 1}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${myReviews.hasNext()}">
                    <a href="?page=${myReviews.number + 1}" aria-label="Next">다음 &raquo;</a>
                </c:if>
            </div>
        </c:if>

        <c:if test="${empty myReviews.content}">
            <p class="no-reviews">리뷰 목록이 없습니다. 리뷰를 작성해보세요!</p>
        </c:if>
    </c:if>

    <c:if test="${empty myReviews}">
        <p class="no-reviews">리뷰 목록이 없습니다. 리뷰를 작성해보세요!</p>
    </c:if>
</body>
</html>
