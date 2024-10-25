<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 프로필</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #555;
        }
        .no-info {
            text-align: center;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>내 프로필 정보</h1>

        <c:if test="${not empty member}">
            <table>
                <tbody>
                    <tr>
                        <th>이름</th>
                        <td>${member.nickname}</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${member.email}</td>
                    </tr>
                    <tr>
                        <th>가입 날짜</th>
                        <td>${member.createdAt}</td>
                    </tr>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty member}">
            <p class="no-info">회원 정보가 없습니다.</p>
        </c:if>
    </div>
</body>
</html>
