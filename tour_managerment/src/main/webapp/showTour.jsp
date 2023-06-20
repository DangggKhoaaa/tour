<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14/6/2023
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp"/>
<style>
    .description {

        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3; /* Limit to three lines */
        -webkit-box-orient: vertical;
        max-width: 400px;
        max-height: 77px;
    }
</style>
<form action="tours" method="get">
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
<%--<td>--%>
<%--    <c:if test="${pageable.sortBy== 'desc'}">--%>
<%--        <a href="tours?page=${pageable.page}&search=${pageable.search}&sortby=asc&fieldName=t1.price">--%>
<%--            <button> sắp xếp theo giá</button>--%>
<%--        </a>--%>
<%--    </c:if>--%>
<%--    <c:if test="${pageable.sortBy== 'asc'}">--%>
<%--        <a href="tours?page=${pageable.page}&search=${pageable.search}&sortby=desc&fieldName=t1.price">--%>
<%--            <button> sắp xếp theo giá</button>--%>
<%--        </a>--%>
<%--    </c:if>--%>
<%--</td>--%>

<div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
    <div class="w-full overflow-x-auto">
        <table class="w-full ">
            <thead>
            <tr
                    class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
            >
                <th class="px-4 py-3">Tour name</th>
                <th class="px-4 py-3">
                    Price
                    <c:if test="${pageable.sortBy == 'desc'}">
                        <a href="tours?page=${pageable.page}&search=${pageable.search}&sortby=asc&fieldName=t1.price">
                            <i class="fa-solid fa-sort"></i>
                        </a>
                    </c:if>
                    <c:if test="${pageable.sortBy == 'asc'}">
                        <a href="tours?page=${pageable.page}&search=${pageable.search}&sortby=desc&fieldName=t1.price">
                            <i class="fa-solid fa-sort"></i>
                        </a>
                    </c:if>
                </th>

                <th class="px-4 py-3">Departure day</th>
                <th class="px-4 py-3">Description</th>
                <th class="px-4 py-3">Tags</th>
            </tr>
            </thead>
            <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
            >
            <c:forEach items="${tours}" var="tour">
                <tr class="text-gray-700 dark:text-gray-400">
                    <td class="px-4 py-3">
                        <div class="flex items-center text-sm">
                            <!-- Avatar with inset shadow -->
                            <div
                                    class="relative hidden w-8 h-8 mr-3 rounded-full md:block"
                            >
                                <img
                                        class="object-cover w-full h-full rounded-full"
                                        src="${tour.img}"
                                        alt=""
                                        loading="lazy"
                                />
                                <div
                                        class="absolute inset-0 rounded-full shadow-inner"
                                        aria-hidden="true"
                                ></div>
                            </div>
                            <div>
                                <p class="font-semibold">${tour.name}</p>
                                <p class="text-xs text-gray-600 dark:text-gray-400">
                                        ${tour.getTour_id()}
                                </p>
                            </div>
                        </div>
                    </td>
                    <td class="px-4 py-3 text-xs">
                        <span
                                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                                <fmt:formatNumber type="number" value="${tour.price}"/> VND
                        </span>
                    </td>
                    <td class="px-4 py-3 text-xs">
                        <span
                                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                                ${tour.start_time}
                        </span>
                    </td>
                    <td class="description px-4 py-3 text-sm">
                            ${tour.description}
                    </td>
                    <td class="px-4 py-3 text-sm">
                            ${tour.tour_tag}
                    </td>
                    <td>
                        <a href="tours?action=edit&id=${tour.tour_id}"><i class="fa-solid fa-pen-to-square"></i></a>
<%--                        <a href="tours?action=delete&id=${tour.tour_id}"--%>
<%--                           onclick="return confirm('Do you want to remove ${tour.name}?')"> <i--%>
<%--                                class="fa-sharp fa-solid fa-trash"></i></a>--%>
                    </td>
                </tr>
            </c:forEach>
            <%--            <td>--%>
            <%--                <c:forEach begin="1" end="${pageable.totalPage}" var="page">--%>
            <%--                    <a href="tours?page=${page}&search=${pageable.search}">--%>
            <%--                        <button>${page}</button>--%>
            <%--                    </a>--%>
            <%--                </c:forEach>--%>
            <%--            </td>--%>
            </tbody>
        </table>

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
                          <a href="tours?page=${page}&search=${pageable.search}&sortby=${pageable.sortBy}&fieldName=${pageable.nameField}">
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
        <button
                class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
        >
            <a href="tours?action=create">Create Tour</a>
        </button>
    </div>
</div>
<script>
    <c:if test="${message != null}">
    alert("${message}")
    </c:if>

    function onClearSearch() {
        searchButton.click();
    }
</script>

<jsp:include page="footer.jsp"/>