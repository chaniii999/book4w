<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>BookForW 로그인</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
    }
    header {
      background-color: #ffffff;
      padding: 10px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    header h1 {
      color: #4CAF50;
      font-size: 24px;
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
  </style>
</head>
<body>

<header>
  <h1>BookForW</h1>
</header>

<div class="container">
  <h2>로그인</h2>
  <!-- form 태그 action을 '/domain/sign-in'으로 설정 -->
  <form action="${pageContext.request.contextPath}/domain/sign-in" method="post">
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" placeholder="이메일 입력" required>

    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" placeholder="비밀번호 입력" required>

    <button type="submit">로그인</button>
  </form>
</div>

</body>
</html>