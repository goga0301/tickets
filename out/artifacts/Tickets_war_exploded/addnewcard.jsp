<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("session")==null){

        response.sendRedirect("index.jsp");
    }
    String username = request.getParameter("username");
%>
<html>
<head>
    <title>Add new card</title>
</head>
<body>
<form method="post" action="checkaddcard.jsp">
    <input type="hidden" name="username" value="<%=username%>">
    <label>Number:</label>
    <input name="number" >
    <label>Name:</label>
    <input name="name">
    <label>Expire date:</label>
    <input name="date">
    <label>Security code:</label>
    <input name="code" type="password">
    <input type="submit">
</form>

</body>
</html>
