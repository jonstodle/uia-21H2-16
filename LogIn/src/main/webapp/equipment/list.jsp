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

    <section>
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
                <a href="/amv/reservations?new=<%=e.getId()%>" class="button">
                    Reserve
                </a>
            </footer>
        </article>
        <%}%>
    </section>
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

    @media (max-width: 600px) {
        main {
            grid-template:
                "nav"
                "main";
        }
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

    .card h3 {
        display: inline;
    }

    .card header {
        display: flex;
        justify-content: space-between;
    }

    .card .content {
        padding: 0 1rem;
        display: grid;
        gap: .5rem;
        grid-template-columns: auto 1fr;
    }

    .card .content .comment {
        grid-column-end: span 2;
    }

    .card footer {
        display: flex;
        justify-content: flex-end;
    }
</style>
<t:footer/>
