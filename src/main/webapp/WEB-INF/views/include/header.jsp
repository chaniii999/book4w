<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/style.css">
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
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
            margin-left: 20px;
            text-decoration: none;
            color: #333;
        }
        .nav-links a:hover {
            color: #007bff;
        }
        .login-button {
            margin-left: 20px;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
        }
        .login-button:hover {
            background-color: #0056b3;
        }
        .search-container {
            display: flex;
            align-items: center;
        }
        .search-container input[type="text"] {
            padding: 6px; /* 패딩을 줄여서 크기를 작게 설정 */
            border: 1px solid #ced4da;
            border-radius: 5px;
            margin-right: 5px;
            width: 200px; /* 너비를 일반 웹사이트 크기로 설정 */
        }
        .search-container input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 6px 10px; /* 패딩을 줄여서 크기를 작게 설정 */
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
        <a href="${pageContext.request.contextPath}/" class="logo">BookForW</a> <!-- 로고 클릭 시 메인 페이지로 이동 -->
        <nav class="nav-links">
            <a href="#">내 리뷰 관리</a>
            <a href="#">내 좋아요 목록</a>
            <a href="#">내 프로필</a>
            <a href="${pageContext.request.contextPath}/board/list">도서 목록</a> <!-- 도서 목록 버튼 추가 -->
        </nav>
        <div class="search-container">
            <form action="${pageContext.request.contextPath}/board/list" method="get">
                <input type="hidden" name="page" value="${maker.number}" />
                <input type="text" name="query" placeholder="검색어 입력" value="${param.query}" />
                <input type="hidden" name="sort" value="${param.sort}" /> <!-- 정렬 기준 유지 -->
                <input type="submit" value="검색" />
            </form>
        </div>
        <button class="login-button">Log-in</button> <!-- 로그인 버튼을 검색 버튼 오른쪽에 배치 -->
    </div>
</header>
</body>
</html>
