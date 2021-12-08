<%@ page import="java.util.ArrayList" %>
<%@ page import="no.amv.database.models.User" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="no.amv.database.models.UserReservation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<aside></aside>
<section class="list">
    <%for (User u : (ArrayList<User>) request.getAttribute("users")) { %>
    <article class="card">
        <header>
            <h3>
                <%=u.getName()%>
            </h3>

            <form action="/amv/admin/settlements?all=<%=u.getId()%>" method="POST">
                <input type="submit" value="Mark all as paid">
            </form>
        </header>
        <div class="settlement content">
            <%for (UserReservation ur : ((HashMap<Integer, ArrayList<UserReservation>>) request.getAttribute("reservations")).get(u.getId())) { %>
            <strong>
                <%=ur.getEquipment()%>
            </strong>
            <span>
                <%=ur.getStartDate()%>
                &mdash;
                <%=ur.getEndDate()%>
            </span>
            <form action="/amv/admin/settlements?single=<%=ur.getReservationId()%>" method="POST">
                <input type="submit" value="Mark as paid">
            </form>
            <%}%>
        </div>
    </article>
    <%}%>
</section>
<style>
    .list > .card .content.settlement {
        grid-template-columns: auto 1fr auto;
    }

    form {
        margin: 0;
    }
</style>
<t:footer/>
