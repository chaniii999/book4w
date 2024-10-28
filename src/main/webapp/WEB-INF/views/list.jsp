<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>도서 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e9ecef;
            color: #333;
        }
        h2 {
            color: #007bff;
            font-size: 1.75rem;
            font-weight: 600;
            margin-bottom: 30px;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }
        .card {
            max-width: 260px;
            margin: 0 15px;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
        .card-img {
            height: 320px;
            width: 100%;
            object-fit: cover;
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
            padding: 8px 16px;
            text-decoration: none;
            color: #0078D7;
            border: 1px solid #0078D7;
            border-radius: 5px;
            transition: background-color 0.2s, color 0.2s;
        }
        .pagination a:hover {
            background-color: #E1E1E1;
            color: white;
        }
        .pagination .active {
            background-color: #0078D7;
            color: white;
        }
        .sort-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .sort-container label {
            margin-right: 10px;
            font-weight: bold;
        }
        .sort-container select {
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <h2 class="text-center">도서 목록</h2>
        <div class="sort-container">
            <form action="${pageContext.request.contextPath}/board/list" method="get" class="ms-auto">
                <input type="hidden" name="page" value="0" />
                <input type="hidden" name="query" value="${param.query}" />
                <label for="sort">정렬 기준:</label>
                <select name="sort" id="sort" onchange="this.form.submit()">
                    <option value="">기본 정렬</option>
                    <option value="likeCount" <c:if test="${param.sort == 'likeCount'}">selected</c:if>>좋아요 순</option>
                    <option value="reviewCount" <c:if test="${param.sort == 'reviewCount'}">selected</c:if>>리뷰 수 순</option>
                    <option value="rating" <c:if test="${param.sort == 'rating'}">selected</c:if>>평점 수 순</option>
                </select>
            </form>
        </div>
        <div class="card-container">
            <c:if test="${not empty bList}">
                <c:forEach var="book" items="${bList}">
                    <a href="${pageContext.request.contextPath}/board/detail/${book.id}" class="text-decoration-none">
                        <div class="card">
                            <img src="/images/Cover4.jpg" class="card-img" alt="Book 3 이미지">
                            <div class="card-body">
                                <h5 class="card-title">${book.name}</h5>
                                <p><strong>저자:</strong> ${book.writer}</p>
                                <p><strong>출판사:</strong> ${book.pub}</p>
                                <p><strong>출판 연도:</strong> ${book.year}</p>
                                <p><strong>평점:</strong> ${book.rating}</p>
                                <p><strong>리뷰 수:</strong> ${book.reviewCount}</p>
                                <p><strong>좋아요 수:</strong> ${book.likeCount}</p>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </c:if>
            <c:if test="${empty bList}">
                <p>검색 결과가 없습니다.</p>
            </c:if>
        </div>
        <div class="pagination">
            <c:if test="${maker.hasPrevious()}">
                <c:set var="prevStartPage" value="${(maker.number - 10) < 0 ? 0 : (maker.number - 10)}" />
                <a href="?sort=${param.sort}&query=${param.query}&page=${prevStartPage.intValue()}" class="prev">&laquo; 이전</a>
            </c:if>
            <c:if test="${maker.totalPages > 0}">
                <c:set var="startPage" value="${(maker.number / 10) * 10}" />
                <c:set var="endPage" value="${(startPage + 9) < maker.totalPages ? (startPage + 9) : (maker.totalPages - 1)}" />
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <a href="?sort=${param.sort}&query=${param.query}&page=${i.intValue()}" class="${i == maker.number ? 'active' : ''}">
                        ${i + 1}
                    </a>
                </c:forEach>
            </c:if>
            <c:if test="${endPage < (maker.totalPages - 1)}">
                <c:set var="nextStartPage" value="${endPage + 1}" />
                <a href="?sort=${param.sort}&query=${param.query}&page=${nextStartPage.intValue()}" class="next">다음 &raquo;</a>
            </c:if>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
