<%--
  Created by IntelliJ IDEA.
  User: Century
  Date: 2024-10-28
  Time: 오전 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>이메일 인증</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#auth-code-submit').on('click', function() {
        const enteredCode = $('#auth-code').val();
        const authCode = '<%= request.getAttribute("authCode") %>';

        if (enteredCode === authCode) {
          alert('인증이 완료되었습니다.');
          window.opener.document.getElementById('email-feedback').innerHTML =
                  '<span class="success-message">이메일 인증이 완료되었습니다.</span>';
          window.close();
        } else {
          alert('인증 코드가 일치하지 않습니다.');
        }
      });
    });
  </script>
</head>
<body>
<h3>이메일로 발송된 인증 코드를 입력하세요:</h3>
<input type="text" id="auth-code" placeholder="인증 코드 입력">
<button id="auth-code-submit">확인</button>
</body>
</html>