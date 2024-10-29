<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- fmt 태그 라이브러리 추가 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liked Books</title>
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
<h1>내 좋아요 목록</h1>

<c:choose>
    <c:when test="${empty likedBooks.content}">
            <p class="no-reviews">좋아요 목록이 없습니다. 첫 좋아요를 눌러보세요!</p>
    </c:when>
    <c:otherwise>
        <div>
            <c:forEach var="book" items="${likedBooks.content}">
                <a href="/board/detail/${book.id}" class="card">
                    <div class="card-header">
                        ${book.name} - ${book.writer}
                    </div>
                    <div class="card-rating">
                        평점: ★ <fmt:formatNumber value="${book.rating/ book.reviewCount}" maxFractionDigits="1" />
                    </div>
                    <div class="card-content">
                        좋아요 수: ${book.likeCount}
                    </div>
                </a>
            </c:forEach>
        </div>

        <!-- 페이지 네비게이션 -->
        <div class="pagination">
            <!-- 이전 페이지 버튼 -->
            <c:if test="${likedBooks.hasPrevious()}">
                <a href="?page=${likedBooks.number - 1}" class="prev">이전</a>
            </c:if>
            <c:if test="${!likedBooks.hasPrevious()}">
                <a class="disabled">이전</a>
            </c:if>

            <!-- 페이지 번호 -->
            <c:if test="${likedBooks.totalPages > 0}"> <!-- totalPages가 0보다 큰지 확인 -->
                <c:forEach var="i" begin="0" end="${likedBooks.totalPages - 1}">
                    <c:choose>
                        <c:when test="${likedBooks.number == i}">
                            <span class="active">${i + 1}</span> <!-- Active class applied here -->
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${i}">${i + 1}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </c:if>

            <!-- 다음 페이지 버튼 -->
            <c:if test="${likedBooks.hasNext()}">
                <a href="?page=${likedBooks.number + 1}" class="next">다음</a>
            </c:if>
            <c:if test="${!likedBooks.hasNext()}">
                <a class="disabled">다음</a>
            </c:if>
        </div>
    </c:otherwise>
</c:choose>


</body>
</html>
