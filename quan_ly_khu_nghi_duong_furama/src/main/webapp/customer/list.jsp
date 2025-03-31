<%--
  Created by IntelliJ IDEA.
  User: Nitro V
  Date: 3/27/2025
  Time: 12:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
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
<h2>Danh sách khách hàng</h2>
<a href="/customers?action=create">Thêm mới khách hàng</a>
<h3 style="color: red">${param.message}</h3>

<form action="/customers" method="get" class="d-flex justify-content-end">
    <input hidden="hidden" name="action" value="searchCustomer">
    <input class="form-control form-control-sm w-25" name="searchName" placeholder="Nhập tên cần tìm kiếm">
    <button class="btn btn-primary btn-sm">Tìm kiếm</button>
</form>

<div class="container mt-4">
    <table class="table table-bordered table-striped table-hover text-center align-middle">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Giới tính</th>
            <th>CMND/CCCD</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Địa chỉ</th>
            <th>Loại khách hàng</th>
            <th>Tùy chọn</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${customerList}" var="customer" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${customer.getName()}</td>
                <td>${customer.getBirthday()}</td>
                <td>${customer.isGender()}</td>
                <td>${customer.getIdCard()}</td>
                <td>${customer.getPhone()}</td>
                <td>${customer.getEmail()}</td>
                <td>${customer.getAddress()}</td>
                <td>${customer.getCustomerTypeId()}</td>
                <td>
                    <button onclick="deleteInfo(`${customer.getName()}`)" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Xóa
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal xoa -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customers" method="get">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" name="action" value="deleteCustomer">
                    <input hidden="hidden" id="deleteId" name="deleteId">
                    <span>Ban co muon xoa khach hang co ten la: </span><span id="deleteName"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huy</button>
                    <button type="submit" class="btn btn-primary">Xoa</button>
                </div>
            </div>
        </form>
    </div>
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

<script>
    function deleteInfo(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</body>
</html>
