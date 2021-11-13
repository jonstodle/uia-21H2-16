<%@ page import="no.amv.database.models.Equipment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Available Equipment</title>
    <link rel="stylesheet" href="picnic.css">
</head>
<body>
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
            <%=e.getComment()%>
        </td>
    </tr>
    <%}%>
</table>
</body>
</html>
