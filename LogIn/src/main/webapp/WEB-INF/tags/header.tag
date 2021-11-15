<%@tag description="Page header template" pageEncoding="UTF-8" %>
<html>
<head>
    <title>AMV</title>
    <link rel="stylesheet" href="/amv/picnic.css">
    <style>
        body {
            padding-top: 4rem;
        }

        #page-nav {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            box-shadow: 0 2px rgba(0, 0, 0, .2);
        }

        #page-title {
            display: inline;
            padding: 0;
        }

        #page-nav > div > * {
            padding: .5rem 1rem;
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

    <div>
        <a href="/amv/equipment">Equipment</a>
        <a href="/amv/reservations">Reservations</a>
        <a href="/amv/leases">Leases</a>
        <span>|</span>
        <a href="/amv/admin/equipment">Admin/Equipment</a>
        <a href="/amv/admin/users">Admin/Users</a>
    </div>
</nav>
