<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/06/2023
  Time: 3:50 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="headerUser.jsp"/>
<p class="mt-4" style="color: red">
    ${message}
</p>
<h4
        class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
>
    Đổi mật khẩu
</h4>
<form action="/user?action=updatePassword" method="post">
    <input type="hidden" name="user_id" value="${user.id}">
    <div
            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
    >
        <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Mật khẩu cũ
                </span>
            <input type="password" name="old_user_password" placeholder="***************"
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        <p class="mt-4" style="color: red">
            ${error}
        </p>
        <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Mật khẩu mới
                </span>
            <input type="password" name="new_user_password" placeholder="***************"
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
    </div>
        <button onclick="return confirm('Are you sure to change this password?')"
                class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
        >
            Xác nhận
        </button>
    <button type="button"
            class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
    >
        <a href="user?action=userPage">Trở về</a>
    </button>
</form>
<jsp:include page="footer.jsp" />
