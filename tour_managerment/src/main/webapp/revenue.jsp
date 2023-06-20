<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 19/6/2023
  Time: 9:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp"/>

<%--<a href="tour_ticket?action=displayFalse"> ticket</a>--%>
<div class="w-full overflow-x-auto">
    <div
            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
    >
        <form action="tour_ticket?action=revenue" method="post">
            <label for="month" class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">Input Month</span>
                <input
                        type="number" name="month" id="month" value="${month}"
                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        placeholder="Input Price"
                />
            </label>
            <label for="year" class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">Input Year</span>
                <input
                        type="number" name="year" id="year" value="${year}"
                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        placeholder="Input Price"
                />
            </label>

<%--             <input type="number" name="month" id="month">--%>
<%--            nhập năm <input type="number" name="year" id="year">--%>
            <button
                    class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
            >
                <a>Search</a>
            </button>
<%--            <button type="submit">tìm kiếm</button>--%>
        </form>
    </div>

    <table class="w-full whitespace-no-wrap">
        <%--        <td>${tourTicket.tour.getName()}</td>--%>

        <thead>
        <tr
                class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
        >
            <th class="px-4 py-3">
                ID TICKET
                <c:if test="${pageable.sortBy == 'desc'}">
                    <a href="tour_ticket?action=revenue&page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=tour_ticket_id">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
                <c:if test="${pageable.sortBy == 'asc'}">
                    <a href="tour_ticket?action=revenue&page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=tour_ticket_id">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
            </th>
            <th class="px-4 py-3">
                TOUR NAME
                <%--                <c:if test="${pageable.sortBy == 'desc'}">--%>
                <%--                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=hotel_name">--%>
                <%--                        <i class="fa-solid fa-sort"></i>--%>
                <%--                    </a>--%>
                <%--                </c:if>--%>
                <%--                <c:if test="${pageable.sortBy == 'asc'}">--%>
                <%--                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=hotel_name">--%>
                <%--                        <i class="fa-solid fa-sort"></i>--%>
                <%--                    </a>--%>
                <%--                </c:if>--%>
            </th>
            <th class="px-4 py-3">
                CUSTOMER NAME
                <%--                <c:if test="${pageable.sortBy == 'desc'}">--%>
                <%--                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=transport_name">--%>
                <%--                        <i class="fa-solid fa-sort"></i>--%>
                <%--                    </a>--%>
                <%--                </c:if>--%>
                <%--                <c:if test="${pageable.sortBy == 'asc'}">--%>
                <%--                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=transport_name">--%>
                <%--                        <i class="fa-solid fa-sort"></i>--%>
                <%--                    </a>--%>
                <%--                </c:if>--%>
            </th>
            <th class="px-4 py-3">
                HOTEL - TRANSPORT
                <%--                <c:if test="${pageable.sortBy == 'desc'}">--%>
                <%--                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=total_price">--%>
                <%--                        <i class="fa-solid fa-sort"></i>--%>
                <%--                    </a>--%>
                <%--                </c:if>--%>
                <%--                <c:if test="${pageable.sortBy == 'asc'}">--%>
                <%--                    <a href="service_manager?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=total_price">--%>
                <%--                        <i class="fa-solid fa-sort"></i>--%>
                <%--                    </a>--%>
                <%--                </c:if>--%>
            </th>
            <th class="px-4 py-3">
                QUANTITY
                <c:if test="${pageable.sortBy == 'desc'}">
                    <a href="tour_ticket?action=revenue&page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=quantity">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
                <c:if test="${pageable.sortBy == 'asc'}">
                    <a href="tour_ticket?action=revenue&page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=quantity">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
            </th>
            <th class="px-4 py-3">
                TOTAL PRICE
                <c:if test="${pageable.sortBy == 'desc'}">
                    <a href="tour_ticket?action=revenue&page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=total_price">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
                <c:if test="${pageable.sortBy == 'asc'}">
                    <a href="tour_ticket?action=revenue&page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=total_price">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
            </th>
            <th class="px-4 py-3">
                ORDER DAY
                <c:if test="${pageable.sortBy == 'desc'}">
                    <a href="tour_ticket?action=revenue&page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=buyDate">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
                <c:if test="${pageable.sortBy == 'asc'}">
                    <a href="tour_ticket?action=revenue&page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=buyDate">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
            </th>
            <th class="px-4 py-3">
                PAY DAY
                <c:if test="${pageable.sortBy == 'desc'}">
                    <a href="tour_ticket?action=revenue&page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=payDate">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
                <c:if test="${pageable.sortBy == 'asc'}">
                    <a href="tour_ticket?action=revenue&page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=payDate">
                        <i class="fa-solid fa-sort"></i>
                    </a>
                </c:if>
            </th>

        </tr>
        </thead>
        <tbody
                class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
        >
        <c:forEach items="${tourTickets}" var="tour_ticket">
            <tr class="text-gray-700 dark:text-gray-400">
                <td class="px-4 py-3 text-sm">
                        ${tour_ticket.getTourTicketId()}
                </td>
                <td class="px-4 py-3">
                    <div class="flex items-center text-sm">

                        <div>
                            <p class="font-semibold">${tour_ticket.tour.getName()}</p>
                            <p class="text-xs text-gray-600 dark:text-gray-400">
                                <input type="hidden" name="tour_id" value="${tour_ticket.tour.getTour_id()}">
                                    ${tour_ticket.tour.getTour_id()}
                            </p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="flex items-center text-sm">

                        <div>
                            <input type="hidden" name="user_id" value="${tour_ticket.user.getId()}">
                            <p class="font-semibold">${tour_ticket.user.getName()}</p>
                            <p class="text-xs text-gray-600 dark:text-gray-400">
                            </p>
                        </div>
                    </div>
                </td>
                <td class="px-4 py-3">
                    <div class="flex items-center text-sm">

                        <div>
                            <p class="font-semibold">${tour_ticket.getServiceModel().getHotelName().getName()}
                                - ${tour_ticket.getServiceModel().getTransportName().getName()}</p>
                            <p class="text-xs text-gray-600 dark:text-gray-400">

                            </p>
                        </div>
                    </div>
                </td>
                <td class="px-4 py-3 text-xs">
                        <span
                                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                                ${tour_ticket.getQuantity()}
                        </span>
                </td>
                <td class="px-4 py-3 text-xs">
                        <span
                                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                                <fmt:formatNumber type="number" value="${tour_ticket.getTotalPrice()}"/> VND
                        </span>
                </td>
                <td class="px-4 py-3 text-xs">
                        <span
                                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                                ${tour_ticket.getBuyDay()}
                        </span>
                </td>

                <c:if test="${tour_ticket.getPayDay()!= null}">
                    <td class="px-4 py-3 text-xs">
                        <span
                                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                                ${tour_ticket.getPayDay()}
                        </span>
                    </td>
                </c:if>
                <c:if test="${tour_ticket.getPayDay()== null}">
                    <td class="px-4 py-3 text-xs">
                        <span
                                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                                -----------
                        </span>
                    </td>

                </c:if>
                    <%--                <c:if test="${tour_ticket.isStatus().equals('pay')}">--%>
                    <%--                    <td class="px-4 py-3 text-xs">--%>
                    <%--        <span--%>
                    <%--                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"--%>
                    <%--        >--%>
                    <%--                đã thanh toán--%>
                    <%--        </span>--%>
                    <%--                    </td>--%>
                    <%--                </c:if>--%>
                    <%--                <c:if test="${tour_ticket.isStatus().equals('false')}">--%>
                    <%--                    <td class="px-4 py-3 text-xs">--%>
                    <%--        <span--%>
                    <%--                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"--%>
                    <%--        >--%>
                    <%--                chưa thanh toán--%>
                    <%--        </span>--%>
                    <%--                    </td>--%>
                    <%--                </c:if>--%>

                    <%--                <td class="px-4 py-3">--%>
                    <%--                    <div class="flex items-center space-x-4 text-sm">--%>
                    <%--                        <a href="tour_ticket?action=accept&tour_ticket_id=${tour_ticket.getTourTicketId()}">--%>
                    <%--                            <button--%>
                    <%--                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"--%>
                    <%--                                    aria-label="Edit"--%>
                    <%--                            >--%>
                    <%--                                <i class="fa-solid fa-check"></i>--%>
                    <%--                                <path--%>
                    <%--                                        d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"--%>
                    <%--                                ></path>--%>
                    <%--                                </svg>--%>
                    <%--                            </button>--%>
                    <%--                        </a>--%>

                    <%--                    </div>--%>
                    <%--                </td>--%>
            </tr>
        </c:forEach>
        <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
        >
            <div
                    class="p-3 mr-4 text-green-500 bg-green-100 rounded-full dark:text-green-100 dark:bg-green-500"
            >
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
                            fill-rule="evenodd"
                            d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z"
                            clip-rule="evenodd"
                    ></path>
                </svg>
            </div>
            <div>
                <p
                        class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                >
                    Account balance
                </p>
                <p
                        class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                >
                    <fmt:formatNumber type="number" value="${doanhThu}"/> VND
                </p>
            </div>
        </div>
<%--        &lt;%&ndash;        <td>Tổng doanh thu:</td>&ndash;%&gt;--%>

<%--        &lt;%&ndash;        <td></td>&ndash;%&gt;--%>
<%--        <ul class="pagination">--%>
<%--            &lt;%&ndash;                                <li class="disabled"><a href="#">&laquo;</a></li>&ndash;%&gt;--%>

<%--            <c:forEach begin="1" end="${pageable.totalPage}" var="page">--%>
<%--                <li class="active"><a href="tour_ticket?action=revenue&page=${page}&search=${pageable.search}">${page}</a></li>--%>
<%--            </c:forEach>--%>
<%--            &lt;%&ndash;                                <li><a href="#">&raquo;</a></li>&ndash;%&gt;--%>
<%--        </ul>--%>
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
                          <a href="tour_ticket?action=revenue&page=${page}&search=${pageable.search}">
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

<jsp:include page="footer.jsp"/>