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
        /* 전체 배경과 기본 글꼴 스타일 */
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4efe9; /* 베이지톤 배경 */
            color: #4a3f35; /* 딥 브라운 텍스트 */
            margin: 0;
            padding: 0;
        }
        /* 헤더 스타일 */
        header {
            background-color: #8c7a6b; /* 차분한 브라운 */
            border-bottom: 1px solid #6b5d4d;
            padding: 15px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        /* 로고 스타일 */
        .logo {
            font-size: 1.6rem;
            font-weight: bold;
            color: #e7d9c7; /* 밝은 베이지 */
            text-decoration: none;
        }
        .logo:hover {
            color: #ffffff;
        }
        /* 네비게이션 링크 스타일 */
        .nav-links {
            display: flex;
            align-items: center;
        }
        .nav-links a {
            margin-left: 20px;
            text-decoration: none;
            color: #e7d9c7; /* 부드러운 베이지 */
            font-size: 1rem;
            font-weight: 700;
            transition: color 0.3s;
        }
        .nav-links a:hover {
            color: #ffffff;
        }
        /* 로그인 버튼 */
        .login-button {
            margin-left: 15px;
            background-color: #bfa58a; /* 브라운 톤의 버튼 */
            color: #ffffff;
            border: none;
            padding: 8px 14px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.95rem;
            font-weight: 600;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .login-button:hover {
            background-color: #9e8a73;
        }
        /* 검색 바 스타일 */
        .search-container {
            display: flex;
            align-items: center;
            background-color: #ffffff;
            padding: 5px 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .search-container input[type="text"] {
            background: transparent;
            border: none;
            outline: none;
            color: #4a3f35;
            padding: 5px 10px;
            font-size: 1rem;
            width: 200px;
        }
        .search-container input[type="submit"] {
            background-color: #bfa58a;
            color: #ffffff;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 0.9rem;
        }
        .search-container input[type="submit"]:hover {
            background-color: #9e8a73;
        }
    </style>
</head>
<body>
<header>
    <div class="header-container">
         <a href="${pageContext.request.contextPath}/" class="logo">
            <img src="/images/Logo21.png" alt="BookForW 로고" style="height: 40px; vertical-align: middle;" />
            BookForW
        </a>
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
            <c:when test="${not empty sessionScope.login}">
                <a href="${pageContext.request.contextPath}/log-out" class="login-button">Log-out</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/sign-in" class="login-button">Log-in</a>
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