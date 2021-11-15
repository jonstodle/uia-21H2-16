<%@ page import="no.amv.database.models.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<aside class="actions-container">
    <a href="/amv/admin/users?edit" class="button">Add user</a>
</aside>
<main>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        <%for (User u : (ArrayList<User>) request.getAttribute("users")) { %>
        <tr>
            <td>
                <%=u.getName()%>
            </td>
            <td>
                <%=u.getEmail()%>
            </td>
            <td>
                <a href="/amv/admin/users?edit=<%=u.getId()%>" class="button">
                    Edit
                </a>
                <a href="/amv/admin/users?delete=<%=u.getId()%>" class="error button">
                    Delete
                </a>
            </td>
        </tr>
        <%}%>
    </table>
</main>
<t:footer/>
