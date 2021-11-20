<%@tag description="Page header template" pageEncoding="UTF-8" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AMV</title>
    <link rel="stylesheet" href="/amv/static/picnic.css">
    <style>
        body {
            padding-top: 4rem;
        }

        #page-title {
            display: inline;
            padding: 0;
        }

        .actions-container {
            display: flex;
            justify-content: flex-end;
        }
    </style>
</head>
<body>
<nav id="page-nav">
    <h1 id="page-title">
        AMV
    </h1>

    <input id="bmenub" type="checkbox" class="show">
    <label for="bmenub" class="burger pseudo button">menu</label>

    <div class="menu">
        <a href="/amv/equipment" class="button pseudo">Equipment</a>
        <a href="/amv/reservations" class="button pseudo">Reservations</a>
        <a href="/amv/leases" class="button pseudo">Leases</a>
        <span>|</span>
        <a href="/amv/admin/equipment" class="button pseudo">Admin/Equipment</a>
        <a href="/amv/admin/users" class="button pseudo">Admin/Users</a>
        <span>|</span>
        <a href="/amv/login?logout" class="button pseudo">Log out</a>
    </div>
</nav>
