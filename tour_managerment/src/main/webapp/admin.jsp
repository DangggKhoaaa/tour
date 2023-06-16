<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/06/2023
  Time: 11:10 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<body>

<form id="form_search" action="/admin?action=showUser" method="post">
    <%--    <label for="search">Tìm Kiếm</label>--%>
    <%--    <input type="search" name="search" id="search" value="${pageable.search}" onsearch="onClearSearch()">--%>
    <%--    <button id="searchBtn">Search</button>--%>
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
            <input name="search" value="${pageable.search}" onsearch="onClearSearch()"
                   class="w-full pl-8 pr-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input"
                   type="search"
                   placeholder="Search for projects"
                   aria-label="Search"
            />
            <button style="display: none" type="submit" id="searchBtn">Search</button>
        </div>
    </div>
</form>
<h3>${message}</h3>
<c:if test="${requestScope['users'].size() != 0}">
<form action="/admin?action=showUser" method="post">
    <input type="hidden" name="user_id" value="${user.id}">
    <div class="w-full overflow-hidden rounded-lg shadow-xs">
        <div class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
                <thead>
                <tr
                        class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                >
                    <th class="px-4 py-3">Tài khoản</th>
                    <th class="px-4 py-3">Khách hàng</th>
                    <th class="px-4 py-3">Ngày sinh</th>
                    <th class="px-4 py-3">Giới tính</th>
                    <th class="px-4 py-3">Số điện thoại</th>
                    <th class="px-4 py-3">Email</th>
                    <th class="px-4 py-3">Địa chỉ</th>
                    <th class="px-4 py-3">Căn cước công dân</th>
                    <th class="px-4 py-3">Vai trò</th>
                </tr>
                </thead>
                <tbody
                        class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                >
                <c:forEach items="${users}" var="user">
                    <tr class="text-gray-700 dark:text-gray-400">
                        <td class="px-4 py-3">
                            <div class="flex items-center text-sm">
                                <!-- Avatar with inset shadow -->
                                <div
                                        class="relative hidden w-8 h-8 mr-3 rounded-full md:block"
                                >
                                    <img
                                            class="object-cover w-8 h-8 rounded-full"
                                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBZDa-lRYinVJyungmPN-xWhHKF6b108TBaVlA8I8&s"
                                            alt="avatar"
                                            aria-hidden="true"
                                    />
                                    <div
                                            class="absolute inset-0 rounded-full shadow-inner"
                                            aria-hidden="true"
                                    ></div>
                                </div>
                                <div>
                                    <p class="font-semibold">${user.userName}</p>
                                </div>
                            </div>
                        </td>
                        <td class="px-4 py-3 text-sm">
                                ${user.name}
                        </td>
                        <td class="px-4 py-3 text-sm">
                                ${user.dob}
                        </td>
                        <td class="px-4 py-3 text-xs">
                                ${user.gender}
                        </td>
                        <td class="px-4 py-3 text-sm">
                                ${user.phone}
                        </td>
                        <td class="px-4 py-3 text-sm">
                                ${user.email}
                        </td>
                        <td class="px-4 py-3 text-sm">
                                ${user.address}
                        </td>
                        <td class="px-4 py-3 text-sm">
                                ${user.cccd}
                        </td>
                        <td class="px-4 py-3 text-sm">
                                ${user.role}
                        </td>
                        <td>
                                <%--                                <a href="tours?action=edit&id=${tour.tour_id}"><i class="fa-solid fa-pen-to-square"></i></a>--%>
                            <a href="/admin?action=delete&id=${user.id}"
                               onclick="return confirm('Do you want to remove ${user.userName}?')"> <i
                                    class="fa-sharp fa-solid fa-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div
                class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
        >
            <span class="col-span-2"></span>
            <!-- Pagination -->
            <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                  <nav aria-label="Table navigation">
                          <ul class="inline-flex items-center">

                    <li>
                <button
                        class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
                        aria-label="Previous"
                >
                          <svg
                                  aria-hidden="true"
                                  class="w-4 h-4 fill-current"
                                  viewBox="0 0 20 20"
                          >
                            <path
                                    d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                                    clip-rule="evenodd"
                                    fill-rule="evenodd"
                            ></path>
                          </svg>
                        </button>
                        </li>
                              <c:forEach begin="1" end="${pageable.totalPage}" var="page">
                        <li>
                        <button
                                class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          <a href="admin?action=showUser&page=${page}&search=${pageable.search}">${page}</a>
                        </button>
                      </li>
                              </c:forEach>
                      <li>
                        <button
                                class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
                                aria-label="Next"
                        >
                          <svg
                                  class="w-4 h-4 fill-current"
                                  aria-hidden="true"
                                  viewBox="0 0 20 20"
                          >
                            <path
                                    d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                    clip-rule="evenodd"
                                    fill-rule="evenodd"
                            ></path>
                          </svg>
                        </button>
                      </li>

    </ul>
                  </nav>
                </span>
        </div>
    </div>
</form>
    <%--    <ul>--%>
    <%--        <c:forEach begin="1" end="${pageable.totalPage}" var="page">--%>
    <%--            <li><a href="admin?page=${page}&search=${pageable.search}">${page}</a></li>--%>
    <%--        </c:forEach>--%>

    <%--    </ul>--%>
</c:if>
<script>
    function onClearSearch() {
        searchBtn.click();
    }

</script>
<jsp:include page="footer.jsp"/>
