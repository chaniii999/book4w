<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
</head>
<body>
<h2>검색 결과: ${query}</h2>

<c:if test="${not empty searchResults}">
    <ul>
        <c:forEach var="book" items="${searchResults}">
            <li>
                <strong>책 이름:</strong> ${book.name},
                <strong>저자:</strong> ${book.writer}
            </li>
        </c:forEach>
    </ul>
</c:if>

<c:if test="${empty searchResults}">
    <p>검색 결과가 없습니다.</p>
</c:if>

</body>
</html>
