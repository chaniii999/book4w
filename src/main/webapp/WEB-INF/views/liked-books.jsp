<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liked Books</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #f5efe6; /* 톤 다운된 베이지 배경 */
            color: #4a3f35; /* 딥 브라운 텍스트 */
            margin: 0;
            padding: 0 20px;
        }

        h1 {
            text-align: center;
            font-size: 2.5rem;
            color: #b57d52; /* 따뜻한 브라운 */
            margin: 20px 0;
        }

        /* 카드 스타일 */
        .card-container {
            display: flex;
            flex-wrap: wrap; /* 한 줄에 여러 개 표시 */
            gap: 20px; /* 카드 간격 */
            justify-content: center;
        }

        .card {
            background-color: #eae4da; /* 카드 배경색 */
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 24px;
            width: 100%;
            max-width: 320px; /* 한 줄에 두 개씩 배치되도록 최대 너비 설정 */
            color: #4a3f35;
            transition: transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            display: block;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            background-color: #dcd4c5; /* Hover 시 살짝 진한 베이지 */
        }

        .card-header {
            font-size: 1.5rem;
            font-weight: bold;
            color: #b57d52; /* 따뜻한 브라운 */
            margin-bottom: 10px;
        }

        .card-rating {
            font-size: 1.2rem;
            color: #d4a373; /* 옐로우 브라운 */
            margin-bottom: 10px;
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

        /* 페이지 네비게이션 */
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

        /* 반응형 스타일 */
        @media (max-width: 768px) {
            .card {
                max-width: 100%; /* 모바일에서는 한 줄에 한 개씩 */
            }
        }
    </style>
</head>
<body>
    <h1>내 좋아요 목록</h1> <!-- 타이틀은 다른 페이지에서 바꿔 사용 가능 -->

    <c:choose>
        <c:when test="${empty likedBooks.content}">
            <p class="no-reviews">좋아요 목록이 없습니다. 첫 좋아요를 눌러보세요!</p>
        </c:when>
        <c:otherwise>
            <div class="card-container">
                <c:forEach var="book" items="${likedBooks.content}">
                    <a href="/board/detail/${book.id}" class="card">
                        <div class="card-header">
                            ${book.name} - ${book.writer}
                        </div>
                        <div class="card-rating">
                            평점: ★ <fmt:formatNumber value="${book.rating / book.reviewCount}" maxFractionDigits="1" />
                        </div>
                        <div class="card-content">
                            좋아요 수: ${book.likeCount}
                        </div>
                    </a>
                </c:forEach>
            </div>

            <!-- 페이지 네비게이션 -->
            <div class="pagination">
                <c:if test="${likedBooks.hasPrevious()}">
                    <a href="?page=${likedBooks.number - 1}">이전</a>
                </c:if>

                <c:forEach var="i" begin="0" end="${likedBooks.totalPages - 1}">
                    <c:choose>
                        <c:when test="${likedBooks.number == i}">
                            <span class="active">${i + 1}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${i}">${i + 1}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${likedBooks.hasNext()}">
                    <a href="?page=${likedBooks.number + 1}">다음</a>
                </c:if>
            </div>
        </c:otherwise>
    </c:choose>
</body>
</html>
