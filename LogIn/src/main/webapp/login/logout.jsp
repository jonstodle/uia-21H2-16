<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<aside></aside>
<section>
    <h1>Log out?</h1>
    <form action="/amv/login?logout" method="POST">
        <input type="submit" value="Yes">
        <button id="no-button" class="pseudo">No</button>
    </form>
    <script>
        document
            .getElementById("no-button")
            .addEventListener("click", () => history.back())
    </script>
</section>
<t:footer/>
