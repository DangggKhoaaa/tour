<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="headerUser.jsp"/>
<%--<a href="tour_ticket?action=displayFalse"> ticket</a>--%>
<div class="w-full overflow-x-auto">
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
                            <p class="font-semibold">${tour_ticket.tour.getName()}</p>
                            <p class="text-xs text-gray-600 dark:text-gray-400">
                                    ${tour_ticket.tour.getTour_id()}
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
                            <p class="font-semibold">${tour_ticket.user.getName()}</p>
                            <p class="text-xs text-gray-600 dark:text-gray-400">
                                    <%--                                    ${tour_ticket.getTransportName().getDescription()}--%>
                            </p>
                        </div>
                    </div>
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
                        ${tour_ticket.getBuyDay()}
                </td>
                <td class="px-4 py-3 text-xs">
        <span
                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
        >
            <fmt:formatNumber type="number" value="${tour_ticket.getTotalPrice()}"/> VND
<%--                ${tour_ticket.getTotalPrice()}--%>
        </span>
                </td>
                <c:if test="${tour_ticket.isStatus().equals('false')}">
                    <td class="px-4 py-3 text-xs">
        <span
                class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700"
        >
                Unpaid
        </span>
                    </td>
                </c:if>
                <c:if test="${tour_ticket.isStatus().equals('pay')}">
                    <td class="px-4 py-3 text-xs">
        <span
                class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600"
        >
                 Processing
        </span>
                    </td>
                </c:if>
                <c:if test="${tour_ticket.isStatus().equals('true')}">
                    <td class="px-4 py-3 text-xs">
        <span
                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
        >
                Accepted
        </span>
                    </td>
                </c:if>

                <td class="px-4 py-3">
                    <div class="flex items-center space-x-4 text-sm">
                        <a onclick="return confirm('Do you want to pay this Ticket?')"
                                href="user?action=pay&tour_ticket_id=${tour_ticket.getTourTicketId()}&user_id=${user.getId()}">
                            <button
                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                    aria-label="Edit"
                            >
                                <i class="fa-solid fa-circle-check" style="color: #7d11d4;"></i>
                                    <path
                                            d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"
                                    ></path>
                                </svg>
                            </button>
                        </a>
<%--                        <a onclick="return confirm('Do you want to delete this Ticket?')"--%>
<%--                           href="user?action=deleteTourTicket&tour_ticket_id=${tour_ticket.getTourTicketId()}&user_id=${user.getId()}">--%>
<%--                            <button--%>
<%--                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"--%>
<%--                                    aria-label="Delete"--%>
<%--                            >--%>
<%--                                <svg--%>
<%--                                        class="w-5 h-5"--%>
<%--                                        aria-hidden="true"--%>
<%--                                        fill="currentColor"--%>
<%--                                        viewBox="0 0 20 20"--%>
<%--                                >--%>
<%--                                    <path--%>
<%--                                            fill-rule="evenodd"--%>
<%--                                            d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"--%>
<%--                                            clip-rule="evenodd"--%>
<%--                                    ></path>--%>
<%--                                </svg>--%>
<%--                            </button>--%>
<%--                        </a>--%>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="footer.jsp"/>
