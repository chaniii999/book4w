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
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #f5efe6; /* 베이지톤 배경 */
            color: #4a3f35; /* 딥 브라운 텍스트 */
            margin: 0;
            padding: 0;
        }

        h1, h2 {
            color: #b57d52; /* 따뜻한 브라운 */
            font-weight: 700;
        }

        h1 {
            font-size: 2.5rem;
            margin-top: 30px;
        }

        h2 {
            font-size: 1.75rem;
            margin-bottom: 20px;
        }

        .slider {
            position: relative;
            overflow: hidden;
            display: flex;
            justify-content: center;
            margin-bottom: 40px;
        }

        .slider-wrapper {
            display: flex;
            transition: transform 0.75s ease-in-out;
            align-items: center;
        }

        .card {
            max-width: 320px;
            margin: 0 15px;
            border: none;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            background-color: #eae4da; /* 카드 배경색 */
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card-img {
            height: 400px;
            width: 100%;
            object-fit: cover;
        }

        .card-body {
            padding: 15px;
            color: #4a3f35;
        }

        .card-title {
            font-size: 1.3rem;
            font-weight: bold;
            color: #b57d52; /* 따뜻한 브라운 */
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 1rem;
            color: #7e7366;
            margin-bottom: 8px;
        }

        .control-button {
            position: fixed;
            top: 50%;
            transform: translateY(-50%);
            background-color: #b57d52; /* 따뜻한 브라운 */
            color: #fff;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 1.5rem;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 10;
        }

        .control-button:hover {
            background-color: #a0694a;
        }

        .prev-button {
            left: 20px;
        }

        .next-button {
            right: 20px;
        }

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
    </style>
</head>
<body>
<div class="container my-5 text-center">
    <h1 class="text-center">🔥HOT🔥 도서 목록</h1>

    <!-- 평점 순 추천 도서 슬라이드 -->
    <div class="section active-section" id="section1">
        <h2 class="mt-5">평점이 높은 도서</h2>
        <div class="slider">
            <div class="slider-wrapper" id="ratingSlider">
                <c:forEach var="book" items="${recommendedByRating}">
                    <div class="card mb-4 shadow-sm">
                        <a href="board/detail/${book.bookUuid}" class="text-decoration-none">
                            <img src="/images/Cover1.jpg" class="card-img-top card-img" alt="Book 1 이미지">
                            <div class="card-body">
                                <h5 class="card-title">${book.bookName}</h5>
                                <p class="card-text">출판사: ${book.bookPub}</p>
                                <p class="card-text">⭐:
                                    <c:choose>
                                        <c:when test="${book.reviewCount == 0}">0</c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${book.bookRating / book.reviewCount}" type="number" minFractionDigits="1" maxFractionDigits="1"/>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <p class="card-text">❤️: ${book.likeCount}</p>
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
                            <img src="/images/Cover2.jpg" class="card-img-top card-img" alt="Book 2 이미지">
                            <div class="card-body">
                                <h5 class="card-title">${book.bookName}</h5>
                                <p class="card-text">출판사: ${book.bookPub}</p>
                                <p class="card-text">⭐:
                                    <c:choose>
                                        <c:when test="${book.reviewCount == 0}">0</c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${book.bookRating / book.reviewCount}" type="number" minFractionDigits="1" maxFractionDigits="1"/>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <p class="card-text">❤️: ${book.likeCount}</p>
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
                            <img src="/images/Cover3.jpg" class="card-img-top card-img" alt="Book 3 이미지">
                            <div class="card-body">
                                <h5 class="card-title">${book.bookName}</h5>
                                <p class="card-text">출판사: ${book.bookPub}</p>
                                <p class="card-text">⭐:
                                    <c:choose>
                                        <c:when test="${book.reviewCount == 0}">0</c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${book.bookRating / book.reviewCount}" type="number" minFractionDigits="1" maxFractionDigits="1"/>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <p class="card-text">❤️: ${book.likeCount}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 전환 버튼 -->
    <button class="control-button prev-button" onclick="triggerSwitchSection(-1)">&#9664;</button>
    <button class="control-button next-button" onclick="triggerSwitchSection(1)">&#9654;</button>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    let currentSection = 0;
    const sections = document.querySelectorAll('.section');
    let autoSwitchInterval;

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

    // 자동 전환 타이머 시작
    function startAutoSwitch() {
        clearInterval(autoSwitchInterval);
        autoSwitchInterval = setInterval(() => switchSection(1), 5000);
    }

    // 버튼 클릭 시 전환하고 자동 전환 타이머 재설정
    function triggerSwitchSection(direction) {
        switchSection(direction);
        startAutoSwitch(); // 버튼 클릭 시 자동 전환 재시작
    }

    // 사용자 비활성 상태일 때 5초 후 자동 전환
    function resetIdleTimer() {
        startAutoSwitch(); // 사용자 활동 시마다 자동 전환 재시작
    }

    // 페이지 로드 후 초기 자동 전환 타이머 설정
    window.onload = startAutoSwitch;

    // 이벤트 리스너로 사용자 활동 감지
    document.onmousemove = resetIdleTimer;
    document.onkeypress = resetIdleTimer;
</script>
</body>
</html>
