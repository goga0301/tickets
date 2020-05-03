<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.DAO" %>
<%

    if(session.getAttribute("session")==null){

        response.sendRedirect("index.jsp");
}

    int id = Integer.parseInt(request.getParameter("sessionid"));
    String tkt = request.getParameter("tkt").replaceAll(",","");
    String sessionid=request.getParameter("sessionid");
    DAO.UpdateTickets(id,tkt);


    response.sendRedirect("booktickets.jsp?sessionid="+sessionid);
%>


