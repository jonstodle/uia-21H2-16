<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<main>
    <h1>Upload lease</h1>
    <form action="/amv/leases?upload" method="POST" enctype="multipart/form-data">
        <label>
            <input type="file" id="file-input" name="file" required>
        </label>
        <input type="submit" value="Submit">
    </form>
</main>
<t:footer/>
