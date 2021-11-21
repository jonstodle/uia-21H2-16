<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:header/>
<main>
    <h1>Upload lease</h1>
    <p>
        File must be in the following format:
    <pre><code>&lt;name&gt;,&lt;email&gt;,&lt;password&gt;</code></pre>
    </p>
    <form action="/amv/admin/users?import" method="POST" enctype="multipart/form-data">
        <label>
            <input type="file" id="file-input" name="file" required>
        </label>
        <input type="submit" value="Import">
    </form>
</main>
<t:footer/>
