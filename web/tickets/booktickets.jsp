<%@ page import="beans.DAO,beans.Films" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Card" %>
<%@ page import="beans.session" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("session")==null){

        response.sendRedirect("index.jsp");
    }


    Cookie[] cookies = request.getCookies();
    String username = "";
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("username")) {
            username = cookie.getValue();
        }
    }

    int sessionid = Integer.parseInt(request.getParameter("sessionid"));
    beans.session s = DAO.getSessionById(sessionid);
    boolean[] tickets = DAO.getTicketsbyId(sessionid);
    ArrayList<Card> cards = DAO.getCards(username);
    request.setAttribute("cards", cards);
    request.setAttribute("tickets", tickets);
    request.setAttribute("sessionid", sessionid);


%>
<html>
<head>
    <title>Book Tickets</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="booktickets.css?v=1.1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>

<body onload="FillArray()">
<header><nav class="navbar navbar-expand-md navbar-dark bg-primary">
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="../film/homepage.jsp">Tickets</a>
            </li>
        </ul>
    </div>
    <div class="mx-auto order-0" id="homepage">
        <a class="navbar-brand mx-auto" href="../film/homepage.jsp">Home page</a>

    </div>
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="../user/profile.jsp">Profile</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="../user/logout.jsp">Log out</a>
            </li>
        </ul>
    </div>
</nav>
</header>
<main id="main">
    <aside class="left">
        <div class="booking">
            <div class="session-info">
                <h4>ინფორმაცია სეანსზე</h4>
                <p>ფილმი: <%=s.getFilm()%></p>
                <p>ენა: <%=s.getLanguage()%></p>
                <p>კინოთეარი: <%=s.getCinema()%></p>
                <p>სეანსის თარიღი: <%=s.getSessiondate()%></p>
                <p>სეანსის დრო: <%=s.getSessiontime()%> საათი</p>
                <p>ჩვენების ხარისხი: <%=s.getQuality()%></p>
                <div class="pricediv" style="
    display: flex;
position: relative;
    left: 150px;">
                    <p>ერთი ბილეთის ფასი:  <p id="price" ><%=s.getPrice()%></p> ლარი</p>
                </div>
                <div class="pricesum" style="
    display: inline;
position: relative;
    left: 100px;">
                    <h5 style="display:flex;">ჯამში ბილეთების ღირებულება: <p id="pricesum" style="display: flex"></p> ლარი</h5>
                </div>
            </div>

        </div>
    </aside>
    <aside class="right">
        <div class="buttons">
            <h4>მონიშნეთ სასურველი ადგილი</h4>
            <c:forEach items="${tickets}" var="t" varStatus="loop" begin="0" end="15">

                <c:if test="${tickets[loop.index]}">
                    <button onclick="onClickBtn(${loop.index})" class="btn btn-primary tktbtn" value="${loop.index+1}">${loop.index+1}</button>

                </c:if>
                <c:if test="${!tickets[loop.index]}">
                    <button style="background: grey" class="btn btn-dark tktbtn" value="${loop.index+1}" disabled>${loop.index+1}</button>
                </c:if>
                <c:if test="${loop.index%4==3}"><br></c:if>
            </c:forEach>

        </div>
    </aside>
    <form method="post" action="BookTkt.jsp?sessionid=${sessionid}">
        <input type="hidden" id="tkt" name="tkt"/>
    <div class="mycardselect">
        <div class="cardselect">
            <p>ანგარიშის ნომერი</p>
            <select class="form-control" id="cardselect">
                <c:forEach items="${cards}" var="c">
                    <option value="${c.getNumber()}">${c.getNumber()}</option>
                </c:forEach>


            </select>
        </div>
    </div>
    <div class="bookingbtn">
        <input type="submit" id="bookticket" class="btn btn-success" value="ბილეთების დაჯავშნა">
    </div>
    </form>

</main>

<script src="booktickets.js?v=1.1"></script>

</body>

</html>
