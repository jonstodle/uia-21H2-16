<%@ page import="no.amv.database.models.Equipment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<aside class="actions-container">
    <a href="/amv/admin/equipment?edit" class="button">Add equipment</a>
</aside>
<main class="list">
    <%for (Equipment e : (ArrayList<Equipment>) request.getAttribute("equipment")) { %>
    <article class="card">
        <header>
            <h3>
                <%=e.getName()%>
            </h3>
            <span>
                <%if (e.getPrice() < 0) {%>
                -
                <%} else {%>
                <%=e.getPrice() / 100%>&nbsp;kr
                <%}%>
                </span>
        </header>
        <div class="content">
            <strong>
                Category
            </strong>
            <span>
                    <%=e.getCategoryName()%>
                </span>

            <strong>
                Rent starts on day
            </strong>
            <span>
                    <%=e.getRentStartDay()%>
                </span>

            <span class="comment">
                    <%=e.getComment() == null ? "" : e.getComment()%>
                </span>
        </div>
        <footer>
            <a href="/amv/admin/equipment?edit=<%=e.getId()%>" class="button">
                Edit
            </a>
            <a href="/amv/admin/equipment?delete=<%=e.getId()%>" class="error button">
                Delete
            </a>
        </footer>
    </article>
    <%}%>
</main>
<style>
    .actions-container {
        margin-bottom: 2rem;
    }

    .list .card .content .comment {
        grid-column-end: span 2;
    }
</style>
<t:footer/>
