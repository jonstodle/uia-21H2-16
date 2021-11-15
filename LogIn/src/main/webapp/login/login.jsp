<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<style>
    #error-banner {
        background-color: darkred;
        color: white;
        padding: .5rem 1rem;
    }
</style>
<%if (request.getParameter("failed") != null) {%>
<article id="error-banner" class="card">
    Login failed
</article>
<%}%>
<form action="/amv/login" method="POST">
    <label>
        Username:
        <input type="text" name="username" required autofocus>
    </label>

    <label>
        Password:
        <input type="password" name="password" required>
    </label>

    <input type="submit" value="Log in">
</form>
<t:footer/>
