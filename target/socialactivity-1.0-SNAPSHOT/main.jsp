<%@ page import="com.golfzone.social.user.UserVO" %>
<%@ page import="com.golfzone.social.club.ClubDAO" %>
<%@ page import="com.golfzone.social.club.ClubDAOImpl" %>
<%@ page import="com.golfzone.social.club.ClubVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" type="text/css"/>
  <title>Tech Club</title>
</head>
<body>
<% String msg = (String) request.getAttribute("resultMsg"); %>
<%
  ClubDAO clubDAO = new ClubDAOImpl();
  List<ClubVO> clubVOS = clubDAO.selectAll();
%>
<section id="navBar">
  <nav id="mainNav">
    <a href="/" class="logo">Logo</a>
    <ul>
      <li><a href="#">MyPage</a></li>
    </ul>
  </nav>
  <div id="dropDown">
    <form action="#" method="post" class="search-form">
      <div class="search-name">
        <ion-icon class="search-icon" name="search-outline"></ion-icon>
        <input
                type="text"
                placeholder="모임/액티비티 검색"
                id="clubName"
                name="clubName"
        />
        <ion-icon
                class="chevron-icon"
                id="chevronIcon"
                name="chevron-down-outline"
        ></ion-icon>
      </div>
      <div class="optional hide">
        <div class="age">
          <label for="clubAgeLow">연령</label>
          <select
                  name="ageLow"
                  id="clubAgeLow"
                  onchange="clubAgeLowChange()"
          >
            <option value="0" selected>최소나이 선택</option>
          </select>
          <b>~</b>
          <select name="ageHigh" id="clubAgeHigh">
            <option value="0" selected>최대나이 선택</option>
          </select>
        </div>
        <div class="tier">
          <label for="clubTierLow">타수</label>
          <select
                  name="tierLow"
                  id="clubTierLow"
                  onchange="clubTierLowChange()"
          >
            <option value="0" selected>최소타수 선택</option>
          </select>
          <b>~</b>

          <select name="tierHigh" id="clubTierHigh">
            <option value="0">최대타수 선택</option>
          </select>
        </div>
        <div class="location">
          <label for="location">지역 선택</label>
          <select
                  name="location"
                  id="location"
                  onchange="categoryChange(this)"
          >
            <option value selected>시/도 선택</option>
          </select>
          <b>/</b>
          <select name="state" id="state">
            <option selected>군/구 선택</option>
          </select>
          <input
                  id="submitFormBtn"
                  type="submit"
                  value="모임/액티비티 검색"
          />
        </div>
      </div>
    </form>
  </div>
