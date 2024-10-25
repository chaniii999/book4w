<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>추천 도서 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f4;
        }

        h1 {
            color: #333;
        }

        h2 {
            color: #007bff;
        }

        .slider {
            position: relative;
            overflow: hidden;
            display: flex; /* Use flexbox to center the wrapper */
            justify-content: center; /* Center the wrapper */
        }

        .slider-wrapper {
            display: flex;
            transition: transform 0.5s ease;
            align-items: center; /* Center items vertically */
        }

        .card {
            max-width: 250px;
            margin: 0 10px; /* Space between cards */
            transition: transform 0.2s;
            cursor: pointer;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-img {
            height: 300px;
            width: 200px;
            object-fit: cover;
            display: block;
            margin: auto;
        }

        .control-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(255, 255, 255, 0.8);
            border: none;
            cursor: pointer;
            z-index: 1;
        }

        .prev-button {
            left: 10px;
        }

        .next-button {
            right: 10px;
        }
    </style>
</head>
<body>

<div class="container my-5 text-center">
    <h1 class="text-center">추천 도서 목록</h1>

    <!-- 평점 순 추천 도서 슬라이드 -->
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
                            <p class="card-text">작가: ${book.bookWriter}</p>
                            <p class="card-text">출판사: ${book.bookPub}</p>
                            <p class="card-text">평점: ${book.bookRating}</p>
                            <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                            <p class="card-text">좋아요 수: ${book.likeCount}</p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <button class="control-button prev-button" onclick="slide('ratingSlider', -1)">◀</button>
        <button class="control-button next-button" onclick="slide('ratingSlider', 1)">▶</button>
    </div>

    <!-- 리뷰 수가 많은 도서 슬라이드 -->
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
                            <p class="card-text">작가: ${book.bookWriter}</p>
                            <p class="card-text">출판사: ${book.bookPub}</p>
                            <p class="card-text">평점: ${book.bookRating}</p>
                            <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                            <p class="card-text">좋아요 수: ${book.likeCount}</p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <button class="control-button prev-button" onclick="slide('reviewSlider', -1)">◀</button>
        <button class="control-button next-button" onclick="slide('reviewSlider', 1)">▶</button>
    </div>

    <!-- 좋아요 수가 많은 도서 슬라이드 -->
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
                            <p class="card-text">작가: ${book.bookWriter}</p>
                            <p class="card-text">출판사: ${book.bookPub}</p>
                            <p class="card-text">평점: ${book.bookRating}</p>
                            <p class="card-text">리뷰 수: ${book.reviewCount}</p>
                            <p class="card-text">좋아요 수: ${book.likeCount}</p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <button class="control-button prev-button" onclick="slide('likeSlider', -1)">◀</button>
        <button class="control-button next-button" onclick="slide('likeSlider', 1)">▶</button>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function slide(sliderId, direction) {
        const slider = document.getElementById(sliderId);
        const sliderItems = slider.children;
        const totalItems = sliderItems.length;
        const cardWidth = sliderItems[0].offsetWidth; // Get the width of a card

        // Calculate the new transform value
        let currentTransform = parseInt(getComputedStyle(slider).transform.split(',')[4]) || 0;
        let newTransform = currentTransform + (direction * (cardWidth + 20)); // Add spacing

        // Limit the sliding
        if (newTransform > 0) {
            newTransform = 0; // Prevent sliding too far to the left
        } else if (Math.abs(newTransform) > (totalItems * (cardWidth + 20) - (slider.offsetWidth))) {
            newTransform = -(totalItems * (cardWidth + 20) - slider.offsetWidth); // Prevent sliding too far to the right
        }

        slider.style.transform = `translateX(${newTransform}px)`; // Apply the transform
    }
</script>
</body>
</html>
