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
        .container {
            margin-top: 0; /* 컨테이너 상단 여백 제거 */
            padding-top: 0; /* 컨테이너 내부의 상단 여백도 최소화 */
        }




        h2 {
            font-size: 1.75rem;
            margin-top: 5px; /* h2 요소의 상단 여백 제거 */
            margin-bottom: 5px; /* 슬라이더와의 간격을 줄임 */
            color: #b57d52; /* 따뜻한 브라운 */
            font-weight: 700;
        }


        .slider {
            position: relative;
            overflow: hidden;
            display: flex;
            justify-content: center;
            margin-top: -5px; /* 슬라이더의 위쪽 여백을 줄여 h2와의 간격을 최소화 */
            margin-bottom: 10px; /* 아래쪽 여백 조정 */
        }

        .slider-wrapper {
            display: flex;
            transition: transform 0.75s ease-in-out;
            align-items: center;
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
            background-color: #eae4da; /* 카드 배경색 */
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 0; /* 패딩을 0으로 설정하여 이미지가 카드와 밀착되게 함 */
            margin: 20px; /* 카드 간 간격 설정 */
            flex: 1 1 calc(25% - 20px); /* 카드 너비를 줄임 */
            box-sizing: border-box;
            transition: transform 0.3s, box-shadow 0.3s;
            min-width: 150px; /* 최소 너비 조정 */
            max-width: 200px; /* 최대 너비 조정 */
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
            color: #4a3f35; /* 제목 색상 변경 */
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


    <!-- 평점 순 추천 도서 슬라이드 -->
<div class="section active-section" id="section1">
    <h2 class="mt-5">🔥HOT🔥 평점이 높은 도서</h2>
    <div class="slider">
        <div class="slider-wrapper" id="ratingSlider">
            <c:forEach var="book" items="${recommendedByRating}">
                <div class="card mb-4 shadow-sm">
                    <a href="board/detail/${book.bookUuid}" class="text-decoration-none">
                        <img src="/images/Cover1.jpg" class="card-img-top card-img" alt="Book 1 이미지">
                        <div class="card-info">
                            <h3 class="card-title">${book.bookName}</h3>
                            <p class="author-pub">${book.bookWriter} | ${book.bookPub}</p>
                            <div class="like-rating">
                                <strong>❤️ ${book.likeCount}</strong>
                                <strong> ⭐
                                    <c:choose>
                                        <c:when test="${book.reviewCount == 0}">0</c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${book.bookRating / book.reviewCount}" type="number" minFractionDigits="1" maxFractionDigits="1"/>
                                        </c:otherwise>
                                    </c:choose>
                                </strong>
                                <strong> 🗨️ ${book.reviewCount}</strong>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- 리뷰 수가 많은 도서 슬라이드 -->
<div class="section" id="section2">
    <h2 class="mt-5">🔥HOT🔥 리뷰 수가 많은 도서</h2>
    <div class="slider">
        <div class="slider-wrapper" id="reviewSlider">
            <c:forEach var="book" items="${recommendedByReviewCount}">
                <div class="card mb-4 shadow-sm">
                    <a href="board/detail/${book.bookUuid}" class="text-decoration-none">
                        <img src="/images/Cover2.jpg" class="card-img-top card-img" alt="Book 2 이미지">
                        <div class="card-info">
                            <h3 class="card-title">${book.bookName}</h3>
                            <p class="author-pub">${book.bookWriter} | ${book.bookPub}</p>
                            <div class="like-rating">
                                <strong>❤️ ${book.likeCount}</strong>
                                <strong> ⭐
                                    <c:choose>
                                        <c:when test="${book.reviewCount == 0}">0</c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${book.bookRating / book.reviewCount}" type="number" minFractionDigits="1" maxFractionDigits="1"/>
                                        </c:otherwise>
                                    </c:choose>
                                </strong>
                                <strong> 🗨️ ${book.reviewCount}</strong>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- 좋아요 수가 많은 도서 슬라이드 -->
<div class="section" id="section3">
    <h2 class="mt-5">🔥HOT🔥 좋아요 수가 많은 도서</h2>
    <div class="slider">
        <div class="slider-wrapper" id="likeSlider">
            <c:forEach var="book" items="${recommendedByLikeCount}">
                <div class="card mb-4 shadow-sm">
                    <a href="board/detail/${book.bookUuid}" class="text-decoration-none">
                        <img src="/images/Cover3.jpg" class="card-img-top card-img" alt="Book 3 이미지">
                        <div class="card-info">
                            <h3 class="card-title">${book.bookName}</h3>
                            <p class="author-pub">${book.bookWriter} | ${book.bookPub}</p>
                            <div class="like-rating">
                                <strong>❤️ ${book.likeCount}</strong>
                                <strong> ⭐
                                    <c:choose>
                                        <c:when test="${book.reviewCount == 0}">0</c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${book.bookRating / book.reviewCount}" type="number" minFractionDigits="1" maxFractionDigits="1"/>
                                        </c:otherwise>
                                    </c:choose>
                                </strong>
                                <strong> 🗨️ ${book.reviewCount}</strong>
                            </div>
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
