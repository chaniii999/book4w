<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>내 프로필</title>
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
      max-width: 900px;
      margin: 20px auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .search-bar {
      display: flex;
      justify-content: center;
      margin-bottom: 20px;
    }
    .search-bar input {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .profile-header {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
    }
    .profile-container {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    .profile-photo {
      width: 120px;
      height: 120px;
      background-color: #ddd;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 50px;
      color: #8e44ad;
      margin-right: 20px;
    }
    .profile-info {
      font-size: 18px;
    }
    .profile-info h2 {
      margin: 0;
      font-size: 24px;
    }
    .profile-info p {
      margin: 5px 0;
      font-size: 16px;
      color: #555;
    }
    .profile-info a {
      color: #4CAF50;
      text-decoration: none;
      font-size: 16px;
    }
    /* 추가된 스타일 */
    header a {
      text-decoration: none;
      background-color: #6f6d62a5;
      color: black;
      padding: 10px 15px;
      border-radius: 5px;
      margin-right: 10px;
    }
    header a:hover {
      background-color: #b1b0abc7;
    }
  </style>
</head>
<body>
<header>
  <h1>BookForW</h1>
  <div>
    <a href="#">내 리뷰 관리</a>
    <a href="#">내 좋아요 목록</a>
    <a href="#">내 프로필</a>
    <button>Log-in</button>
  </div>
</header>

<div class="container">
  <div class="search-bar">
    <input type="text" placeholder="검색">
  </div>

  <div class="profile-header">내 프로필</div>

  <div class="profile-container">
    <div class="profile-photo">
      <span>📷</span>
    </div>
    <div class="profile-info">
      <h2>치즈맛피자</h2>
      <p>이메일: ******@naver.com</p>
      <a href="#">비밀번호 재설정</a>
    </div>
  </div>
</div>


</body>
</html>