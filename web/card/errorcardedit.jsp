<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("session")==null){

        response.sendRedirect("index.jsp");
}
    int id = Integer.parseInt(request.getParameter("cardid"));
%>
<jsp:include page="cardedit.jsptifacts/Tickets_war_exploded/cardedit.jsp?cardid=${id}"/>
<p>information is incorect</p>