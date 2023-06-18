<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/6/2023
  Time: 9:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp"/>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer">
    <title>Service Manager</title>
</head>
<body>
<form action="service_manager" method="get">
    <div class="flex justify-center flex-1 lg:mr-32">
        <div
                class="relative w-full max-w-xl mr-6 focus-within:text-purple-500"
        >
            <div class="absolute inset-y-0 flex items-center pl-2">
                <svg
                        class="w-4 h-4"
                        aria-hidden="true"
                        fill="currentColor"
                        viewBox="0 0 20 20"
                >
                    <path
                            fill-rule="evenodd"
                            d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                            clip-rule="evenodd"
                    ></path>
                </svg>
            </div>
            <input
                    class="w-full pl-8 pr-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input"
                    placeholder="Search for projects"
                    aria-label="Search"
                    type="search" name="search" id="search" value="${pageable.search}" onsearch="onClearSearch()"
            />
        </div>
    </div>
    <label>
        <button style="display: none" id="searchButton" type="submit">Search</button>
    </label>
</form>

<div class="w-full overflow-x-auto">
    <table class="w-full whitespace-no-wrap">
        <thead>
        <tr
                class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
        >
            <th class="px-4 py-3">
                ID
                <c:if test="${pageable.sortBy == 'desc'}">
                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=service.service_id">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
                <c:if test="${pageable.sortBy == 'asc'}">
                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=service.service_id">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
            </th>
            <th class="px-4 py-3">
                Hotel
                <c:if test="${pageable.sortBy == 'desc'}">
                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=hotel_name">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
                <c:if test="${pageable.sortBy == 'asc'}">
                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=hotel_name">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
            </th>
            <th class="px-4 py-3">
                Transport
                <c:if test="${pageable.sortBy == 'desc'}">
                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=transport_name">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
                <c:if test="${pageable.sortBy == 'asc'}">
                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=transport_name">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
            </th>
            <th class="px-4 py-3">
                Price
                <c:if test="${pageable.sortBy == 'desc'}">
                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=total_price">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
                <c:if test="${pageable.sortBy == 'asc'}">
                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=total_price">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
            </th>
            <th class="px-4 py-3">
                Description
                <c:if test="${pageable.sortBy == 'desc'}">
                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=description">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
                <c:if test="${pageable.sortBy == 'asc'}">
                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=description">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
            </th>
            <th class="px-4 py-3">Actions</th>
        </tr>
        </thead>
        <tbody
                class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
        >
        <c:forEach items="${services}" var="service">
            <tr class="text-gray-700 dark:text-gray-400">
                <td class="px-4 py-3 text-sm">
                        ${service.getId()}
                </td>
                <td class="px-4 py-3">
                    <div class="flex items-center text-sm">
                        <!-- Avatar with inset shadow -->
                            <%--                        <div--%>
                            <%--                                class="relative hidden w-8 h-8 mr-3 rounded-full md:block"--%>
                            <%--                        >--%>
                            <%--                            <div--%>
                            <%--                                    class="absolute inset-0 rounded-full shadow-inner"--%>
                            <%--                                    aria-hidden="true"--%>
                            <%--                            ></div>--%>
                            <%--                        </div>--%>
                        <div>
                            <p class="font-semibold">${service.getHotelName().getName()}</p>
                            <p class="text-xs text-gray-600 dark:text-gray-400">
                                    ${service.getHotelName().getDescription()}
                            </p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="flex items-center text-sm">
                        <!-- Avatar with inset shadow -->
                            <%--                        <div--%>
                            <%--                                class="relative hidden w-8 h-8 mr-3 rounded-full md:block"--%>
                            <%--                        >--%>
                            <%--                            <div--%>
                            <%--                                    class="absolute inset-0 rounded-full shadow-inner"--%>
                            <%--                                    aria-hidden="true"--%>
                            <%--                            ></div>--%>
                            <%--                        </div>--%>
                        <div>
                            <p class="font-semibold">${service.getTransportName().getName()}</p>
                            <p class="text-xs text-gray-600 dark:text-gray-400">
                                    ${service.getTransportName().getDescription()}
                            </p>
                        </div>
                    </div>
                </td>

                <td class="px-4 py-3 text-xs">
                        <span
                                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                            <fmt:formatNumber type="number" value="${service.getTotalPrice()}"/> VND
                        </span>
                </td>
                <td class="px-4 py-3 text-sm">
                        ${service.getDescription()}
                </td>
                <td class="px-4 py-3">
                    <div class="flex items-center space-x-4 text-sm">
                        <a href="service_manager?action=edit&id=${service.getId()}">
                            <button
                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                    aria-label="Edit"
                            >
                                <svg
                                        class="w-5 h-5"
                                        aria-hidden="true"
                                        fill="currentColor"
                                        viewBox="0 0 20 20"
                                >
                                    <path
                                            d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"
                                    ></path>
                                </svg>
                            </button>
                        </a>

                        <a onclick="return confirm('Do you want to delete this Service?')"
                           href="service_manager?action=delete&id=${service.getId()}">
                            <button
                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                    aria-label="Delete"
                            >
                                <svg
                                        class="w-5 h-5"
                                        aria-hidden="true"
                                        fill="currentColor"
                                        viewBox="0 0 20 20"
                                >
                                    <path
                                            fill-rule="evenodd"
                                            d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                                            clip-rule="evenodd"
                                    ></path>
                                </svg>
                            </button>
                        </a>

                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
    <span class="flex items-center col-span-3">
    Showing ${pageable.totalPage}
    </span>
    <span class="col-span-2"></span>
    <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
    <nav aria-label="Table navigation">
    <ul class="inline-flex items-center">
    <c:forEach begin="1" end="${pageable.totalPage}" var="page">
                      <li>
                          <a href="service_manager?page=${page}&search=${pageable.search}&sortBy=${pageable.sortBy}&nameField=${pageable.nameField}">
                              <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
                                      ${page}
                              </button>
                          </a>
                      </li>
    </c:forEach>
    </ul>
    </nav>
    </span>

</div>

<h3><a href="service_manager?action=create">
    <button>Add Service</button>
</a></h3>
<script>
    function onClearSearch() {
        searchButton.click();
    }
    function formatNumber(number) {
        return number.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
    }
</script>
</body>

<jsp:include page="footer.jsp"/>
