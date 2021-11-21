<%@ page import="java.util.ArrayList" %>
<%@ page import="no.amv.database.models.UserReservation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<main class="list">
    <%for (UserReservation ur : (ArrayList<UserReservation>) request.getAttribute("reservations")) { %>
    <article class="card">
        <header>
            <h3>
                <%=ur.getEquipment()%>
            </h3>
        </header>
        <div class="content">
            <strong>Start</strong>
            <span>
                <%=ur.getStartDate()%>
            </span>
            <strong>End</strong>
            <span>
                <%=ur.getEndDate()%>
            </span>
            <strong>Returned date</strong>
            <span>
                <%=ur.getReturnedDate() != null ? ur.getReturnedDate() : ""%>
            </span>
        </div>
        <footer>
            <%if (ur.getReturnedDate() == null) {%>
            <form action="/amv/reservations?return=<%=ur.getReservationId()%>" method="POST">
                <input type="submit" value="Return">
            </form>
            <%}%>
        </footer>
    </article>
    <%}%>
</main>
<style>
    form {
        margin: 0;
    }
</style>
<t:footer/>
