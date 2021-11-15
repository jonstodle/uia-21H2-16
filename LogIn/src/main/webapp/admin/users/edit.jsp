<%@ page import="no.amv.database.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%!
    User getUser(HttpServletRequest req) {
        return (User) req.getAttribute("user");
    }
%>
<t:header/>
<h1><%=getUser(request) != null ? String.join(" ", "Add", getUser(request).getName()) : "Add new user"%>
</h1>
<main>
    <form action="/amv/admin/users?edit=<%=getUser(request) != null ? getUser(request).getId() : ""%>"
          method="POST">
        <label>
            Name:
            <input type="text" name="name"
                   value="<%=getUser(request) != null ? getUser(request).getName() : ""%>"
                   required>
        </label>
        <label>
            Email:
            <input type="text" name="email"
                   value="<%=getUser(request) != null ? getUser(request).getEmail() : ""%>"
                   required>
        </label>
        <label>
            Password:
            <input type="text" name="password"
                   value="<%=getUser(request) != null ? getUser(request).getPassword() : ""%>"
                   required>
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
<t:footer/>
