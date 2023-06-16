<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 15/06/2023
  Time: 1:52 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>

<h2
        class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
>
    Thông tin cá nhân
</h2>
<form action="/user?action=showInformation" method="post">
    <div
            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
    >

        <input type="hidden" name="user_id" value="${user.id}">
        <label class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Họ và tên</span>
            <input name="full_name" value="${user.name}" type="text" readonly
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        <label class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Ngày sinh</span>
            <input name="dob" value="${user.dob}" type="date" readonly
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        </label>
        <label class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Giới tính</span>
            <input name="gender" value="${user.gender}" type="text" readonly
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        <label class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Số điện thoại</span>
            <input name="phone" value="${user.phone}" type="text" readonly
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        <label class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Email</span>
            <input name="email" value="${user.email}" type="email" readonly
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        <label class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Địa chỉ</span>
            <input name="address" value="${user.address}" type="text" readonly
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>
        <label class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Căn cước công dân</span>
            <input name="cccd" value="${user.cccd}" type="text" readonly
                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>

    </div>
    <button
            class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
    >
        <a href="/user?action=updateInfo&id=${user.id}">Đổi thông tin cá nhân</a>
    </button>

    <button
            class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
    >
        <a href="user.jsp">Trở về</a>
    </button>
</form>
<jsp:include page="footer.jsp"/>
