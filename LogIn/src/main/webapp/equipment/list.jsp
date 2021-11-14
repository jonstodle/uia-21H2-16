<%@ page import="no.amv.database.models.Equipment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Available Equipment</title>
    <link rel="stylesheet" href="/amv/picnic.css">
</head>
<body>
<main>
    <aside>
        <ul>
            <li class="card">
                <a href="/amv/equipment">
                    All
                </a>
            </li>
            <%for (int i = 0; i < Equipment.getCategoryNames().length; i++) {%>
            <li class="card">
                <a href="/amv/equipment?category=<%=i + 1%>">
                    <%=Equipment.getCategoryNames()[i]%>
                </a>
            </li>
            <%}%>
        </ul>
    </aside>

    <table>
        <tr>
            <th>Name</th>
            <th>Kind</th>
            <th>Price</th>
            <th>Rent starts on day</th>
            <th>Comment</th>
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
        </tr>
        <%}%>
    </table>
</main>

<style>
    body {
        max-width: 1200px;
    }

    main {
        display: grid;
        gap: 2rem;
        grid-template:
            "nav main"
            / 200px auto;
    }

    aside {
        grid-area: nav;
    }

    ul {
        list-style: none;
        padding: 0;
    }

    a {
        padding: .5rem 1rem;
    }

    table {
        grid-area: main;
    }
</style>
</body>
</html>
