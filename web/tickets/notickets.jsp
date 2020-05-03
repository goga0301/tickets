<%@ page import="beans.DAO" %>
<%@ page import="beans.Card" %>
<%@ page import="java.util.ArrayList" %>
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

    <title>No tickets</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="booktickets.cssacts/Tickets_war_exploded/booktickets.css?v=1.1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
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
            <h3 style="margin-top: 50px;" align="center">სამწუხაროდ ამ სეანსზე ყველა ბილეთი გაყიდულია</h3>

        </div>
    </aside>
    <div class="bookingbtn" >
        <button id="bookticket" onclick="window.location.href='film.jsp?film=<%=s.getFilm()%>'" class="btn btn-success" >სხვა სეანსების ნახვა</button>
    </div>

</main>

<script src="booktickets.jsfacts/Tickets_war_exploded/booktickets.js?v=1.1"></script>


</body>
</html>
