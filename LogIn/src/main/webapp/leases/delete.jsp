<%@ page import="no.amv.database.models.Lease" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Lease getLease(HttpServletRequest req) {
        return (Lease) req.getAttribute("lease");
    }
%>
<html>
<head>
    <title>Delete <%=getLease(request).getName()%>?</title>
    <link rel="stylesheet" href="/amv/picnic.css">
</head>
<body>
<h1>Delete <%=getLease(request).getName()%>?</h1>
<form action="/amv/leases?delete=<%=getLease(request).getId()%>" method="POST">
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
