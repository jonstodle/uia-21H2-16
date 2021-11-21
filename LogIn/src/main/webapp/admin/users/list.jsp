<%@ page import="no.amv.database.models.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<aside class="actions-container">
    <a href="/amv/admin/users?edit" class="button">Add user</a>
    <a href="/amv/admin/users?import" class="button">Import users</a>
</aside>
<main class="list">
    <%for (User u : (ArrayList<User>) request.getAttribute("users")) { %>
    <article class="card">
        <header>
            <h3>
                <%=u.getName()%>
            </h3>
        </header>
        <div class="content">
            <strong>Email</strong>
            <span>
                    <%=u.getEmail()%>
                </span>
        </div>
        <footer>
            <a href="/amv/admin/users?edit=<%=u.getId()%>" class="button">
                Edit
            </a>
            <a href="/amv/admin/users?delete=<%=u.getId()%>" class="error button">
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
</style>
<t:footer/>