</section>
<div class = "main-flex-container">
  <div class="list-container">
    <section id="clubIntro">
      <h1>모임(광고)</h1>
      <div class="slide">
        <div class="left-button" onclick="showLeftItem()"><p><div class="arrow-left" id="leftArrow"></div></p></div>
        <div class="promotion-club-container">
          <div class="promotion-club-item">
            <form action="#" method="post">
              <img src="${pageContext.request.contextPath}/img/test-emblem-logo.png" alt="no-emblem-img" />
              <p>모임명</p>
              <p>인원</p>
              <p>지역</p>
              <input id ="joinClubBtn" type="submit" value="가입하기"/>
            </form>
          </div>
        </div>
        <div class="right-button" onclick="showRightItem"><div class="arrow-right" id="rightArrow"></div></div>
      </div>
    </section>
    <section id="recommendClub">
      <h1>추천 모임</h1>
      <div class="recommend-club-container" id = "recommendClubContainer">
        <%for (int i = 0; i< clubVOS.size(); i++){%>
          <div class="recommend-club-item">
            <form action="#" method="post">
              <img src=<%=clubVOS.get(i).getClubEmblemPath()%> alt="no-emblem-img" />
              <p>모임명 : <%=clubVOS.get(i).getClubName()%></p>
              <p>인원 : <%=clubVOS.get(i).getClubMaxCount()%></p>
              <p>지역 : <%=clubVOS.get(i).getClubLocation()%></p>
              <input id ="joinClubBtn" type="submit" value="가입하기"/>
            </form>
          </div>
        <%}%>
      </div>
    </section>
    <section id="recommendActivity">
      <h1>추천 액티비티</h1>
      <div class="recommend-activity-container" id = "recommendActivivityContainer">
        <div class="recommend-activity-item">
          <form action="#" method="post">
            <img src="${pageContext.request.contextPath}/img/test-activity-logo.png" href="no-img" />
            <p>액티비티명</p>
            <p>인원</p>
            <p>지역</p>
            <input id ="joinActivityBtn" type="submit" value="가입하기"/>
          </form>
        </div>
        <div class="recommend-activity-item">
          <img src="#" href="no-img" />
          <p>액티비티명</p>
          <p>인원</p>
          <p>지역</p>
          <input id ="joinActivityBtn" type="submit" value="가입하기"/>
        </div>
        <div class="recommend-activity-item">
          <img src="#" href="no-img" />
          <p>액티비티명</p>
          <p>인원</p>
          <p>지역</p>
          <input id ="joinActivityBtn" type="submit" value="가입하기"/>
        </div>
        <div class="recommend-activity-item">
          <img src="#" href="no-img" />
          <p>액티비티명</p>
          <p>인원</p>
          <p>지역</p>
          <input id ="joinActivityBtn" type="submit" value="가입하기"/>
        </div>
        <div class="recommend-activity-item">
          <img src="#" href="no-img" />
          <p>액티비티명</p>
          <p>인원</p>
          <p>지역</p>
          <input id ="joinActivityBtn" type="submit" value="가입하기"/>
        </div>
        <div class="recommend-activity-item">
          <img src="#" href="no-img" />
          <p>액티비티명</p>
          <p>인원</p>
          <p>지역</p>
          <input id ="joinActivityBtn" type="submit" value="가입하기"/>
        </div>
        <div class="recommend-activity-item">
          <img src="#" href="no-img" />
          <p>액티비티명</p>
          <p>인원</p>
          <p>지역</p>
          <input id ="joinActivityBtn" type="submit" value="가입하기"/>
        </div>
      </div>
    </section>  
  </div>
  <section id="loginForm">
    <div class="container">
      <div class="blue-bg">
        <div class="box sign-in">
          <h2>Already Have an Account?</h2>
          <button type="button" id="signInBtn" onclick="removeActive()">
            Sign in
          </button>
        </div>
        <div class="box sign-up">
          <h2>Don't have an Account</h2>
          <button type="button" id="signupBtn" onclick="addActive()">
            Sign up
          </button>
        </div>
      </div>
      <div class="form-box">
        <div class="form sign-in-form">
          <form action="/login" method="post">
            <h3>Sign In</h3>
            <input type="text" placeholder="userID" name="userID" />
            <input type="password" placeholder="Password" name="password" />
            <input type="submit" value="Login" />
            <a href="#" class="forgot">Forgot Password</a>
            <%if ( msg == "회원가입이 필요합니다."){%>
              <p><%=msg%></p>
            <%}%>
          </form>
        </div>
        <div class="form sign-up-form">
          <form action="signup" method="post">
            <h3>Sign Up</h3>
            <input
                    type="text"
                    name="userName"
                    placeholder="user NickName(11자리)"
            />
            <input type="text" name="userID" placeholder="user ID(11자리)" />
            <input
                    type="password"
                    name="userPW"
                    placeholder="userPW(11자리)"
            />
            <div class="location2">
              <select
                      name="location2"
                      id="location2"
                      onchange="categoryChange(this)"
              >
                <option value selected>시/도 선택</option>
              </select>
              <b>/</b>
              <select name="state2" id="state2">
                <option selected>군/구 선택</option>
              </select>
            </div>
            <div class="extra-input">
              <div class="age">
                <label for="age-ipt-num">나이</label>
                <input type="number" id="age-ipt-num" name="age" />
              </div>
              <div class="tier">
                <label for="tierName">등급</label>
                <select name="tierName" id="tierName"></select>
              </div>
              <div class="gender">
                <label for="gender-ipt-num">성별</label>
                <select name="userGender" id="gender-ipt-num">
                  <option value="0">남성</option>
                  <option value="1">여성</option>
                </select>
              </div>
            </div>
            <input type="submit" value="Register" />
          </form>
        </div>
      </div>
    </div>
  </section>
</div>
<script src="./js/main.js " charset="UTF-8"></script>
<script src="./js/juso.js" charset="UTF-8"></script>
<script src="./js/login.js" charset="UTF-8"></script>
<script src="./js/arrow.js" charset="UTF-8"></script>
<script src="./js/recommend.js" charset="UTF-8"></script>
<script
        type="module"
        src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
></script>
<script
        nomodule
        src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
></script>
</body>
</html>

