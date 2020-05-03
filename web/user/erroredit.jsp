<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.DAO" %>
<%@ page import="beans.Card" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<jsp:useBean id="user" class="beans.User"/>
<jsp:setProperty name="user" property="*"/>
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
    user = DAO.getUser(username);
    ArrayList<Card> cards = DAO.getCards(username);
    request.setAttribute("cards",cards);

%>

<html>

<head>
    <title>Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="profile.css?v=1.1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>

<body>
<nav class="navbar navbar-expand-md navbar-dark bg-primary">
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
                <a class="nav-link" href="profile.jsp">Profile</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="logout.jsp">Log out</a>
            </li>
        </ul>
    </div>
</nav>
<main>
    <h3 align="center"><%=user.getUsername()%></h3>

    <aside id="left-aside">

        <form method="post" action="checkedit.jspifacts/Tickets_war_exploded/checkedit.jsp" id="edit-form" class="justify-content-center">


            <h4>Edit your information</h4>


            <div class="form-group row">
                <label for="saxeli" class="col-sm-2 col-form-label">Saxeli</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="saxeli" name="saxeli" value="<%=user.getSaxeli()%>">
                </div>
            </div>
            <div class="form-group row">
                <label for="gvari" class="col-sm-2 col-form-label">gvari</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="gvari" name="gvari" value="<%=user.getGvari()%>">
                </div>
            </div>
            <div class="form-group row">
                <label for="idnum" class="col-sm-2 col-form-label">ID Number</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control"  id="idnum" name="idnum"
                           value="<%=user.getIdnum()%>">
                </div>
            </div>
            <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="email" name="email" value="<%=user.getEmail()%>">
                </div>
            </div>
            <div class="form-group row">
                <label for="username" class="col-sm-2 col-form-label">Username</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control-plaintext" readonly  id="username" name="username"
                           value="<%=user.getUsername()%>">
                </div>
            </div>
            <div class="form-group row">
                <label for="password" class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" id="password" name="password" value="<%=user.getPassword()%>">
                </div>
            </div>
            <p style="color: red;font-size: 20">შეყვანილი ინფორმაცია არ არის სწორი</p>
            <button type="submit" class="btn btn-primary">Save</button>
        </form>



    </aside>



    <aside id="right-aside">

        <div>
            <h4>Your Cards</h4>

        </div>
        <div id="cards">
            <c:forEach items="${cards}" var="c" >
                <div class="card-box">
                    <label>name: ${c.getName()}</label>
                    <label>number: ${c.getNumber()}</label>

                    <button class="btn btn-primary" id="${c.getCard_id()}" onclick="ShowEditCard(${c.getCard_id()})">Edit Card</button>
                    <button onclick="location.href='DeleteCard.jsp?cardid=${c.getCard_id()}'" class="btn btn-danger"
                            type="button">Delete</button>
                </div>
                <div class="editcenter hideeditform" id="card-edit-div${c.getCard_id()}">
                    <button id="editclose${c.getCard_id()}" class="btn btn-danger" style="float: right;">X</button>
                    <form method="post" action="../card/checkcardedit.jsp" class="justify-content-center editcard-form">
                        <input name="card_id" type="hidden" value="${c.getCard_id()}">
                        <input name="username" type="hidden" value="${c.getUsername()}">
                        <h4>Edit Card</h4>


                        <div class="form-group row">
                            <label for="name" class="col-sm-4 col-form-label ">Name on card</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="name" value="${c.getName()}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="number" class="col-sm-4 col-form-label">Number</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="number" value="${c.getNumber()}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="date" class="col-sm-4 col-form-label">Expire Date</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="date" value="${c.getDate()}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="code" class="col-sm-4 col-form-label">Security Code</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" name="code" value="${c.getCode()}" >
                            </div>
                        </div>


                        <button type="submit" class="btn btn-primary">Save Edit</button>
                    </form>
                </div>


            </c:forEach>
        </div>



        <div id="addcard">
            <button class="btn btn-primary" id="addcardbtn">Add new card</button>
        </div>


        <div class="center hideform">
            <button id="close" class="btn btn-danger" style="float: right;">X</button>
            <form method="post" action="../card/checkaddcard.jsp" id="addcard-form" class="justify-content-center">
                <input name="username" type="hidden" value="<%=user.getUsername()%>">

                <h4>Add New Card</h4>


                <div class="form-group row">
                    <label for="name" class="col-sm-4 col-form-label ">Name on card</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="name" name="name">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="number" class="col-sm-4 col-form-label">Number</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="number" name="number">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="date" class="col-sm-4 col-form-label">Expire Date</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="date" name="date">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="code" class="col-sm-4 col-form-label">Security Code</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="code" name="code" >
                    </div>
                </div>


                <button type="submit" class="btn btn-primary">Add New Card</button>
            </form>
        </div>






    </aside>

</main>
<script src="profile.js?v=1.1"></script>
</body>

</html>