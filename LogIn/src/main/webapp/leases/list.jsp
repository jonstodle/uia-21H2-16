<%@ page import="no.amv.database.models.Lease" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<aside class="actions-container">
    <a href="/amv/leases?upload" class="button">Upload</a>
</aside>
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
<t:footer/>
