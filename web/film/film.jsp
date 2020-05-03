<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="beans.DAO,beans.Films" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.session" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("session")==null){
        response.sendRedirect("index.jsp");
    }
    String film = request.getParameter("film");

    ArrayList<session> s = DAO.getSessions(film);
    Films f = DAO.getFilmByName(film);
    ArrayList<String> cinemas = DAO.getCinemas();
    request.setAttribute("cinemas",cinemas);
    request.setAttribute("s",s);
%>
<html>
<head>
    <title><%=film%></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="film.csst/artifacts/Tickets_war_exploded/film.css?v=1.1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark bg-primary">
        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="homepage.jsp">Tickets</a>
                </li>
            </ul>
        </div>
        <div class="mx-auto order-0" id="homepage">
            <a class="navbar-brand mx-auto" href="homepage.jsp">Home page</a>

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
<main>
    <h3><%=film%></h3>
    <div class="film-container">
        <div class="film-div">
            <div class="img-div">
                <img src="<%=f.getImgpath()%>" alt="surati">
            </div>
            <div class="info-div">
                <p>გამოშვების წელი: <%=f.getYear()%></p>
                <p>ქვეყანა: <%=f.getCountry()%></p>
                <p>ჟანრი: <%=f.getGenre()%></p>
                <p>ხანგრძლივობა: <%=f.getDuration()%> წუთი</p>
                <p>რეჟისორი: <%=f.getDirector()%></p>
                <p>ბიუჯეტი: $<%=f.getBudget()%></p>
                <p>შემოსავალი: $<%=f.getIncome()%></p>
                <p>IMDB: <%=f.getImdb()%></p>
            </div>
        </div>

        <div class="description-div">
            <h4>აღწერა:</h4>
            <p><%=f.getDescription()%>></p>
        </div>
        <div id="show-trailer-div" onclick="ShowTrailer()">
            <h3 id="trailer-h3">ფილმის ტრეილერი</h3>
        </div>
        <div id="trailer-div">
            <iframe id="trailer" src="<%=f.getTrailer()%>" frameborder="0"
                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
        </div>

    </div>
    <div class="session-container">
        <div>
            <h3>ფილმის სეანსები</h3>
            <select class="form-control col-sm-2" id="filter">
                <option value="" selected>ყველა კინოთეატრი</option>
                <c:forEach items="${cinemas}" var="c">
                    <option value="${c}">${c}</option>
                </c:forEach>

            </select>
        </div>



        <div class="table-div">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">კინოთეატრი</th>
                    <th scope="col">ენა</th>
                    <th scope="col">ხარისხი</th>
                    <th scope="col">თარიღი</th>
                    <th scope="col">დრო</th>
                    <th scope="col">ბილეთის ფასი</th>

                </tr>
                </thead>
                <tbody id="tablebody">

                <c:forEach items="${s}" var="session" varStatus="loop">
                    <tr>
                        <th scope="row">${loop.index}</th>
                        <td class="type">${session.getCinema()}</td>
                        <td>${session.getLanguage()}</td>
                        <td>${session.getQuality()}</td>
                        <td>${session.getSessiondate()}</td>
                        <td>${session.getSessiontime()}</td>
                        <td>${session.getPrice()}</td>

                        <td><a href="../tickets/checktickets.jsp?sessionid=${session.getId()}">დაჯავშნა</a></td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</main>


<script src="film.jsut/artifacts/Tickets_war_exploded/film.js"></script>
</body>
</html>
