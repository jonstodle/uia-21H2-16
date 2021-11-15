<%@ page import="no.amv.database.models.Equipment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%!
    Equipment getEquipment(HttpServletRequest req) {
        return (Equipment) req.getAttribute("equipment");
    }
%>
<t:header/>
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
<t:footer/>
