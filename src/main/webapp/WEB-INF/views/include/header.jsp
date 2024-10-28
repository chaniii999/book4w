<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"> <!-- CSS 경로 수정 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #f8f9fa;
            padding: 20px 0;
            border-bottom: 1px solid #dee2e6;
        }
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1400px; /* 전체 너비를 늘림 */
            margin: 0 auto;
            padding: 0 30px; /* 좌우 여백 조정 */
        }
        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #007bff;
            text-decoration: none;
        }
        .nav-links {
            display: flex;
            align-items: center;
        }
        .nav-links a {
            margin-left: 15px; /* 여백 조정 */
            text-decoration: none;
            color: #333;
            font-size: 18px; /* 폰트 크기 조정 */
        }
        .nav-links a:hover {
            color: #007bff;
        }
        .login-button {
            margin-left: 15px; /* 여백 조정 */
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none; /* 링크에서 밑줄 제거 */
            display: inline-block; /* 블록으로 변경 */
            font-size: 18px; /* 폰트 크기 조정 */
        }
        .login-button:hover {
            background-color: #0056b3;
        }
        .search-container {
            display: flex;
            align-items: center;
        }
        .search-container input[type="text"] {
            padding: 6px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            margin-right: 5px;
            width: 250px; /* 검색 입력창 너비 늘림 */
        }
        .search-container input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 6px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<header>
    <div class="header-container">
        <a href="${pageContext.request.contextPath}/" class="logo">BookForW</a>
        <nav class="nav-links">
            <a href="${pageContext.request.contextPath}/profile/my-reviews">내 리뷰 관리</a>
            <a href="${pageContext.request.contextPath}/profile/liked-books">내 좋아요 목록</a>
            <a href="${pageContext.request.contextPath}/profile/info">내 프로필</a>
            <a href="${pageContext.request.contextPath}/board/list">도서 목록</a>
        </nav>
        <div class="search-container">
            <form action="${pageContext.request.contextPath}/board/list" method="get">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> <!-- CSRF Token 추가 -->
                <input type="hidden" name="page" value=0 />
                <input type="text" name="query" placeholder="검색어 입력" value="${param.query}" />
                <input type="hidden" name="sort" value="${param.sort}" />
                <input type="submit" value="검색" />
            </form>
        </div>
        <!-- 세션 체크 후 버튼 변경 -->
        <c:choose>
            <c:when test="${not empty sessionScope.login}"> <!-- 세션에 로그인 정보가 있는지 확인 -->
                <a href="${pageContext.request.contextPath}/log-out" class="login-button">Log-out</a> <!-- 로그아웃 버튼 -->
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/sign-in" class="login-button">Log-in</a> <!-- 로그인 버튼 -->
            </c:otherwise>
        </c:choose>
    </div>
</header>
<main>
    <!-- 페이지 주요 내용이 들어갈 부분 -->
</main>
<!-- Bootstrap JS 및 jQuery 포함 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
