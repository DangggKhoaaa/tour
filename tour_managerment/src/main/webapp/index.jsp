<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>
<%--<a href="tours">tour</a>--%>
<a href="login.jsp">login</a>
<%--<a href="service_manager">service</a>--%>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Create account - Windmill Dashboard</title>
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
<div class="flex items-center min-h-screen p-6 bg-gray-50 dark:bg-gray-900">
    <div
            class="flex-1 h-full max-w-4xl mx-auto overflow-hidden bg-white rounded-lg shadow-xl dark:bg-gray-800"
    >
        <div class="flex flex-col overflow-y-auto md:flex-row">
            <div class="h-32 md:h-auto md:w-1/2">
                <img
                        aria-hidden="true"
                        class="object-cover w-full h-full dark:hidden"
                        src="../assets/img/create-account-office.jpeg"
                        alt="Office"
                />
                <img
                        aria-hidden="true"
                        class="hidden object-cover w-full h-full dark:block"
                        src="../assets/img/create-account-office-dark.jpeg"
                        alt="Office"
                />
            </div>
            <div class="flex items-center justify-center p-6 sm:p-12 md:w-1/2">
                <div class="w-full">
                    <h1
                            class="mb-4 text-xl font-semibold text-gray-700 dark:text-gray-200"
                    >
                        Tạo tài khoản
                    </h1>

                    <form action="user?action=create" method="post">

                        <label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Tài khoản</span>
                            <input name="user_name"
                                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   placeholder="JaneDoe"
                            />
                        </label>
                        <label class="block mt-4 text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Mật khẩu</span>
                            <input name="user_password"
                                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   placeholder="***************"
                                   type="password"
                            />
                        </label>

                        <hr class="my-8"/>

                        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Họ và tên
                </span>
                            <input name="full_name"
                                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   placeholder="Jane Doe"
                                   type="text"
                            />
                        </label>

                        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Ngày sinh
                </span>
                            <input name="dob"
                                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"

                                   type="date"
                            />
                        </label>

                        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Giới tính
                </span>
                            <select name="gender"
                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input">
                                <option>--None--</option>
                                <option>Nam</option>
                                <option>Nữ</option>
                                <option>LGBT</option>
<%--                                <c:forEach items="${genders}" var="gender">--%>
<%--                                    <option value="${gender}">${gender}</option>--%>
<%--                                </c:forEach>--%>
                            </select>
                            <%--                        <input name="full_name"--%>
                            <%--                               class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"--%>
                            <%--                               placeholder="Nguyễn Văn A"--%>
                            <%--                               type="text"--%>
                            <%--                        />--%>
                        </label>

                        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Số điện thoại
                </span>
                            <input name="phone"
                                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   placeholder="Số điện thoại gồm 10 chữ số"
                                   type="text"
                            />
                        </label>

                        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Email
                </span>
                            <input name="email"
                                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   placeholder="JaneDoe@gmail.com"
                                   type="email"
                            />
                        </label>

                        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Địa chỉ
                </span>
                            <input name="address"
                                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   placeholder="America"
                                   type="text"
                            />
                        </label>

                        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Căn cước công dân
                </span>
                            <input name="cccd"
                                   class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   placeholder="CCCD gồm 12 chữ số"
                                   type="text"
                            />
                        </label>

                        <%--                    <div class="flex mt-6 text-sm">--%>
                        <%--                        <label class="flex items-center dark:text-gray-400">--%>
                        <%--                            <input--%>
                        <%--                                    type="checkbox"--%>
                        <%--                                    class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"--%>
                        <%--                            />--%>
                        <%--                            <span class="ml-2">--%>
                        <%--                    I agree to the--%>
                        <%--                    <span class="underline">privacy policy</span>--%>
                        <%--                  </span>--%>
                        <%--                        </label>--%>
                        <%--                    </div>--%>

                        <!-- You should use a button here, as the anchor is only used for the example  -->
                        <a
                                class="block w-full px-4 py-2 mt-4 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                        >
                        <button>Tạo tài khoản</button>
                        </a>

                    </form>

                    <hr class="my-8"/>


                    <p class="mt-4">
                        <a
                                class="text-sm font-medium text-purple-600 dark:text-purple-400 hover:underline"
                                href="login.jsp"
                        >
                            Bạn đã có tài khoản? Đăng nhập
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<jsp:include page="footer.jsp"/>