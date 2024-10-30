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
        /* 전체 테마 색상과 글꼴 조정 */
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #f5efe6; /* 톤 다운된 베이지 배경 */
            color: #4a3f35; /* 딥 브라운 텍스트 */
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            font-size: 2.5rem;
            color: #b57d52; /* 따뜻한 브라운 */
            margin: 20px 0;
        }
        .card {
            background-color: #eae4da; /* 카드에 밝은 베이지톤 배경 */
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            padding: 24px;
            width: 90%;
            max-width: 700px;
            color: #4a3f35;
            transition: transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            display: block;
        }
        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            background-color: #dcd4c5; /* 카드 hover 시 살짝 진한 베이지 */
        }
        .card-header {
            font-size: 1.5rem;
            font-weight: bold;
            color: #b57d52; /* 따뜻한 브라운 */
            margin-bottom: 10px;
        }
        .card-rating {
            font-size: 1.2rem;
            color: #d4a373; /* 따뜻한 옐로우 브라운 */
            margin-bottom: 12px;
        }
        .card-content {
            font-size: 1.1rem;
            color: #4a3f35;
            line-height: 1.6;
        }
        .no-reviews {
            text-align: center;
            margin-top: 40px;
            color: #7e7366;
            font-size: 1.4rem;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        .pagination a, .pagination span {
            margin: 0 6px;
            padding: 12px 18px;
            text-decoration: none;
            color: #7e7366; /* 차분한 브라운 */
            border: 1px solid #b57d52;
            border-radius: 50%;
            transition: background-color 0.3s, color 0.3s;
            font-weight: bold;
        }
        .pagination a:hover {
            background-color: #b57d52;
            color: #ffffff;
        }
        .pagination .active {
            background-color: #b57d52;
            color: #ffffff;
            border: none;
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
                            평점: ★ <fmt:formatNumber value="${review.rating}" maxFractionDigits="1" />
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
                            <span class="active">${i + 1}</span>
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
