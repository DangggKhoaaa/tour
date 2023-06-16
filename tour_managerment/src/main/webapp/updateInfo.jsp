<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/06/2023
  Time: 3:51 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<h2
        class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
>
    Đổi thông tin cá nhân
</h2>
<form action="/user?action=updateInfo" method="post">
    <input type="hidden" name="user_id" value="${user.id}">

    <div
            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
    >
        <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Họ và tên
                </span>
            <input type="text" name="full_name" value="${user.name}"
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Ngày sinh
                </span>
            <input type="date" name="dob" value="${user.dob}"
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Giới tính
                </span>
                <select name="gender" value="${user.gender}" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input">
                    <c:forEach items="${genders}" var="gender">
                        <c:if test="${gender == user.gender}">
                            <option selected value="${gender}">${gender}</option>
                        </c:if>
                        <c:if test="${gender != user.gender}">
                            <option value="${gender}">${gender}</option>
                        </c:if>
                    </c:forEach>
                </select>
        </label>
        <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Số điện thoại
                </span>
            <input type="text" name="phone" value="${user.phone}"
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Email
                </span>
            <input type="email" name="email" value="${user.email}"
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Địa chỉ
                </span>
            <input type="text" name="address" value="${user.address}"
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Căn cước công dân
                </span>
            <input type="text" name="cccd" value="${user.cccd}"
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
    </div>
    <button
            class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
    >
        Xác nhận
    </button>
    <button
            class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
    >
        <a href="information.jsp">Trở về</a>
    </button>
</form>
<jsp:include page="footer.jsp" />
