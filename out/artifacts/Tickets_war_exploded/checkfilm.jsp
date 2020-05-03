<%@ page import="beans.DAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    if(session.getAttribute("session")==null){
        RequestDispatcher d = request.getRequestDispatcher("index.jsp");

        d.forward(request, response);
    }
    String film = request.getParameter("film");
    boolean b = DAO.CheckFilm(film);

    if(b){


        response.sendRedirect("film.jsp?film="+film);

    }else{

        response.sendRedirect("nosessions.jsp?film="+film);

    }

%>
