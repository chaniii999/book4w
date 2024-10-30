<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- fmt 태그 라이브러리 추가 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>도서 목록</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* 고급스러운 폰트로 변경 */
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: #f5efe6; /* 베이지톤 배경 */
        }
        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 30px; /* 여백 증가 */
        }
        h2 {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 2em; /* 제목 크기 증가 */
            color: #e7d9c7; /* 부드러운 베이지 */
            margin-bottom: 20px; /* 아래쪽 여백 증가 */
        }
        h2 a {
            color: #e7d9c7; /* 부드러운 베이지 */
            font-weight: 700;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px;
        }
        .card-container > a:first-child {
            margin-left: 1.25rem;
        }
        .card {
            background-color: #eae4da;
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 0;
            flex: 1 1 calc(25% - 40px); /* 4열로 조정 */
            box-sizing: border-box;
            transition: transform 0.3s, box-shadow 0.3s;
            min-width: 150px;
            max-width: 200px;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 효과 증가 */
        }
        .card img {
            width: 100%; /* 카드의 너비에 맞게 조정 */
            height: auto; /* 비율을 유지하며 높이 자동 조정 */
            border-radius: 8px; /* 둥근 모서리 증가 */
            margin-bottom: 0; /* 아래쪽 여백 제거 */
        }
        .card h3 {
            font-size: 1.5em; /* 제목 크기 증가 */
            margin: 10px 0;
            color: #4a3f35;
        }
        .card p {
            margin: 5px 0;
            color: #666; /* 설명 텍스트 색상 변경 */
        }
        .card-info {
            display: flex;
            flex-direction: column; /* 세로 방향으로 나열 */
            justify-content: center; /* 수직 중앙 정렬 */
            text-align: left; /* 텍스트 왼쪽 정렬 */
            padding-left: 15px; /* 왼쪽 여백 추가 */
        }
        .card-info .author-pub {
            font-size: 0.9em;
            margin: 5px 0;
            color: #999; /* 저자 및 출판사 색상 변경 */
        }
        .card-info .like-rating {
            font-size: 1.1em; /* 글자 크기 조정 */
            margin: 5px 0;
            display: flex;
            justify-content: flex-start; /* 왼쪽 정렬로 변경 */
            align-items: center; /* 수직 정렬 추가 */
            color: #333; /* 좋아요 및 평점 텍스트 색상 변경 */
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            padding: 20px 0;
        }
        .pagination a {
            margin: 0 5px;
            padding: 10px 20px; /* 패딩 증가 */
            text-decoration: none;
            color: #0078D7;
            border: 1px solid #0078D7;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        .pagination a:hover {
            background-color: #0078D7; /* 호버 시 배경 색상 변경 */
            color: white; /* 호버 시 텍스트 색상 변경 */
        }
        .pagination .active {
            background-color: #0078D7;
            color: white;
        }
        .sort-container {
            display: flex;
            align-items: center;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 12px 20px; /* 패딩 증가 */
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            font-size: 14px;
            margin-left: auto;
        }
        .sort-container label {
            margin-right: 10px;
            font-weight: bold;
            color: #333;
        }
        .sort-container select {
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            background-color: #f9f9f9;
            color: #333;
            transition: border-color 0.3s, background-color 0.3s;
        }
        .sort-container select:focus {
            border-color: #4CAF50;
            outline: none;
        }
        .sort-container select:hover {
            background-color: #f1f1f1;
        }
    </style>


</head>
<body>
<div class="container">
    <h2>
        <a href="${pageContext.request.contextPath}/board/list" style="text-decoration: none; color: black;">도서 목록</a>
        <div class="sort-container">
            <form action="${pageContext.request.contextPath}/board/list" method="get">
                <input type="hidden" name="page" value="0" />
                <input type="hidden" name="query" value="${param.query}" />
                <label for="sort">정렬 기준:</label>
                <select name="sort" id="sort" onchange="this.form.submit()">
                    <option value="">기본 정렬</option>
                    <option value="likeCount" <c:if test="${param.sort == 'likeCount'}">selected</c:if>>좋아요 순</option>
                    <option value="reviewCount" <c:if test="${param.sort == 'reviewCount'}">selected</c:if>>리뷰 수 순</option>
                    <option value="rating" <c:if test="${param.sort == 'rating'}">selected</c:if>>평점 순</option>
                </select>
            </form>
        </div>
    </h2>
    <div class="card-container">
        <c:if test="${not empty bList}">
            <c:forEach var="book" items="${bList}" begin="0" end="7">
    <a href="${pageContext.request.contextPath}/board/detail/${book.id}" class="card-link" style="text-decoration: none; color: inherit;">
        <div class="card">
            <img src="/images/Cover4.jpg" class="card-img-top card-img" alt="${book.name} 이미지">
            <div class="card-info">
                <h3>${book.name}</h3>
                <p class="author-pub">${book.writer} | ${book.pub}</p>
                <div class="like-rating">
                    <p><strong>❤️</strong> ${book.likeCount} <strong>⭐</strong>
                        <c:choose>
                            <c:when test="${book.reviewCount == 0}">
                                0
                            </c:when>
                            <c:otherwise>
                                <fmt:formatNumber value="${book.rating / book.reviewCount}" maxFractionDigits="1" />
                            </c:otherwise>
                        </c:choose>
                        <strong>🗨️</strong> ${book.reviewCount}
                    </p>
                </div>
            </div>
        </div>
    </a>
</c:forEach>

        </c:if>
        <c:if test="${empty bList}">
            <p>검색 결과가 없습니다.</p>
        </c:if>
<div class="pagination">
    <c:if test="${maker.hasPrevious()}">
        <c:set var="prevStartPage" value="${maker.number - 1}" />
        <a href="?sort=${param.sort}&query=${param.query}&page=${prevStartPage}" class="prev">&laquo; 이전</a>
    </c:if>

    <c:if test="${maker.totalPages > 0}">
        <c:set var="startPage" value="${maker.number - (maker.number % 10)}" />
        <c:set var="endPage" value="${startPage + 9}" />
        <c:set var="lastPage" value="${maker.totalPages - 1}" />

        <c:if test="${endPage > lastPage}">
            <c:set var="endPage" value="${lastPage}" />
        </c:if>

        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <a href="?sort=${param.sort}&query=${param.query}&page=${i}" class="${i == maker.number ? 'active' : ''}">
                ${i + 1}
            </a>
        </c:forEach>

        <c:if test="${endPage < lastPage}">
            <c:set var="nextStartPage" value="${endPage + 1}" />
            <a href="?sort=${param.sort}&query=${param.query}&page=${nextStartPage}" class="next">다음 &raquo;</a>
        </c:if>
    </c:if>
</div>

</body>
</html>