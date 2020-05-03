<%--
  Created by IntelliJ IDEA.
  User: GOGA
  Date: 4/22/2020
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("session")==null){
        response.sendRedirect("index.jsp");
    }
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {

            cookie.setMaxAge(0);
            response.addCookie(cookie);

        }



        session.removeAttribute("session");
        session.setAttribute("session","FALSE");

    response.sendRedirect("index.jsp");
%>

<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
