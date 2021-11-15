<%@ page import="no.amv.database.models.Equipment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<aside class="actions-container">
    <a href="/amv/admin/equipment?edit" class="button">Add equipment</a>
</aside>
<main>
    <table>
        <tr>
            <th>Name</th>
            <th>Kind</th>
            <th>Price</th>
            <th>Rent starts on day</th>
            <th>Comment</th>
            <th>Actions</th>
        </tr>
        <%for (Equipment e : (ArrayList<Equipment>) request.getAttribute("equipment")) { %>
        <tr>
            <td>
                <%=e.getName()%>
            </td>
            <td>
                <%=e.getCategoryName()%>
            </td>
            <td>
                <%if (e.getPrice() < 0) {%>
                -
                <%} else {%>
                <%=e.getPrice() / 100%> kr
                <%}%>
            </td>
            <td>
                <%=e.getRentStartDay()%>
            </td>
            <td>
                <%=e.getComment() == null ? "" : e.getComment()%>
            </td>
            <td>
                <a href="/amv/admin/equipment?edit=<%=e.getId()%>" class="button">
                    Edit
                </a>
                <a href="/amv/admin/equipment?delete=<%=e.getId()%>" class="error button">
                    Delete
                </a>
            </td>
        </tr>
        <%}%>
    </table>
</main>
<t:footer/>
