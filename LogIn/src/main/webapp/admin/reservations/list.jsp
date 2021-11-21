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
        </div>
    </article>
    <%}%>
</main>
<style>
    form {
        margin: 0;
    }
</style>
<t:footer/>
