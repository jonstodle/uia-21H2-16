<%@ page import="no.amv.database.models.Equipment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Equipment getEquipment(HttpServletRequest req) {
        return (Equipment) req.getAttribute("equipment");
    }
%>
<html>
<head>
    <title>Reserve <%=getEquipment(request).getName()%>?</title>
    <link rel="stylesheet" href="/amv/picnic.css">
</head>
<body>
<nav></nav>
<main>
    <h1>Reserve <%=getEquipment(request).getName()%>?</h1>
    <form action="/amv/reservations?new=<%=getEquipment(request).getId()%>" method="POST">
        <label>
            Reserve from:
            <input type="date" name="date" required>
        </label>
        <input type="submit" value="Reserve">
    </form>
</main>
<style>
    main {
        margin-top: 4rem;
    }
</style>
</body>
</html>
