<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.DAO" %>
<jsp:useBean id="u" class="beans.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    if(session.getAttribute("session")==null){

        response.sendRedirect("index.jsp");
    }

    int result = DAO.EditUser(u);

    if(result>0){

        response.sendRedirect("profile.jsp");

    }else {

        response.sendRedirect("erroredit.jsp");
    }



%>