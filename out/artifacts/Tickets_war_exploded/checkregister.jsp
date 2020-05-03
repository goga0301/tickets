
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.DAO" %>
<jsp:useBean id="u" class="beans.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%


    int result = DAO.RegisterUser(u);
    if(result>0){

        response.sendRedirect("index.jsp");


    }else {
        response.sendRedirect("errorregister.jsp");
    }



%>
