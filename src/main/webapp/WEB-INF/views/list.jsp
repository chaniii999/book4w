<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- Include this line for the fmt tag -->
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

        .card {
            height: 300px; /* 카드의 전체 높이를 설정 */
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
            height: 100%; /* 카드 높이에 맞춰서 늘리기 */
            width: 100%; /* 카드의 전체 너비를 차지 */
            object-fit: cover; /* 비율을 유지하며 영역을 채우도록 설정 */
        }

        .card-body {
            display: flex;
            flex-direction: column; /* Set to column to stack elements vertically */
            justify-content: center; /* Center the content vertically */
            align-items: center; /* Center the content horizontally */
            height: 100%; /* Set height to fill the card */
            text-align: center; /* Center text within the card body */
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
        <!-- Your existing sort form here -->
    </div>
    <div class="row">
        <c:if test="${not empty bList}">
            <c:forEach var="book" items="${bList}">
                <div class="col-md-4 mb-4">
                    <a href="${pageContext.request.contextPath}/board/detail/${book.id}" class="text-decoration-none">
                        <div class="card">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="/images/Cover4.jpg" class="card-img" alt="Book 3 이미지">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title">${book.name}</h5>
                                        <p><strong>저자:</strong> ${book.writer}</p>
                                        <p><strong>출판사:</strong> ${book.pub}</p>
                                        <p><strong>출판 연도:</strong> ${book.year}</p>
                                        <p><strong>평점:</strong>
                                            <fmt:formatNumber value="${book.rating}" type="number" maxFractionDigits="1" minFractionDigits="1"/>
                                        </p> <!-- Format rating -->
                                        <p><strong>리뷰 수:</strong> ${book.reviewCount}</p>
                                        <p><strong>좋아요 수:</strong> ${book.likeCount}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty bList}">
            <p>검색 결과가 없습니다.</p>
        </c:if>
    </div>

    <div class="pagination">
        <!-- Your existing pagination code here -->
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
