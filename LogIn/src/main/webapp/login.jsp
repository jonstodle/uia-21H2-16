<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User login</title>
    <link rel="stylesheet" href="picnic.css">
</head>
<body>
<form action="j_security_check" method="post">
    <label>
        Username:
        <input type="text" name="j_username" required autofocus>
    </label>

    <label>
        Password:
        <input type="password" name="j_password" required>
    </label>

    <input type="submit" value="Log in">
</form>
</body>
</html>
