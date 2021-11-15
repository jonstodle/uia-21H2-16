<%@ page import="no.amv.database.models.Lease" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Leases</title>
    <link rel="stylesheet" href="/amv/picnic.css">
</head>
<body>
<nav>
    <a href="/amv/leases?upload" class="button">Upload</a>
</nav>
<main>
    <table>
        <tr>
            <th>
                Name
            </th>
            <th>
                Actions
            </th>
        </tr>
        <%for (Lease l : (ArrayList<Lease>) request.getAttribute("leases")) {%>
        <tr>
            <td>
                <%=l.getName()%>
            </td>
            <td>
                <a href="/amv/leases?download=<%=l.getId()%>" class="button">
                    Download
                </a>
                <a href="/amv/leases?delete=<%=l.getId()%>" class="button error">
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
    }

    main {
        margin-top: 4rem;
    }
</style>
</body>
</html>
