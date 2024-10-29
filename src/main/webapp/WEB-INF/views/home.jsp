<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>추천 도서 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e9ecef;
            color: #333;
        }

        h1 {
            color: #495057;
            font-size: 2.5rem;
            font-weight: 700;
        }

        h2 {
            color: #007bff;
            font-size: 1.75rem;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .slider {
            position: relative;
            overflow: hidden;
            display: flex;
            justify-content: center;
        }

        .slider-wrapper {
            display: flex;
            transition: transform 0.75s ease-in-out;
            align-items: center;
        }


        .card {
            max-width: 364px; /* 기존 260px에서 약 1.4배 증가 */
            margin: 0 25px; /* 양옆 간격을 기존 15px에서 25px로 조정 */
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card:hover {
            transform: scale(1.08);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .card-img {
            height: 448px; /* 기존 320px에서 약 1.4배 증가 */
            width: 100%;
            object-fit: cover;
            display: block;
        }

        /* 고정된 위치의 버튼 스타일 */
        .control-button {
            position: fixed;
            top: 50%;
            transform: translateY(-50%);
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 1.5rem;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 10; /* Ensure buttons are above all other elements */
        }

        .control-button:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .prev-button {
            left: calc(20px + 3cm); /* 왼쪽 버튼을 카드에서 3cm 떨어지게 조정 */
        }

        .next-button {
            right: calc(20px + 3cm); /* 오른쪽 버튼을 카드에서 3cm 떨어지게 조정 */
        }



        /* Section transition styles */
        .section {
            display: none;
            opacity: 0;
            transform: translateX(100%);
            transition: opacity 0.75s ease-in-out, transform 0.75s ease-in-out;
        }

        .active-section {
            display: block;
            opacity: 1;
            transform: translateX(0);
        }

        .stars-outer {
            display: inline-block;
            position: relative;
            font-family: FontAwesome;
            font-size: 1em;
            color: #d3d3d3;
        }

        .stars-inner {
            position: absolute;
            top: 0;
            left: 0;
            white-space: nowrap;
            overflow: hidden;
            color: #f8ce0b;
        }
    </style>
</head>
<body>
<div class="container my-5 text-center">
    <h1 class="text-center">추천 도서 목록</h1>
    <!-- 평점 순 추천 도서 슬라이드 -->
    <div class="section active-section" id="section1">
        <h2 class="mt-5">평점이 높은 도서</h2>
        <div class="slider">
            <div class="slider-wrapper" id="ratingSlider">
                <c:forEach var="book" items="${recommendedByRating}">
                    <div class="card mb-4 shadow-sm">
                        <a href="board/detail/${book.bookUuid}" class="text-decoration-none">
                            <div class="text-center">
                                <img src="/images/Cover1.jpg" class="card-img-top card-img" alt="Book 1 이미지">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${book.bookName}</h5>
                                <p class="card-text">출판사: ${book.bookPub}</p>
                                <p class="card-text">평점: <fmt:formatNumber value="${book.bookRating}" type="number"
                                                                           minFractionDigits="1"
                                                                           maxFractionDigits="1"/></p>
                                <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                                <p class="card-text">좋아요 수: ${book.likeCount}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- 리뷰 수가 많은 도서 슬라이드 -->
    <div class="section" id="section2">
        <h2 class="mt-5">리뷰 수가 많은 도서</h2>
        <div class="slider">
            <div class="slider-wrapper" id="reviewSlider">
                <c:forEach var="book" items="${recommendedByReviewCount}">
                    <div class="card mb-4 shadow-sm">
                        <a href="board/detail/${book.bookUuid}" class="text-decoration-none">
                            <div class="text-center">
                                <img src="/images/Cover2.jpg" class="card-img-top card-img" alt="Book 2 이미지">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${book.bookName}</h5>
                                <p class="card-text">출판사: ${book.bookPub}</p>
                                <p class="card-text">
                                    평점:
                                    <span class="stars-outer">
                                        <span class="stars-inner" style="width: <c:out value='${book.bookRating / 5.0 * 100}'/>%;"></span>
                                    </span>
                                    <fmt:formatNumber value="${book.bookRating}" type="number" minFractionDigits="1" maxFractionDigits="1"/>
                                </p>
                                <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                                <p class="card-text">좋아요 수: ${book.likeCount}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- 좋아요 수가 많은 도서 슬라이드 -->
    <div class="section" id="section3">
        <h2 class="mt-5">좋아요 수가 많은 도서</h2>
        <div class="slider">
            <div class="slider-wrapper" id="likeSlider">
                <c:forEach var="book" items="${recommendedByLikeCount}">
                    <div class="card mb-4 shadow-sm">
                        <a href="board/detail/${book.bookUuid}" class="text-decoration-none">
                            <div class="text-center">
                                <img src="/images/Cover3.jpg" class="card-img-top card-img" alt="Book 3 이미지">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${book.bookName}</h5>
                                <p class="card-text">출판사: ${book.bookPub}</p>
                                <p class="card-text">평점: <fmt:formatNumber value="${book.bookRating}" type="number"
                                                                           minFractionDigits="1"
                                                                           maxFractionDigits="1"/></p>
                                <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                                <p class="card-text">좋아요 수: ${book.likeCount}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 고정된 위치의 전환 버튼 -->
    <button class="control-button prev-button" onclick="switchSection(-1)">&#9664;</button>
    <button class="control-button next-button" onclick="switchSection(1)">&#9654;</button>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    let currentSection = 0;
    const sections = document.querySelectorAll('.section');

    function switchSection(direction) {
        const current = sections[currentSection];
        currentSection = (currentSection + direction + sections.length) % sections.length;
        const next = sections[currentSection];

        current.classList.remove('active-section');
        next.classList.remove('active-section');

        current.style.transform = direction > 0 ? 'translateX(-100%)' : 'translateX(100%)';
        next.style.display = 'block';
        next.style.transform = direction > 0 ? 'translateX(100%)' : 'translateX(-100%)';

        setTimeout(() => {
            current.style.display = 'none';
            next.style.transform = 'translateX(0)';
            next.classList.add('active-section');
        }, 750);
    }

    setInterval(() => {
        switchSection(1);
    }, 10000);
</script>
</body>
</html>
