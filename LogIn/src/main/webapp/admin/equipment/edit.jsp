<%@ page import="no.amv.database.models.Equipment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Equipment getEquipment(HttpServletRequest req) {
        return (Equipment) req.getAttribute("equipment");
    }
%>
<html>
<head>
    <title>
        <%=getEquipment(request) != null ? String.join(" ", "Add", getEquipment(request).getName()) : "Add new equipment"%>
    </title>
    <link rel="stylesheet" href="/amv/picnic.css">
</head>
<body>
<h1><%=getEquipment(request) != null ? String.join(" ", "Add", getEquipment(request).getName()) : "Add new equipment"%>
</h1>
<main>
    <form action="/amv/admin/equipment?edit=<%=getEquipment(request) != null ? getEquipment(request).getId() : ""%>"
          method="POST">
        <label>
            Name:
            <input type="text" name="name"
                   value="<%=getEquipment(request) != null ? getEquipment(request).getName() : ""%>"
                   required>
        </label>
        <label>
            Category:
            <select name="category">
                <%for (int i = 0; i < Equipment.getCategoryNames().length; i++) {%>
                <option value="<%=i + 1%>" <%=getEquipment(request) != null ? getEquipment(request).getCategory() == i + 1 ? "selected" : "" : ""%>><%=Equipment.getCategoryNames()[i]%>
                </option>
                <%}%>
            </select>
        </label>
        <label>
            Price:
            <input type="number" name="price" step="1"
                   value="<%=getEquipment(request) != null ? getEquipment(request).getPrice() / 100 : ""%>" required>
        </label>
        <label>
            Rent start on day:
            <input type="number" name="rent-starts-on-day"
                   value="<%=getEquipment(request) != null ? getEquipment(request).getRentStartDay() : ""%>" required>
        </label>
        <label>
            Comment:
            <textarea name="comment" cols="30"
                      rows="10"><%=getEquipment(request) != null ? getEquipment(request).getComment() != null ? getEquipment(request).getComment() : "" : ""%></textarea>
        </label>
        <input type="submit" value="Save">
    </form>
</main>
<style>
    form {
        display: flex;
        flex-direction: column;
    }
</style>
</body>
</html>
