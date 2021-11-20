<%@ page import="no.amv.database.models.Equipment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<main>
    <aside>
        <ul>
            <li class="card">
                <a href="/amv/equipment" class="filter">
                    All
                </a>
            </li>
            <%for (int i = 0; i < Equipment.getCategoryNames().length; i++) {%>
            <li class="card">
                <a href="/amv/equipment?category=<%=i + 1%>" class="filter">
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
                <a href="/amv/reservations?new=<%=e.getId()%>" class="button">
                    Reserve
                </a>
            </td>
        </tr>
        <%}%>
    </table>
</main>

<style>
    main {
        display: grid;
        gap: 2rem;
        grid-template:
            "nav main"
            / 200px auto;
        align-items: start;
    }

    aside {
        grid-area: nav;
    }

    ul {
        list-style: none;
        padding: 0;
    }

    a.filter {
        padding: .5rem 1rem;
    }

    table {
        grid-area: main;
    }
</style>
<t:footer/>
