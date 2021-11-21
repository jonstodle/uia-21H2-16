<%@ page import="no.amv.database.models.Equipment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<main>
    <aside>
        <ul>
            <li>
                <a href="/amv/equipment"
                   class="button <%=request.getParameter("category") == null ? "" : "pseudo"%> filter">
                    All
                </a>
            </li>
            <%for (int i = 0; i < Equipment.getCategoryNames().length; i++) {%>
            <li>
                <a href="/amv/equipment?category=<%=i + 1%>"
                   class="button <%=request.getParameter("category") != null && request.getParameter("category").equals(Integer.toString(i + 1)) ? "" : "pseudo"%> filter">
                    <%=Equipment.getCategoryNames()[i]%>
                </a>
            </li>
            <%}%>
        </ul>
    </aside>

    <section class="list">
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

                <strong>
                    Max rental days
                </strong>
                <span>
                    <%=e.getMaxRentalDays()%>
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
        margin-top: 0;
        padding: 0;
    }

    a.filter {
        width: 100%;
        text-align: start;
    }

    .list {
        grid-area: main;
    }

    .list .card .content .comment {
        grid-column-end: span 2;
    }
</style>
<t:footer/>
