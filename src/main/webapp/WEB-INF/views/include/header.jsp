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
        <div class="search-container">
            <form action="${pageContext.request.contextPath}/board/list" method="get">
                <input type="hidden" name="page" value="${maker.number}" />
                <input type="text" name="query" placeholder="검색어 입력" value="${param.query}" />
                <input type="hidden" name="sort" value="${param.sort}" /> <!-- 정렬 기준 유지 -->
                <input type="submit" value="검색" />
            </form>
        </div>

    </div>


</header>
</body>