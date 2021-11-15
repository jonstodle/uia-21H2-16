<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload lease</title>
    <link rel="stylesheet" href="/amv/picnic.css">
</head>
<body>
<nav></nav>
<main>
    <h1>Upload lease</h1>
    <form action="/amv/leases?upload" method="POST" enctype="multipart/form-data">
        <label>
            <input type="file" id="file-input" name="file" required>
        </label>
        <input type="submit" value="Submit">
    </form>
</main>
<style>
    main {
        margin-top: 4rem;
    }
</style>
</body>
</html>
