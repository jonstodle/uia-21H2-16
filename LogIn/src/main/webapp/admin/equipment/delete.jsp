<%@ page import="no.amv.database.models.Equipment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Equipment getEquipment(HttpServletRequest req) {
        return (Equipment) req.getAttribute("equipment");
    }
%>
<html>
<head>
    <title>Delete <%=getEquipment(request).getName()%>?</title>
    <link rel="stylesheet" href="/amv/picnic.css">
</head>
<body>
<h1>Delete <%=getEquipment(request).getName()%>?</h1>
<form action="/amv/admin/equipment?delete=<%=getEquipment(request).getId()%>" method="POST">
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
