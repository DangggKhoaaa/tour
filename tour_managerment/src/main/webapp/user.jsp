<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/06/2023
  Time: 2:40 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>${message}</h1>
<h3>Xin chào ${user.name}!</h3>
<a href="/user?action=updatePassword&id=${user.id}">Đổi mật khẩu</a>
<br>
<a href="/user?action=updateInfo&id=${user.id}">Đổi thông tin cá nhân</a>
<br>
<a href="login.jsp">Đăng xuất</a>
</body>
</html>

