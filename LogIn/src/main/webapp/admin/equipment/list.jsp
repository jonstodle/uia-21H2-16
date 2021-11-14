<%@ page import="no.amv.database.models.Equipment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Equipment Management</title>
    <link rel="stylesheet" href="/amv/picnic.css">
</head>
<body>
<nav>
    <a href="/amv/admin/equipment?edit" class="button">Add equipment</a>
</nav>
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
<style>
    nav {
        display: flex;
        justify-content: flex-end;
        box-shadow: 0 3px rgba(0, 0, 0, .2);
    }

    main {
        margin-top: 4rem;
    }
</style>
</body>
</html>
