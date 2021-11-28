<%@tag description="Page header template" pageEncoding="UTF-8" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AMV</title>
    <link rel="shortcut icon" type="image/png" href="/amv/favicon.png">
    <link rel="stylesheet" href="/amv/static/picnic.css">
    <style>
        body {
            padding-top: 4rem;
        }

        #page-title {
            display: inline-flex;
            padding: 0;
            align-items: center;
            margin-top: .5rem;
        }

        #page-title > img {
            height: 2rem;
        }

        #page-title > small {
            font-size: .5em;
        }

        nav > .menu > a.button,
        nav > .menu > span {
            margin: 0;
            font-size: .8em;
            padding: .3em;
        }

        .actions-container {
            display: flex;
            justify-content: flex-end;
            gap: .5rem;
        }

        .list > .card {
            max-width: 800px;
        }

        .list > .card header {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
        }

        .list > .card header h3 {
            display: inline;
        }

        .list > .card .content {
            padding: 1rem 1rem 0 1rem;
            display: grid;
            gap: .5rem;
            grid-template-columns: auto 1fr;
            align-items: baseline;
        }

        .list > .card footer {
            display: flex;
            justify-content: flex-end;
            gap: .5rem;
        }
    </style>
</head>
<body>
<nav id="page-nav">
    <h1 id="page-title">
        <img src="/amv/favicon.png" alt="AMV logo">
        <small id="page-path"></small>
    </h1>

    <input id="bmenub" type="checkbox" class="show">
    <label for="bmenub" class="burger pseudo button">menu</label>

    <div class="menu">
        <a href="/amv/equipment" class="button pseudo">Equipment</a>
        <a href="/amv/reservations" class="button pseudo">Reservations</a>
        <a href="/amv/leases" class="button pseudo">Leases</a>
        <span>| Admin:</span>
        <a href="/amv/admin/equipment" class="button pseudo">Equipment</a>
        <a href="/amv/admin/reservations" class="button pseudo">Reservations</a>
        <a href="/amv/admin/settlements" class="button pseudo">Settlements</a>
        <a href="/amv/admin/users" class="button pseudo">Users</a>
        <span>|</span>
        <a href="/amv/login?logout" class="button pseudo">Log out</a>
    </div>
</nav>
<script>
    (function () {
        const paths = [
            ["admin/equipment", "Admin/Equipment"],
            ["admin/reservations", "Admin/Reservations"],
            ["admin/settlements", "Admin/Settlements"],
            ["admin/users", "Admin/Users"],
            ["/login", "Login"],
            ["/equipment", "Equipment"],
            ["/reservations", "Reservations"],
            ["/leases", "Leases"],
        ]

        let pageTitle;
        for (const [path, title] of paths) {
            if (location.pathname.toLowerCase().endsWith(path.toLowerCase())) {
                pageTitle = title;
                break;
            }
        }

        document.title = "AMV - " + pageTitle;
        document.getElementById("page-path").innerHTML = "/" + pageTitle;

        const menuLinks = document.querySelectorAll("div.menu>a.button");
        for (const el of menuLinks) {
            if (location.pathname.endsWith(el.getAttribute("href"))) {
                el.classList.remove("pseudo")
            }
        }
    })();
</script>
