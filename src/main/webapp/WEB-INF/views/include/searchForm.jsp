<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>검색</title>
</head>
<body>
<form action="/search" method="get">
    <input type="text" name="keyword" placeholder="검색어를 입력하세요">
    <button type="submit">검색</button>
</form>
</body>
</html>