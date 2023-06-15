<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/6/2023
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>

<head>
    <title>Create Service</title>
</head>
<body>
<h4
        class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
>
    Create Service
</h4>


<form action="service_manager?action=create" method="post">

    <div
            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
    >

        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Hotel
                </span>
            <select
                    name="hotel" class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
            >
                <c:forEach items="${requestScope.hotels}" var="hotel">
                    <c:if test="${service.getHotelName().id != hotel.id}">
                        <option value="${hotel.id}">${hotel.name} - ${hotel.price} đ - ${hotel.description}</option>
                    </c:if>
                    <c:if test="${service.getHotelName().id == hotel.id}">
                        <option selected value="${hotel.id}">${hotel.name} - ${hotel.price} đ - ${hotel.description}</option>
                    </c:if>
                </c:forEach>
            </select>
        </label>

        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Transport
                </span>
            <select

                    name="transport" class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-multiselect focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                    multiple
            >
                <c:forEach items="${requestScope.transports}" var="transport">
                    <c:if test="${service.getTransportName().id != transport.id}">
                        <option value="${transport.id}">${transport.name} - ${transport.price} đ - ${transport.description}</option>
                    </c:if>
                    <c:if test="${service.getTransportName().id == transport.id}">
                        <option selected value="${transport.id}">${transport.name} - ${transport.price} đ - ${transport.description}</option>
                    </c:if>
                </c:forEach>
            </select>
        </label>

        <div class="flex mt-6 text-sm">
            <label class="flex items-center dark:text-gray-400">
                <input onclick="document.getElementById('btn').style.display = 'block'"
                       type="checkbox"
                       class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                />
                <span class="ml-2">
                    I agree to the
                    <span class="underline">privacy policy</span>
                  </span>
            </label>
        </div>
        <button style="display: none" id="btn" type="submit">Create</button>

    </div>

</form>

<c:if test="${requestScope['message'] != null}">
    <h1>${message}</h1>
</c:if>
<c:if test="${requestScope['totalPrice'] != null}">
    <h1>Total Price: ${totalPrice} đ</h1>
</c:if>
<a href="service_manager"><button>Back</button></a>

</body>
<jsp:include page="footer.jsp"/>
