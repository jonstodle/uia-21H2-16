<%@ page import="no.amv.database.models.Lease" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%!
    Lease getLease(HttpServletRequest req) {
        return (Lease) req.getAttribute("lease");
    }
%>
<t:header/>
<aside></aside>
<section>
    <h1>Delete <%=getLease(request).getName()%>?</h1>
    <form action="/amv/leases?delete=<%=getLease(request).getId()%>" method="POST">
        <input type="submit" class="error" value="Yes">
        <button id="no-button">No</button>
    </form>
    <script>
        document
            .getElementById("no-button")
            .addEventListener("click", () => history.back())
    </script>
</section>
<t:footer/>
