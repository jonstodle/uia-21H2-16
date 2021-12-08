<%@ page import="no.amv.database.models.Equipment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%!
    Equipment getEquipment(HttpServletRequest req) {
        return (Equipment) req.getAttribute("equipment");
    }
%>
<t:header/>
<aside></aside>
<section>
    <h1>Reserve <%=getEquipment(request).getName()%>?</h1>
    <%if (request.getParameter("error") != null) {%>
    <article id="error-banner" class="card">
        <%=request.getParameter("error").replaceAll("[+]", " ")%>
    </article>
    <%}%>
    <p>Can reserve for a maximum of <%=getEquipment(request).getMaxRentalDays()%> days</p>
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
</section>
<script>
    const now = new Date();
    const year = now.getFullYear();
    let month = now.getMonth() + 1;
    month = month.toString().length === 1 ? "0" + month : month;
    let day = now.getDate();
    day = day.toString().length === 1 ? "0" + day : day;
    document.querySelector("[name=from-date]").setAttribute("min", [year, month, day].join("-"))
    document.querySelector("[name=to-date]").setAttribute("min", [year, month, day].join("-"))
</script>
<style>
    #error-banner {
        background-color: darkred;
        color: white;
        padding: .5rem 1rem;
    }
</style>
<t:footer/>
