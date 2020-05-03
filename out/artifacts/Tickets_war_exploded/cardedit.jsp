<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.DAO,beans.Card" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if(session.getAttribute("session")==null){

        response.sendRedirect("index.jsp");
    }
%>
<html>
<head>
    <title>Edit card information</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("cardid"));

    Card card = DAO.getCardById(id);


%>
<form method="post" action="checkcardedit.jsp">
    <input type="hidden" name="card_id" value="<%=id%>">
    <label>name</label>
    <input type="text" name="name" value="<%=card.getName()%>"><br>
    <label>number</label>
    <input type="text" name="number" value="<%=card.getNumber()%>"><br>
    <label>date</label>
    <input type="text" name="date" value="<%=card.getDate()%>"><br>
    <label>code</label>
    <input type="text" name="code" value="<%=card.getCode()%>"><br>
    <input type="submit">

</form>



</body>
</html>
