<%@ page import="beans.DAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if(session.getAttribute("session")==null){

        response.sendRedirect("index.jsp");
    }

    int id = Integer.parseInt(request.getParameter("cardid"));

    DAO.DeleteCard(id);

    response.sendRedirect("profile.jsp");
%>


