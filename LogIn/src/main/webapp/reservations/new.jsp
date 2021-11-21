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
    <%if (request.getParameter("error") != null) {%>
    <article id="error-banner" class="card">
        <%=request.getParameter("error").replaceAll("[+]", " ")%>
    </article>
    <%}%>
    <form action="/amv/reservations?new=<%=getEquipment(request).getId()%>" method="POST">
        <label>
            Reserve from:
            <input type="date" name="from-date" required>
        </label>
        <label>
            Reserve to:
            <input type="date" name="to-date" required>
        </label>
        <input type="submit" value="Reserve">
    </form>
</main>
<style>
    #error-banner {
        background-color: darkred;
        color: white;
        padding: .5rem 1rem;
    }
</style>
<t:footer/>
