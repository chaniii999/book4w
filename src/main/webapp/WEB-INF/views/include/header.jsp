<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<header>
    <div class="header-container">
        <h1 class="logo">BookForW</h1>
        <nav class="nav-links">
            <a href="#">내 리뷰 관리</a>
            <a href="#">내 좋아요 목록</a>
            <a href="#">내 프로필</a>
            <button class="login-button">Log-in</button>
        </nav>
        <form action="/search" method="get" class="search-form">
            <input type="text" name="keyword" placeholder="검색어를 입력하세요" class="search-input">
            <button type="submit" class="search-button">검색</button>
        </form>
    </div>


</header>
</body>