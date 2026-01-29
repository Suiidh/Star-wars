<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Rediriger vers la servlet admin
    response.sendRedirect(request.getContextPath() + "/admin/vaisseaux");
%>
