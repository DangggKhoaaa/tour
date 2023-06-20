<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 13/06/2023
  Time: 8:28 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login - Windmill Dashboard</title>
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="../assets/css/tailwind.output.css"/>
    <script
            src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
            defer
    ></script>
    <script src="../assets/js/init-alpine.js"></script>
</head>
<body>
<c:if test="${requestScope['message'] != null}"  >
    <script>
        alert("${message}")
    </script>
</c:if>
<div class="flex items-center min-h-screen p-6 bg-gray-50 dark:bg-gray-900">
    <div
            class="flex-1 h-full max-w-4xl mx-auto overflow-hidden bg-white rounded-lg shadow-xl dark:bg-gray-800"
    >
        <div class="flex flex-col overflow-y-auto md:flex-row">
            <div class="h-32 md:h-auto md:w-1/2">
                <img
                        aria-hidden="true"
                        class="object-cover w-full h-full dark:hidden"
                        src="../assets/img/login-office.jpeg"
                        alt="Office"
                />
                <img
                        aria-hidden="true"
                        class="hidden object-cover w-full h-full dark:block"
                        src="../assets/img/login-office-dark.jpeg"
                        alt="Office"
                />
            </div>
            <div class="flex items-center justify-center p-6 sm:p-12 md:w-1/2">
                <div class="w-full">
                    <h1
                            class="mb-4 text-xl font-semibold text-gray-700 dark:text-gray-200"
                    >
                        Đăng nhập
                    </h1>

                    <form action="login" method="post">

                        <label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Tài khoản</span>
                            <input name="user_name"
                                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   placeholder="JaneDoe"
                            />
                            <p class="mt-4" style="color: red">
                                ${errorsUsername}
                            </p>
                        </label>
                        <label class="block mt-4 text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Mật khẩu</span>
                            <input name="user_password"
                                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   placeholder="***************"
                                   type="password"
                            />
                            <p class="mt-4" style="color: red">
                                ${errorsPassword}
                            </p>
<%--                            <span class="input-group-text cursor-pointer" id="password"  onclick="togglePassword()"><i class="bx bx-hide"></i></span>--%>
                        </label>

                        <button class="block w-full px-4 py-2 mt-4 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">Đăng nhập</button>

                    </form>

                    <hr class="my-8"/>


                    <p class="mt-1">
                        <a
                                class="text-sm font-medium text-purple-600 dark:text-purple-400 hover:underline"
                                href="/user?action=create"
                        >
                        Bạn chưa có tài khoản? Đăng ký
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    // function togglePassword() {
    //     var passwordInput = document.getElementById("password");
    //     if (passwordInput.type === "password") {
    //         passwordInput.type = "text";
    //     } else {
    //         passwordInput.type = "password";
    //     }
    // }
</script>
</html>
