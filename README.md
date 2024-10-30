# Book4W 도서 리뷰 웹사이트 프로젝트

<img width="917" alt="스크린샷" src="https://github.com/user-attachments/assets/74fcf318-75da-4603-9ec3-0d3f076265c8">

## 1. 서비스 개요

우리 프로젝트는 **도서 리뷰 웹사이트**를 개발하여 독자들이 도서를 더 쉽게 발견하고, 리뷰를 통해 다른 사용자들과 소통할 수 있는 공간을 제공합니다. 이는 도서와 회원 간의 상호작용을 강화하고 독서 경험을 더욱 풍부하게 만드는 효과를 기대할 수 있습니다. 독서를 즐기는 모든 연령대의 독서 애호가들에게 유용한 서비스가 될 것입니다.

### 1.1. 도서 리뷰, 평점, 좋아요 기능을 기반한 도서 추천 및 조회

독자들은 책을 읽은 후 자신의 리뷰와 평점 그리고 좋아요를 공유하고, 다른 사람들이 남긴 리뷰를 통해 책 선택에 도움을 주고받을 수 있습니다. 이것은 독서 커뮤니티를 더욱 활성화시키는 핵심적인 요소입니다. 실제 독자들의 리뷰를 기반으로 신뢰할 수 있는 정보를 얻을 수 있으므로 실패하지 않는 선택을 경험할 것입니다.

### 1.2. 회원제로 나의 기록과 프로필 관리

회원이 남긴 리뷰, 평점, 좋아요를 회원 고유번호로 관리하여, 자신이 남긴 기록을 직관적으로 조회할 수 있습니다. 이를 통해 사용자는 자신의 독서 기록을 쉽게 관리하고, 즐겨읽은 도서를 다시 찾는 데 도움을 받을 수 있습니다.

---
## 2. 개발 이력
### 2.1. 개발 기간: 2024-10-21 ~ 2024-10-30
### 2.2. 팀원
박성찬(PM, Back), 김원(Back), 김성철(Back), 배승준(Front)
### 2.3. 기술 스택
- 프론트엔드: HTML, CSS, JavaScript
- 백엔드: Java, Spring, JPA
- 데이터베이스: MySQL
- 기타: Github, Notion, Google Spreadsheet

---
## 3. 주요 기능별 논리 구조
### 3.1. 도서 리뷰, 평점, 좋아요 기능을 기반한 도서 추천 및 조회
#### 3.1.1. 도서 추천
![홈화면](https://github.com/user-attachments/assets/ebdfb0a5-6483-4f9c-8e79-114f5339e9fc)
- 리뷰 수, 평점 수, 좋아요 수를 기준으로 기준값이 높은 도서 중 3개를 각각 골라 추천도서로 제시합니다.
- 각 기준별 화면은 일정시간이 지나면 슬라이드 효과로 자동 전환됩니다.
- 사용자가 화살표 클릭으로 화면을 수동 전환을 할 수 있습니다.
- 해당 카드를 선택하여 상세정보를 확인합니다.

#### 3.1.2. 도서 목록 조회
![도서목록](https://github.com/user-attachments/assets/b9b23f40-82c1-4365-9fef-1c5666c5ef73)
- 한 페이지에 9개 카드 목록을 제시하고, 도서의 주요 정보를 카드에 표시합니다.
- '좋아요 수', '리뷰 수', '평점 수' 순으로 카드 목록을 정렬합니다.
- 목록 페이지 기능을 제공합니다.
- 검색어를 입력하여 도서를 검색합니다.
- 해당 카드를 선택하여 상세정보를 확인합니다.


#### 3.1.3. 도서 상세정보 & 리뷰, 평점, 좋아요 입력
![상세정보](https://github.com/user-attachments/assets/40fd2042-9937-47d7-bc36-a9a410badb71)
- 도서의 주요 정보 그리고 회원이 입력한 리뷰와 평점을 표시합니다.
- 회원은 좋아요, 리뷰, 평점을 입력할 수 있고, 입력한 내용을 수정 또는 삭제할 수 있습니다.
- 비회원은 입력할 수 없고, 로그인을 하도록 요청합니다.

### 3.2. 회원제로 나의 기록과 프로필 관리
#### 3.2.1 로그인 & 로그아웃
- 이메일과 비밀번호를 입력하여 로그인합니다.
- 세션을 활용하여 로그인 상태를 유지합니다.
- 로그아웃 버튼을 클릭하여 로그아웃합니다.

#### 3.2.2. 회원가입 & 이메일 인증
- 이메일을 입력하고 이메일 인증을 요청하면 인증 코드를 해당 이메일로 발송하고 인증 코드 입력을 활성화합니다.
- '이메일', '인증 코드', '닉네임', '비밀번호', '비밀번호 확인'의 입력 유효성이 확인되면 회원가입 버튼을 활성화합니다.

#### 3.2.3 프로필 조회 & 수정
- '닉네임', '이메일', '가입 날짜'를 표시합니다.
- 새로운 닉네임을 입력하여 수정합니다.

#### 3.2.4. 나의 좋아요 & 나의 리뷰 조회
![나의 리뷰 좋아요](https://github.com/user-attachments/assets/7f97dd98-91bb-419a-bc6d-427f78fe6ea3)
- 회원이 작성한 '리뷰', '평점', '좋아요' 기록을 목록으로 확인합니다.
- 해당 책을 선택하여 상세정보를 확인합니다.

#### 3.2.5. 사용자 권한 부여
- 비회원은 '나의 리뷰', '나의 좋아요', 나의 프로필'에 접근할 수 없습니다.
- 회원은 '로그인', '회원가입'에 접근할 수 없습니다.

---
## 4. 트러블슈팅 및 회고
### 4.1. 박성찬
#### 4.1.1. 트러블슈팅
-

#### 4.1.2. 회고
-

### 4.2. 김원
#### 4.1.1. 트러블슈팅
-

#### 4.1.2. 회고
-

### 4.3. 배승준
#### 4.1.1. 트러블슈팅
-

#### 4.1.2. 회고
-

### 4.3. 김성철
#### 4.1.1. 트러블슈팅
-

#### 4.1.2. 회고
-

---
## 5. 데이터베이스 ERD
![image](https://github.com/user-attachments/assets/6f9790c8-71e6-4103-b19c-35d1852f798d)

