<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link rel="stylesheet" href="style.css">
</head>
<!-- header.jsp -->
<header>
    <h1>BookForW</h1>
    <div>
        <a href="#">내 리뷰 관리</a>
        <a href="#">내 좋아요 목록</a>
        <a href="#">내 프로필</a>
        <button>Log-in</button>
    </div>
    <form action="/search" method="get">
        <input type="text" name="keyword" placeholder="검색어를 입력하세요">
        <button type="submit">검색</button>
    </form>
</header>