<%@ page import="beans.DAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("session")==null){

        response.sendRedirect("index.jsp");

    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    int sessionid = Integer.parseInt(request.getParameter("sessionid"));
    boolean[] b = DAO.getTicketsbyId(sessionid);
    request.setAttribute("sessionid",sessionid);

    if (DAO.CheckTickets(b)) {
        response.sendRedirect("booktickets.jsp?sessionid="+sessionid);

    } else {


        response.sendRedirect("notickets.jsp?sessionid="+sessionid);


    }
%>
</body>
</html>
