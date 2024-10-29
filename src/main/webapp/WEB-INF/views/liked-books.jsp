<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liked Books</title>
    <link rel="stylesheet" href="/css/style.css">
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
        .pagination {
            margin-top: 20px;
            text-align: center;
        }
        .pagination a {
            display: inline-block;
            margin: 0 5px;
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 3px;
            text-decoration: none;
            color: #333;
            transition: background-color 0.3s ease;
        }

        .pagination a:hover {
            background-color: #f1f1f1;
        }
        .pagination a.active {
            font-weight: bold;
            color: #fff;
            background-color: #333; /* 현재 페이지를 강조하는 색상 */
            pointer-events: none; /* 클릭 비활성화 */
        }
        .pagination a.disabled {
            color: #ccc;
            border-color: #ccc;
            pointer-events: none; /* 비활성화된 버튼 */
        }
    </style>
</head>
<body>
<h1>내 좋아요 목록</h1>

<c:choose>
    <c:when test="${empty likedBooks.content}">
        <p>좋아요 목록이 없습니다.</p>
    </c:when>
    <c:otherwise>
        <div>
            <c:forEach var="book" items="${likedBooks.content}">
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
            <c:forEach var="i" begin="0" end="${likedBooks.totalPages - 1}">
                <a href="?page=${i}" class="${likedBooks.number == i ? 'active' : ''}">
                    ${i + 1}
                </a>
            </c:forEach>

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
