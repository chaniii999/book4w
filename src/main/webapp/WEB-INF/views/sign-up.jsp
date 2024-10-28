<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>BookForW 회원가입</title>
    <style>
        /* 기존 스타일 유지 */
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
        input[type="text"],
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
        /* 비활성화 상태의 버튼 스타일 */
        button:disabled {
            background-color: #ccc; /* 회색 */
            color: #666; /* 어두운 회색 */
            cursor: not-allowed; /* 커서 변경 */
        }
        button:disabled:hover {
            background-color: #ccc; /* 호버 비활성화 */
        }
        .email-auth-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px;
            background-color: #6f6d62a5;
            color: white;
            text-align: center;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
            pointer-events: none; /* 기본적으로 비활성화 */
        }
        .email-auth-btn.active {
            pointer-events: auto; /* 활성화 시 이벤트 허용 */
            background-color: #4CAF50; /* 활성화 시 색상 변경 */
        }
        .error-message {
            color: red;
            font-size: 12px;
        }
        .success-message {
            color: green;
            font-size: 12px;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 추가 -->
    <script>
        $(document).ready(function() {
            let emailTimeout;
            let isEmailValid = false;
            let isNicknameValid = false;
            let isPasswordValid = false;

            // 이메일 형식 검사 함수
            function isValidEmail(email) {
                const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                return emailPattern.test(email);
            }

            // 이메일 입력 필드에서 입력할 때마다 중복 체크를 수행
            $('#email').on('input', function() {
                const email = $(this).val();
                clearTimeout(emailTimeout); // 이전 타이머 클리어

                if (email) {
                    // 이메일 형식 유효성 검사
                    if (!isValidEmail(email)) {
                        $('#email-feedback').html('<span class="error-message">올바른 이메일 형식이 아닙니다.</span>');
                        isEmailValid = false; // 이메일 유효성 검사 실패
                        $('.email-auth-btn').removeClass('active'); // 버튼 비활성화
                    } else {
                        emailTimeout = setTimeout(function() { // 0.5초 후에 실행
                            $.ajax({
                                url: '/check-email?email=' + encodeURIComponent(email), // 이메일을 쿼리 파라미터로 전달
                                type: 'GET',
                                success: function(data) {
                                    if (data.exists) {
                                        $('#email-feedback').html('<span class="error-message">이메일이 이미 존재합니다.</span>');
                                        isEmailValid = false; // 이메일 유효성 검사 실패
                                        $('.email-auth-btn').removeClass('active'); // 버튼 비활성화
                                    } else {
                                        $('#email-feedback').html('<span class="success-message">이메일이 사용 가능합니다.</span>');
                                        isEmailValid = true; // 이메일 유효성 검사 성공
                                        $('.email-auth-btn').addClass('active'); // 버튼 활성화
                                    }
                                    toggleSubmitButton(); // 버튼 상태 업데이트
                                },
                                error: function() {
                                    $('#email-feedback').html('<span class="error-message">서버 오류가 발생했습니다.</span>');
                                }
                            });
                        }, 500); // 500ms 지연
                    }
                } else {
                    $('#email-feedback').empty(); // 이메일 필드가 비어있으면 피드백 지우기
                    isEmailValid = false; // 이메일 유효성 검사 실패
                    $('.email-auth-btn').removeClass('active'); // 버튼 비활성화
                }
                toggleSubmitButton(); // 버튼 상태 업데이트
            });

            // 닉네임 유효성 검사
            $('#nickname').on('input', function() {
                const nickname = $(this).val();
                if (nickname.length < 2 || nickname.length > 8) {
                    $('#nickname-feedback').html('<span class="error-message">닉네임은 2~8자 사이여야 합니다.</span>');
                    isNicknameValid = false; // 닉네임 유효성 검사 실패
                } else {
                    $('#nickname-feedback').empty();
                    isNicknameValid = true; // 닉네임 유효성 검사 성공
                }
                toggleSubmitButton(); // 버튼 상태 업데이트
            });

            // 비밀번호 유효성 검사
            $('#password, #confirm-password').on('input', function() {
                const password = $('#password').val();
                const confirmPassword = $('#confirm-password').val();
                if (password.length < 4 || password.length > 14) {
                    $('#password-feedback').html('<span class="error-message">비밀번호는 4~14자 사이여야 합니다.</span>');
                    isPasswordValid = false; // 비밀번호 유효성 검사 실패
                } else if (password !== confirmPassword) {
                    $('#password-feedback').html('<span class="error-message">비밀번호가 일치하지 않습니다.</span>');
                    isPasswordValid = false; // 비밀번호 유효성 검사 실패
                } else {
                    $('#password-feedback').empty();
                    isPasswordValid = true; // 비밀번호 유효성 검사 성공
                }
                toggleSubmitButton(); // 버튼 상태 업데이트
            });

            // 버튼 상태 업데이트 함수
            function toggleSubmitButton() {
                const submitButton = $('.signup-btn');
                // 이메일, 닉네임, 비밀번호가 모두 유효한 경우에만 활성화
                if (isEmailValid && isNicknameValid && isPasswordValid) {
                    submitButton.prop('disabled', false); // 버튼 활성화
                } else {
                    submitButton.prop('disabled', true); // 버튼 비활성화
                }
            }
        });

    </script>


</head>
<body>

<div class="container">
    <h2>회원가입</h2>

    <form action="${pageContext.request.contextPath}/sign-up" method="post">
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" placeholder="이메일 입력" value="${not empty email ? email : ''}">
        <div id="email-feedback" style="margin-top: 5px;"></div> <!-- 이메일 중복 체크 결과 표시 영역 -->

        <div class="email-auth-btn active" onClick="openEmailAuthWindow()">이메일 인증</div>

        <label for="nickname">닉네임:</label>
        <input type="text" id="nickname" name="nickname" placeholder="닉네임 입력" value="${not empty nickname ? nickname : ''}">
        <div id="nickname-feedback" style="margin-top: 5px;"></div> <!-- 닉네임 유효성 검사 결과 표시 영역 -->

        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" placeholder="비밀번호 입력">
        <div id="password-feedback" style="margin-top: 5px;"></div> <!-- 비밀번호 유효성 검사 결과 표시 영역 -->

        <label for="confirm-password">비밀번호 확인:</label>
        <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호 확인 입력">

        <button type="submit" class="signup-btn" disabled>회원가입</button>
    </form>
</div>

<script>
    function openEmailAuthWindow() {
        const email = $('#email').val(); // jQuery를 사용하여 이메일 값을 가져옵니다.

        window.open(
            '${pageContext.request.contextPath}/email-auth?email=' + encodeURIComponent(email),
            'EmailAuthWindow',
            'width=400, height=500, resizeable=yes, scrollbar=yes'
        );
    }
</script>
</body>
</html>