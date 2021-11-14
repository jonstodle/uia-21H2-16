<%@ page import="no.amv.database.models.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
    <link rel="stylesheet" href="/amv/picnic.css">
</head>
<body>
<nav>
    <a href="/amv/admin/users?edit" class="button">Add user</a>
</nav>
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
