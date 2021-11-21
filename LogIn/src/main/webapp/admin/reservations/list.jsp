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
            <strong>User</strong>
            <span>
            <%=ur.getUser()%>
        </span>

            <strong>Renting</strong>
            <span>
            <%=ur.getStartDate()%>
                &mdash;
            <%=ur.getEndDate()%>
        </span>

            <strong>Paid</strong>
            <span>
            <%=ur.getPaidDate() == null ? "Not paid" : ur.getPaidDate()%>
        </span>
        </div>
        <footer>
            <%if (ur.getPaidDate() == null) {%>
            <form action="/amv/admin/reservations?markPaid=<%=ur.getReservationId()%>" method="POST">
                <input type="submit" value="Mark as paid">
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
