<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>BookForW 로그인</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5efe6; /* 베이지톤 배경 */
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 500px;
      margin: 50px auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }
    h2 {
      text-align: center;
      color: #333;
    }
    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }
    label {
      color: #333;
      font-size: 14px;
    }
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    button {
      padding: 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }
    button:hover {
      background-color: #45a049;
    }
    .signup-button {
      margin-top: 10px; /* 로그인 버튼과의 간격 */
      padding: 10px;
      background-color: #007bff; /* 회원가입 버튼 색상 */
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      text-align: center; /* 중앙 정렬 */
      display: block; /* 블록 요소로 설정 */
      width: 100%; /* 너비를 100%로 설정 */
      text-decoration: none; /* 링크의 밑줄 제거 */
    }
    .signup-button:hover {
      background-color: #0056b3; /* 호버 색상 */
    }
  </style>
</head>
<body>

<div class="container">
  <h2>로그인</h2>
  <form action="${pageContext.request.contextPath}/sign-in" method="post">
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" placeholder="이메일 입력" required>

    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" placeholder="비밀번호 입력" required>

    <button type="submit">로그인</button>
  </form>
  <a href="${pageContext.request.contextPath}/sign-up" class="signup-button">회원가입</a>
</div>

</body>
</html>
