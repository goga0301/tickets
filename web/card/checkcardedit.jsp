<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.DAO" %>
<jsp:useBean id="c" class="beans.Card"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>
<%
    if(session.getAttribute("session")==null){

        response.sendRedirect("index.jsp");
    }

    int result = DAO.EditCard(c);
%>
<script type="text/javascript">
    function alertName() {
        alert("This card is already added or information is incorect");
        window.history.back()
    }


</script>
<%
    if(!DAO.CheckCard(c) || c.getNumber().length()!=16 || result<0){
%>
<script>
    alertName();

</script>
<%
}else{


            response.sendRedirect("profile.jsp");


    }

%>