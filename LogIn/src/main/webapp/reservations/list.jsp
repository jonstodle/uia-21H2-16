<%@ page import="java.util.ArrayList" %>
<%@ page import="no.amv.database.models.UserReservation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<main>
    <table>
        <tr>
            <th>Equipment</th>
            <th>Start date</th>
            <th>Returned date</th>
            <th>Actions</th>
        </tr>
        <%for (UserReservation ur : (ArrayList<UserReservation>) request.getAttribute("reservations")) { %>
        <tr>
            <td>
                <%=ur.getEquipment()%>
            </td>
            <td>
                <%=ur.getStartDate()%>
            </td>
            <td>
                <%=ur.getReturnedDate() != null ? ur.getReturnedDate() : ""%>
            </td>
            <td>
                <%if (ur.getReturnedDate() == null) {%>
                <form action="/amv/reservations?return=<%=ur.getReservationId()%>" method="POST">
                    <input type="submit" value="Return">
                </form>
                <%}%>
            </td>
        </tr>
        <%}%>
    </table>
</main>
<t:footer/>
