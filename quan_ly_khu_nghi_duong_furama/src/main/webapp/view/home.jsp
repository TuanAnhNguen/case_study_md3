<%--
  Created by IntelliJ IDEA.
  User: Nitro V
  Date: 3/26/2025
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý khu nghỉ dưỡng Furama </title>
    <c:import url="../layout/library.jsp"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background: #333;
            color: white;
        }
        nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
        }
        .container {
            display: flex;
        }
        aside {
            width: 200px;
            background: #f4f4f4;
            padding: 15px;
        }
        .content {
            flex: 1;
            padding: 20px;
        }
        footer {
            background: #333;
            color: white;
            padding: 20px 50px;
            font-size: 14px;
        }
        .footer-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer-left {
            max-width: 50%;
        }

        .footer-right {
            text-align: right;
        }

        .footer-right a {
            color: #ccc;
            text-decoration: none;
            margin: 0 5px;
        }

        .footer-right a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<c:import url="../layout/header.jsp"/>
<div class="container">
    <aside>
        <ul>
            <li><a href="#">Item One</a></li>
            <li><a href="#">Item Two</a></li>
            <li><a href="#">Item Three</a></li>
        </ul>
    </aside>
    <main class="content">
        <h2>Chào mừng đến với khu nghỉ dưỡng Furama Resort</h2>
        <p>...</p>
    </main>
</div>
<footer>
    <div class="footer-container">
        <div class="footer-left">
            <p>Địa chỉ: Tòa Viglaccra Tower, số 1 Đại lộ Thăng Long, Mễ Trì, Nam Từ Liêm, Hà Nội </p>
            <p>Thông tin liên hệ: 0123456789</p>
        </div>
        <div class="footer-right">
            <p><a href="#">Chính sách bảo mật</a> | <a href="#">Chính sách thanh toán</a></p>
        </div>
    </div>
</footer>
</body>
</html>
