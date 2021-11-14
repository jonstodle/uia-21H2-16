<%@ page import="no.amv.database.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    User getUser(HttpServletRequest req) {
        return (User) req.getAttribute("user");
    }
%>
<html>
<head>
    <title>Delete <%=getUser(request).getName()%>?</title>
    <link rel="stylesheet" href="/amv/picnic.css">
</head>
<body>
<h1>Delete <%=getUser(request).getName()%>?</h1>
<form action="/amv/admin/users?delete=<%=getUser(request).getId()%>" method="POST">
    <input type="submit" class="error" value="Yes">
    <button id="no-button">No</button>
</form>
<script>
    document
        .getElementById("no-button")
        .addEventListener("click", () => history.back())
</script>
</body>
</html>
