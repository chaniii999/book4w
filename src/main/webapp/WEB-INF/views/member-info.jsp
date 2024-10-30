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
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #f5efe6; /* 톤 다운된 베이지 배경 */
            color: #4a3f35; /* 딥 브라운 텍스트 */
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: #eae4da; /* 밝은 베이지 */
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #b57d52; /* 따뜻한 브라운 */
            font-size: 2.2rem;
            margin-bottom: 20px;
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
            font-size: 1rem;
        }
        th {
            background-color: #dcd4c5; /* 연한 브라운 배경 */
            color: #4a3f35;
            font-weight: bold;
        }
        td {
            color: #4a3f35;
        }
        .no-info {
            text-align: center;
            color: #7e7366;
            font-size: 1.2rem;
            margin-top: 20px;
        }
        /* 버튼 스타일 */
        .btn-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .btn {
            background-color: #b57d52; /* 따뜻한 브라운 */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            margin: 0 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #a0694a;
        }
        /* 닉네임 변경 섹션 */
        .nickname-change {
            display: none;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
            background-color: #f5efe6;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .nickname-change input {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
            font-size: 1rem;
        }
    </style>
    <script>
        function toggleNicknameChange() {
            const nicknameChangeDiv = document.querySelector('.nickname-change');
            nicknameChangeDiv.style.display = (nicknameChangeDiv.style.display === 'none' || nicknameChangeDiv.style.display === '') ? 'flex' : 'none';
        }

        function submitNicknameChange() {
            document.getElementById('nicknameForm').submit();
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>내 프로필 정보</h1>
        <c:if test="${not empty member}">
            <table>
                <tbody>
                    <tr>
                        <th>닉네임</th>
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
        <div class="btn-container">
            <a href="javascript:toggleNicknameChange()" class="btn">닉네임 변경</a>
        </div>
        <div class="nickname-change">
            <form id="nicknameForm" action="/profile/change-nickname" method="post">
                <input type="text" id="new-nickname" name="newNickname" placeholder="새 닉네임 입력">
                <button type="button" onclick="submitNicknameChange()" class="btn">변경</button>
            </form>
        </div>
    </div>
</body>
</html>
