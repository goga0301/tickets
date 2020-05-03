<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.DAO" %>
<jsp:useBean id="user" class="beans.User"/>
<jsp:setProperty name="user" property="*"/>
<%

    boolean status =  DAO.CheckLogin(user);
    if(status){

        session.setAttribute("isUserLoggedIn","");
        session.setAttribute("session","TRUE");
        Cookie c = new Cookie("username",user.getUsername());
        response.addCookie(c);

        response.sendRedirect("homepage.jsp");
    }else {

        response.sendRedirect("errorlogin.jsp");
    }



%>
