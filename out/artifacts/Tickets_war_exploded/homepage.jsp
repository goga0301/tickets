<%@ page import="beans.Films,beans.DAO,beans.User" %>
<%@ page import="java.util.List" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="beans.User"/>
<jsp:setProperty name="user" property="*"/>
<%

    if(session.getAttribute("session")==null){
        response.sendRedirect("index.jsp");
    }
    List<Films> list = DAO.getFilms();

    request.setAttribute("list",list);
%>
<html>
<head>
    <title>Homepage - დაჯავშნე ბილეთები ონლაინ</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="homepage.css">
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
                <a class="nav-link" href="profile.jsp">Profile</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="logout.jsp">Log out</a>
            </li>
        </ul>
    </div>
</nav>
</header>
<main id="main">
    <h2>დაჯავშნე ფილმის ბილეთები ონლაინ</h2>
    <div class="movie-container" >
    <c:forEach items="${list}" var="f" varStatus="loop">
        <c:if test="${loop.index%4!=3}">
            <div class="movie-card">
                <div class="img-card">
                    <a href="checkfilm.jsp?film=${f.getName()}"><img src="${f.getImgpath()}"></a>
                </div>

                <div class="card-hover" id="crdhvr">
                    <div class="img-card-hover">
                        <a href="checkfilm.jsp?film=${f.getName()}"><img src="${f.getImgpath()}"></a>
                    </div>
                    <div class="info-card">
                        <h4><b>${f.getName()}</b></h4>
                        <p>ჟანრი: ${f.getGenre()}</p>
                        <p>თარიღი: ${f.getYear()}</p>
                        <p>რეჟისორი: ${f.getDirector()}</p>
                        <p>ხანგრძლივობა: ${f.getDuration()} წუთი</p>

                        <P>აღწერა: ${f.getShortDesc()}</P>
                        <a href="checkfilm.jsp?film=${f.getName()}">ვრცლად</a>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${loop.index%4==3}">
        <div class="movie-card-right">
            <div class="img-card-right">
                <a href="checkfilm.jsp?film=${f.getName()}"><img src="${f.getImgpath()}"></a>
            </div>

            <div class="card-hover-right" id="crdhvr-right">
                <div class="img-card-hover-right">
                    <a href="checkfilm.jsp?film=${f.getName()}"><img src="${f.getImgpath()}"></a>
                </div>
                <div class="info-card-right">
                    <h4><b>${f.getName()}</b></h4>
                    <p>ჟანრი: ${f.getGenre()}</p>
                    <p>თარიღი: ${f.getYear()}</p>
                    <p>რეჟისორი: ${f.getDirector()}</p>
                    <p>ხანგრძლივობა: ${f.getDuration()} წუთი</p>

                    <P>აღწერა: ${f.getShortDesc()}</P>
                    <a href="checkfilm.jsp?film=${f.getName()}">ვრცლად</a>
                </div>
            </div>
        </div>

        </c:if>

    </c:forEach>
    </div>





</main>

</body>
</html>
