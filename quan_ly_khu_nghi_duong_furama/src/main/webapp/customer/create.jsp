<%@ page import="model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: Nitro V
  Date: 3/27/2025
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm khách hàng</title>
    <c:import url="../layout/library.jsp"/>
</head>
<body>
<c:import url="../layout/header.jsp"/>
<div class="container mt-4">
    <h2 class="text-center">Thêm mới Khách hàng</h2>
    <form action="customers?action=create" method="post">

        <!-- Loại khách hàng -->
        <div class="mb-3">
            <label class="form-label">Loại khách hàng</label>
                        <input type="text" class="form-control" name="customerTypeId">
<%--            <select name="customerTypeId" class="form-control" required>--%>
<%--                <option value="">-- Chọn loại khách hàng --</option>--%>
<%--                <c:forEach var="type" items="${customers}">--%>
<%--                    <option value="${type.id}">${type.name}</option>--%>
<%--                </c:forEach>--%>
<%--            </select>--%>
        </div>

        <!-- Tên khách hàng -->
        <div class="mb-3">
            <label class="form-label">Họ và Tên</label>
            <input type="text" class="form-control" name="name" required>
        </div>

        <!-- Ngày sinh -->
        <div class="mb-3">
            <label class="form-label">Ngày sinh</label>
            <input type="date" class="form-control" name="birthday" required>
        </div>

        <!-- Giới tính -->
        <div class="mb-3">
            <label class="form-label">Giới tính</label><br>
            <input type="radio" name="gender" value="true" checked> Nam
            <input type="radio" name="gender" value="false"> Nữ
        </div>

        <!-- CMND/CCCD -->
        <div class="mb-3">
            <label class="form-label">CMND/CCCD</label>
            <input type="text" class="form-control" name="idCard" required>
        </div>

        <!-- Số điện thoại -->
        <div class="mb-3">
            <label class="form-label">Số điện thoại</label>
            <input type="text" class="form-control" name="phone" required>
        </div>

        <!-- Email -->
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email">
        </div>

        <!-- Địa chỉ -->
        <div class="mb-3">
            <label class="form-label">Địa chỉ</label>
            <input type="text" class="form-control" name="address">
        </div>

<%--        <!-- Loại khách hàng -->--%>
<%--        <div class="mb-3">--%>
<%--            <label class="form-label">Loại khách hàng</label>--%>
<%--&lt;%&ndash;            <input type="text" class="form-control" name="customerTypeId">&ndash;%&gt;--%>
<%--            <select name="customerTypeId" class="form-control" required>--%>
<%--                <option value="">-- Chọn loại khách hàng --</option>--%>
<%--                <c:forEach var="type" items="${customers}">--%>
<%--                    <option value="${type.id}">${type.name}</option>--%>
<%--                </c:forEach>--%>
<%--            </select>--%>
<%--        </div>--%>

        <!-- Nút Submit -->
        <button type="submit" class="btn btn-primary">Lưu</button>
        <a href="customers" class="btn btn-secondary">Hủy</a>
    </form>
</div>
</body>
</html>
