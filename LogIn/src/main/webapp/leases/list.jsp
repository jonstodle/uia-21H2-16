<%@ page import="no.amv.database.models.Lease" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<aside>
    <a href="/amv/leases?upload" class="button">Upload</a>
</aside>
<main class="list">
    <%for (Lease l : (ArrayList<Lease>) request.getAttribute("leases")) {%>
    <article class="card">
        <header>
            <h3>
                <%=l.getName()%>
            </h3>
        </header>
        <footer>
            <a href="/amv/leases?download=<%=l.getId()%>" class="button">
                Download
            </a>
            <a href="/amv/leases?delete=<%=l.getId()%>" class="button error">
                Delete
            </a>
        </footer>
    </article>
    <%}%>
</main>
<t:footer/>
