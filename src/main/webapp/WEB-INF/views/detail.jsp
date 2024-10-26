<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${book.name} - 상세 정보</title>
    <link rel="stylesheet" href="/css/style.css">
    <style>
        .book-detail-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
        }

        .book-cover {
            width: 400px;
            height: 600px;
            margin-right: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .book-cover img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .book-info {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .book-info h2 {
            margin-bottom: 20px;
        }

        .book-meta {
            margin-top: 20px;
        }

        .review-list {
            margin-top: 40px;
        }

        .review-form {
            margin-top: 20px;
        }

        .review-item {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }
    </style>
</head>
<body>
<header>
    <h1>책 상세 정보</h1>
</header>

<div class="book-detail-container">
    <div class="book-cover">
        <c:choose>
            <c:when test="${not empty book.coverImage}">
                <img src="${book.coverImage}" alt="${book.name}의 표지"/>
            </c:when>
            <c:otherwise>
                <img src="https://via.placeholder.com/400x600" alt="기본 표지 이미지"/>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="book-info">
        <h2>${book.name}</h2>
        <p><strong>작가:</strong> ${book.writer}</p>
        <p><strong>출판사:</strong> ${book.pub}</p>
        <p><strong>출판년도:</strong> ${book.year}</p>
        <div class="book-meta">
            <p><strong>평점:</strong> ${book.rating} / 5.0</p>
            <p><strong>좋아요 수:</strong> ${book.likeCount}</p>
            <p><strong>리뷰 수:</strong> ${book.reviewCount}</p>
        </div>
    </div>
</div>

<div class="review-list">
    <h3>리뷰 목록</h3>
    <!-- 기존 리뷰 목록 -->
    <c:forEach var="review" items="${reviewList.content}">
        <div class="review-item">
            <p><strong>작성자:</strong> ${review.memberName} | <strong>내용:</strong> ${review.content} |
                <strong>평점:</strong> ${review.rating} / 5.0</p>
        </div>
    </c:forEach>
</div>

<!-- 리뷰 작성 폼 -->
<form id="reviewForm" class="review-form" onsubmit="submitReview(event)">
    <h4>리뷰 작성</h4>
    <textarea id="reviewContent" rows="3" cols="50" placeholder="리뷰 내용을 입력하세요"></textarea>
    <br>
    <label for="reviewRating">평점: </label>
    <select id="reviewRating">
        <c:forEach var="i" begin="1" end="5">
            <option value="${i}">${i}</option>
        </c:forEach>
    </select>
    <button type="submit">리뷰 작성</button>
</form>

<!-- AJAX를 통해 리뷰 작성 요청 -->
<script>
    // JavaScript에서 사용할 book 객체 전달
    const book = {
        id: "${book.id}"
    };

    const reviewList = document.querySelector(".review-list");
    console.log("reviewList 요소:", reviewList);

    // 전역 변수 선언
    let latestReview;

    function submitReview(event) {
        event.preventDefault();  // 기본 제출 동작 방지

        const content = document.getElementById("reviewContent").value;
        const rating = document.getElementById("reviewRating").value;

        fetch(`/board/detail/${book.id}`, {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({ content, rating })
        })
            .then(response => {
                console.log("응답 상태 코드:", response.status);  // 응답 상태 코드 확인
                return response.json();
            })
            .then(data => {
                console.log("서버 응답 데이터:", data);  // 서버 응답 데이터 확인
                latestReview = data;

                if (latestReview) {
                    addReviewToPage();
                    document.getElementById("reviewContent").value = "";
                    document.getElementById("reviewRating").value = "1";
                } else {
                    alert("리뷰 작성에 실패했습니다.");
                }
            })
            .catch(error => console.error("리뷰 작성 중 오류 발생:", error));
    }

    function addReviewToPage() {
        const review = latestReview;
        console.log("addReviewToPage에서 review 데이터 확인:", review);

        if (!review) {
            console.error("리뷰 데이터가 없습니다.");
            return;
        }

        const reviewItem = document.createElement("div");
        reviewItem.classList.add("review-item");
        reviewItem.textContent = `작성자: ${review.memberName} | 내용: ${review.content} | 평점: ${review.rating} / 5.0`;
        reviewList.appendChild(reviewItem);
    }
</script>

<footer>
    <p>&copy; 2024 Book4W. All rights reserved.</p>
</footer>
</body>
</html>
