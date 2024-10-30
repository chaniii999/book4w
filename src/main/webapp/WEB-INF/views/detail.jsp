<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${book.name} - 상세 정보</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">

    <style>
        .book-detail-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
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
            width: 400px;
        }

        .book-info h2 {
            margin-bottom: 20px;
        }

        .book-meta {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            width: 100%;
            margin-top: 20px;
        }

        .book-meta p,
        .book-meta button {
            margin: 5px 0;
        }


        .review-form select {
            width: 20%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }

        .review-form textarea {
            width: 78%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            resize: vertical;
            height: 100px;
        }

        /* 리뷰 리스트 개별 항목 스타일 */
        .review-item {
            width: 90%; /* 리뷰 작성 창과 동일한 너비로 설정 */
            padding: 15px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
        }

        .review-form .submit-button {
            align-self: flex-end;
            padding: 8px 15px;
            font-size: 1em;
            color: #000;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .review-form .submit-button:hover {
            background-color: #f0f0f0;
        }

        .review-list {
            width: 90%;
            max-width: 1000px;
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .review-item {
            width: 100%;
            padding: 15px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            font-weight: bold;
        }

        .review-header select {
            width: 20%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;

        }

        .review-header .submit-button {
            padding: 8px 15px;
            font-size: 1em;
            color: #000;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
        }

        .review-header .submit-button:hover {
            background-color: #f0f0f0;
        }

        .review-header .nickname {
            font-size: 1.1em;
            color: #333;
        }

        .review-header .rating-box {
            display: flex;
            align-items: center;
            padding: 5px 8px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            color: #FFD700;
            font-size: 0.9em;
        }

        .rating-box .star {
            margin-right: 5px;
        }

        .review-content {
            font-size: 0.95em;
            line-height: 1.4;
            color: #333;
            margin-top: 10px;
            text-align: left;
            word-break: break-word;
        }

        .review-content textarea {
            width: 100%; /* 내용 입력 칸 너비 */
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            resize: vertical;
            height: 80px;
        }

        .edit-form textarea {
            width: 100%;
            box-sizing: border-box; /* 패딩과 경계를 포함해 전체 너비를 맞추기 위해 사용 */
        }


        .review-buttons {
            margin-top: auto;
            text-align: right;
        }

        .review-buttons button {
            margin-left: 5px;
            padding: 5px 10px;
            font-size: 0.85em;
            color: #000;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
        }

        .review-buttons button:hover {
            background-color: #f0f0f0;
        }

        #likeButton {
            padding: 8px 16px;
            font-size: 16px;
            font-weight: 500;
            color: #666; /* 기본 상태 텍스트 색상 */
            background-color: #fff;
            border: 1px solid #ddd; /* 얇은 외곽선 */
            border-radius: 8px; /* 둥근 모서리 */
            display: flex;
            align-items: center;
            gap: 8px; /* 아이콘과 텍스트 사이 여백 */
            cursor: pointer;
            transition: all 0.2s ease;
        }

        #likeButton:hover {
            background-color: #f9f9f9; /* 호버 시 약간 밝은 배경색 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 살짝 떠 있는 느낌 */
        }

        #likeButton.liked {
            color: #e63946; /* 좋아요 활성화 시 색상 */
            border-color: #e63946; /* 활성화된 외곽선 색상 */
            background-color: #ffe6e6; /* 활성화 시 연한 배경색 */
        }

        .rating-box {
            display: flex;
            flex-direction: row-reverse; /* 오른쪽부터 채워지도록 설정 */
            width: 150px; /* 별이 다섯 개가 들어갈 고정된 너비 */
            justify-content: space-between; /* 별이 고정된 폭 내에서 정렬되도록 설정 */
            overflow: hidden; /* 별이 배경 영역을 넘어가지 않도록 설정 */
        }

        .star-background, .star-filled {
            position: absolute;
            top: 0;
            left: 0;
            display: flex;
            width: 100%;
            justify-content: space-between;
        }

        .star.empty {
            color: #E0E0E0; /* 빈 별 색상 */
        }

        .star.filled {
            color: #FFD700; /* 채워진 별 색상 */
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
            <p><strong>평점:</strong>
                <c:choose>
                    <c:when test="${book.reviewCount == 0}">
                        0
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber value="${book.rating / book.reviewCount}" maxFractionDigits="1"/>
                    </c:otherwise>
                </c:choose>
            </p>
            <p><strong>좋아요 수:</strong> <span id="likeCount">${book.likeCount}</span></p>
            <button id="likeButton" onclick="toggleLike()" style="color: red; font-size: 20px; cursor: pointer;">
                <c:choose>
                    <c:when test="${isLiked}">
                        ❤️ 좋아요 취소
                    </c:when>
                    <c:otherwise>
                        ❤ 좋아요
                    </c:otherwise>
                </c:choose>
            </button>
        </div>
    </div>
</div>

<!-- 리뷰 작성 창 -->
<div class="review-list">
    <form id="reviewForm" class="review-item">
        <div class="review-header">
            <select id="reviewRating" required>
                <option value="" disabled selected>⭐</option>
                <c:forEach var="i" begin="1" end="5">
                    <option value="${i}">${"⭐".repeat(i)}</option>
                </c:forEach>
            </select>
            <button type="submit" class="submit-button">리뷰 작성</button>
        </div>
        <div class="review-content">
            <textarea id="reviewContent" rows="3" placeholder="리뷰 내용을 입력하세요"></textarea>
        </div>
    </form>
</div>

<!-- 리뷰 리스트 -->
<div class="review-list">
    <c:forEach var="review" items="${reviewList}">
        <div class="review-item" data-id="${review.id}">
            <div class="review-header">
                <span class="nickname">${review.memberName}</span>
                <span class="rating-box">
                    <!-- 평점에 따른 채워진 별 (오른쪽 정렬) -->
                    <c:forEach var="i" begin="1" end="${5 - review.rating}">
                        <span class="star empty">☆</span>
                    </c:forEach>
                    <c:forEach var="i" begin="1" end="${review.rating}">
                        <span class="star filled">⭐</span>
                    </c:forEach>
                </span>
            </div>
            <div class="review-content">${review.content}</div>

            <c:if test="${user != null && user.uuid == review.memberUuid}">
                <div class="review-buttons">
                    <button onclick="showEditForm('${review.id}')">수정</button>
                    <button onclick="deleteReview('${review.id}')">삭제</button>
                </div>
            </c:if>
        </div>

        <div id="editForm-${review.id}" class="edit-form" style="display: none;">
            <textarea id="editContent-${review.id}">${review.content}</textarea>
            <button onclick="submitEdit('${review.id}')">저장</button>
            <button onclick="cancelEdit('${review.id}')">취소</button>
        </div>
    </c:forEach>
</div>



<script>

    let isLiked = ${isLiked};

    function toggleLike() {
        fetch(`/board/detail/${book.id}/toggle-like`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    isLiked = !isLiked;
                    document.getElementById("likeCount").innerText = data.likeCount;
                    const likeButton = document.getElementById("likeButton");
                    likeButton.innerText = isLiked ? "❤️ 좋아요 취소" : "❤ 좋아요";
                } else {
                    alert(data.message || "로그인이 필요합니다.");
                }
            })
            .catch(error => console.error("좋아요 토글 중 오류 발생:", error));
    }

    document.addEventListener("DOMContentLoaded", () => {
        const reviewForm = document.getElementById("reviewForm");

        reviewForm.addEventListener("submit", (event) => {
            event.preventDefault();
            const content = document.getElementById("reviewContent").value;
            const rating = document.getElementById("reviewRating").value;
            const reviewData = {
                content: content,
                rating: rating,
                memberUuid: '${user != null ? user.uuid : ""}'
            };

            fetch(`/reviews/${book.id}`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(reviewData)
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        addReviewToPage(data.content, data.rating, data.reviewId, data.nickname);
                        document.getElementById("reviewContent").value = '';
                        document.getElementById("reviewRating").value = '1';
                        location.reload(); // 페이지 새로고침
                    } else {
                        alert(data.message);
                    }
                })
                .catch(error => {
                    console.error("리뷰 작성 중 오류 발생:", error);
                    alert("리뷰 작성 중 오류가 발생했습니다. 다시 시도해주세요.");
                });
        });
    });

    function addReviewToPage(content, rating, reviewId, nickname) {
        const reviewList = document.querySelector(".review-list");
        const newReview = document.createElement("div");
        newReview.classList.add("review-item");
        newReview.dataset.id = reviewId;

        // ⭐ 갯수를 rating 값에 맞게 생성
        const stars = '⭐'.repeat(rating);

        newReview.innerHTML = `
            <div class="review-header">
                <span class="nickname">[\${nickname}]</span>
                <span class="rating-box">
                     \${stars} <!-- ⭐ 갯수로 표시 -->
                </span>
            </div>
            <div class="review-content">\${content}</div>
            <div class="review-buttons">
                <button onclick="showEditForm('\${reviewId}')">수정</button>
                <button onclick="deleteReview('\${reviewId}')">삭제</button>
            </div>
            <div id="editForm-\${reviewId}" class="edit-form" style="display: none;">
                <textarea id="editContent-\${reviewId}">\${content}</textarea>
                <button onclick="submitEdit('\${reviewId}')">저장</button>
                <button onclick="cancelEdit('\${reviewId}')">취소</button>
            </div>
        `;
        reviewList.appendChild(newReview);
    }

    function showEditForm(reviewId) {
        const reviewItem = document.querySelector(`.review-item[data-id="\${reviewId}"]`);
        const reviewContent = reviewItem.querySelector(".review-content");
        const reviewButtons = reviewItem.querySelector(".review-buttons");

        // 기존 내용을 숨기고 수정 폼을 보여주기 위한 HTML 코드 추가
        reviewContent.style.display = "none";
        reviewButtons.style.display = "none";

        const editForm = document.createElement("div");
        editForm.classList.add("edit-form");
        editForm.innerHTML = `
        <textarea id="editContent-\${reviewId}" class="edit-textarea">\${reviewContent.innerText}</textarea>
        <div class="edit-buttons">
            <button onclick="submitEdit('\${reviewId}')">저장</button>
            <button onclick="cancelEdit('\${reviewId}')">취소</button>
        </div>
    `;

        // 수정 폼을 리뷰 항목에 추가
        reviewItem.appendChild(editForm);
    }

    function cancelEdit(reviewId) {
        const reviewItem = document.querySelector(`.review-item[data-id="\${reviewId}"]`);
        const reviewContent = reviewItem.querySelector(".review-content");
        const reviewButtons = reviewItem.querySelector(".review-buttons");
        const editForm = reviewItem.querySelector(".edit-form");

        // 수정 폼을 삭제하고 기존 내용을 다시 표시
        reviewContent.style.display = "block";
        reviewButtons.style.display = "block";
        editForm.remove();
    }

    function submitEdit(reviewId) {
        const content = document.getElementById(`editContent-\${reviewId}`).value;
        const reviewData = {content: content};

        fetch(`/reviews/\${reviewId}`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(reviewData)
        })
            .then(response => {
                if (!response.ok) {
                    return response.json().then(errorData => {
                        throw new Error(errorData.message || '서버 응답 오류');
                    });
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    const reviewItem = document.querySelector(`.review-item[data-id="\${reviewId}"]`);
                    const reviewContent = reviewItem.querySelector(".review-content");
                    const editForm = reviewItem.querySelector(".edit-form");

                    // 수정된 내용을 업데이트하고 수정 폼을 숨김
                    reviewContent.innerText = data.content;
                    reviewContent.style.display = "block";
                    reviewItem.querySelector(".review-buttons").style.display = "block";
                    editForm.remove();
                } else {
                    alert(data.message);
                }
            })
            .catch(error => {
                console.error("리뷰 수정 중 오류 발생:", error);
                alert("리뷰 수정 중 오류가 발생했습니다. 다시 시도해주세요.");
            });
    }

    function deleteReview(reviewId) {
        if (confirm('정말 이 리뷰를 삭제하시겠습니까?')) {
            fetch(`/reviews/\${reviewId}`, {
                method: "DELETE",
                credentials: "include",
                headers: {
                    "Content-Type": "application/json"
                }
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        document.querySelector(`.review-item[data-id="\${reviewId}"]`).remove();
                        alert("리뷰가 성공적으로 삭제되었습니다.");
                    } else {
                        alert(data.message);
                    }
                })
                .catch(error => {
                    alert("리뷰 삭제 중 오류가 발생했습니다.");
                });
        }
    }
</script>

<footer>
    <p>&copy; 2024 Book4W. All rights reserved.</p>
</footer>
</body>
</html>
