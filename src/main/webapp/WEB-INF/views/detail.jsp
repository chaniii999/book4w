<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 테스트</title>
    <style>
        .review-list {
            margin-top: 20px;
        }
        .review-item {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }
    </style>
</head>
<body>
<h1>리뷰 작성 테스트</h1>
<div class="review-list"></div>
<div id="reviewForm" class="review-form">
    <h4>리뷰 작성</h4>
    <textarea id="reviewContent" rows="3" cols="50" placeholder="리뷰 내용을 입력하세요"></textarea>
    <br>
    <label for="reviewRating">평점: </label>
    <select id="reviewRating">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select>
    <button onclick="submitReview()">리뷰 작성</button>
</div>
<script>
    const reviewList = document.querySelector(".review-list");

    function submitReview() {
        const content = document.getElementById("reviewContent").value;
        const rating = document.getElementById("reviewRating").value;

        // 예제 데이터를 사용해 비동기 요청 시뮬레이션
        const exampleResponse = {
            memberName: "exampleUser",
            content: content,
            rating: rating
        };

        console.log("예제 응답 데이터:", exampleResponse); // 확인용 콘솔 로그

        // 비동기 함수 호출
        addReviewToPage(exampleResponse);
    }

    function addReviewToPage(review) {
        console.log("리뷰 데이터:", review); // review 데이터 확인

        const reviewItem = document.createElement("div");
        reviewItem.classList.add("review-item");

        // 강제로 데이터를 설정하는 부분 추가
        reviewItem.innerHTML = `<p><strong>작성자:</strong> ${review.memberName} | <strong>내용:</strong> ${review.content} | <strong>평점:</strong> ${review.rating} / 5.0</p>`;

        console.log("리뷰 아이템 생성 완료:", reviewItem);

        reviewList.appendChild(reviewItem);
        console.log("리뷰가 리스트에 추가되었습니다.");
    }

    console.log("DOM 로드 완료.");
</script>
</body>
</html>
