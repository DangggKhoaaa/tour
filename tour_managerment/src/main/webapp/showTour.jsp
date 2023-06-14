<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14/6/2023
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

<form action="tours" method="get">
    <input type="search" name="search" id="search" value="${pageable.search}" onsearch="onClearSearch()" />
    <button id="searchButton">Search</button>
</form>
<a href="tours?action=create">Create Book</a>
<div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
    <div class="w-full overflow-x-auto">
        <table class="w-full whitespace-no-wrap">
            <thead>
            <tr
                    class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
            >
                <th class="px-4 py-3">Tour name</th>
                <th class="px-4 py-3">Price</th>
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
                                10x Developer
                            </p>
                        </div>
                    </div>
                </td>
                <td class="px-4 py-3 text-sm">
                    ${tour.price}
                </td>
                <td class="px-4 py-3 text-xs">
                        <span
                                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                          ${tour.start_time}
                        </span>
                </td>
                <td class="px-4 py-3 text-sm">
                   ${tour.description}
                </td>
                <td class="px-4 py-3 text-sm">
                    ${tour.tour_tag}
                </td>
                <td>
                    <a href="tours?action=edit&id=${tour.tour_id}"><i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="tours?action=delete&id=${tour.tour_id}" onclick="return confirm('Do you want to remove ${book.name}?')"> <i class="fa-sharp fa-solid fa-trash"></i></a>
                </td>
            </tr>
        </c:forEach>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>
        <c:forEach begin="1" end="${pageable.totalPage}" var="page">
            <a href="tours?page=${page}&search=${pageable.search}"><button>${page}</button></a>
        </c:forEach>
        </td>
</tbody>


<jsp:include page="footer.jsp" />