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
    <c:if test="${not empty reviewList}">
        <c:forEach var="review" items="${reviewList}">
            <div class="review-item">
                <p><strong>작성자:</strong> ${review.memberName} | <strong>내용:</strong> ${review.content} |
                    <strong>평점:</strong> ${review.rating} / 5.0</p>
            </div>
        </c:forEach>
    </c:if>

</div>

<div class="pagination">
    <c:if test="${page.hasPrevious()}">
        <a href="?page=${page.number - 1}">이전</a>
    </c:if>
    <span>페이지 ${page.number + 1} / ${page.totalPages}</span>
    <c:if test="${page.hasNext()}">
        <a href="?page=${page.number + 1}">다음</a>
    </c:if>
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

<!-- AJAX를 통해 리뷰 작성 요청 및 새로고침 처리 -->
<script>
    // JavaScript에서 사용할 book 객체 전달
    const book = {
        id: "${book.id}"
    };

    function submitReview(event) {
        event.preventDefault();

        const content = document.getElementById("reviewContent").value;
        const rating = document.getElementById("reviewRating").value;
        const memberName = "사용자"; // 실제 로그인된 사용자 이름을 사용해야 함

        // 화면에 리뷰를 즉시 추가 (DB 저장 전)
        const reviewList = document.querySelector(".review-list");
        const reviewItem = document.createElement("div");
        reviewItem.classList.add("review-item");
        reviewItem.innerHTML = `
            <p><strong>작성자:</strong> ${memberName} | <strong>내용:</strong> ${content} |
            <strong>평점:</strong> ${rating} / 5.0</p>`;
        reviewList.appendChild(reviewItem);

        // 서버에 데이터를 비동기 전송 (DB에 저장)
        fetch(`/board/detail/${book.id}`, {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({content, rating})
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    console.log("리뷰가 성공적으로 저장되었습니다.");
                } else {
                    alert("리뷰 저장에 실패했습니다.");
                }
                // 서버 응답 후 페이지 새로고침
                location.reload();
            })
            .catch(error => {
                console.error("리뷰 저장 중 오류 발생:", error);
                alert("리뷰 저장에 실패했습니다.");
                // 오류 발생 후 페이지 새로고침
                location.reload();
            });

        // 입력 필드 초기화
        document.getElementById("reviewContent").value = "";
        document.getElementById("reviewRating").value = "1";
    }
</script>

<footer>
    <p>&copy; 2024 Book4W. All rights reserved.</p>
</footer>
</body>
</html>
