<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 19/6/2023
  Time: 9:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>

<a href="tour_ticket?action=displayFalse"> ticket</a>
<div class="w-full overflow-x-auto">
    <form action="tour_ticket?action=revenue" method="post">
      nhập tháng  <input type="number" name="month" id="month">
      nhập năm    <input type="number" name="year" id="year">
        <button type="submit">tìm kiếm</button>
    </form>
    <table class="w-full whitespace-no-wrap">
        <td>${tourTicket.tour.getName()}</td>

        <thead>
        <tr
                class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
        >
            <th class="px-4 py-3">
                ID TICKET
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
                TOUR NAME
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
                CUSTOMER NAME
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
                HOTEL - TRANSPORT
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
                QUANTITY
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
            <th class="px-4 py-3">
                TOTAL PRICE
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
            <th class="px-4 py-3">
                ORDER DAY
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
            <th class="px-4 py-3">
                PAY DAY
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
            <th class="px-4 py-3">
                STATUS
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
            <th class="px-4 py-3">NOTE</th>
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
                                    ${tour_ticket.tour.getTour_id()}
                            </p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="flex items-center text-sm">

                        <div>
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
                <td class="px-4 py-3 text-sm">
                        ${tour_ticket.getQuantity()}
                </td>
                <td class="px-4 py-3 text-sm">
                        ${tour_ticket.getTotalPrice()}
                </td>
                <td class="px-4 py-3 text-sm">
                        ${tour_ticket.getBuyDay()}
                </td>
                <c:if test="${tour_ticket.getPayDay()!= null}">
                    <td>${tour_ticket.getPayDay()}</td>
                </c:if>
                <c:if test="${tour_ticket.getPayDay()== null}">
                    <td>----------- </td>
                </c:if>
                <c:if test="${tour_ticket.isStatus().equals('pay')}">
                    <td class="px-4 py-3 text-xs">
        <span
                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
        >
                đã thanh toán
        </span>
                    </td>
                </c:if>
                <c:if test="${tour_ticket.isStatus().equals('false')}">
                    <td class="px-4 py-3 text-xs">
        <span
                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
        >
                chưa thanh toán
        </span>
                    </td>
                </c:if>

                <td class="px-4 py-3">
                    <div class="flex items-center space-x-4 text-sm">
                        <a href="tour_ticket?action=accept&tour_ticket_id=${tour_ticket.getTourTicketId()}">
                            <button
                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                    aria-label="Edit"
                            >
                                <i class="fa-solid fa-check"></i>
                                <path
                                        d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"
                                ></path>
                                </svg>
                            </button>
                        </a>

                    </div>
                </td>
            </tr>
        </c:forEach>
        <td>Tổng doanh thu:</td>
        <td>${doanhThu}</td>
        </tbody>
    </table>
</div>



<jsp:include page="footer.jsp"/>