<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12/6/2023
  Time: 10:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>

<head>
    <title>Create Tour</title>
</head>
<body>
<h4
        class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
>
    Create Tour
</h4>

<%--<a href="tours">Back</a>--%>
<div
        class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
>
    <form action="tours?action=create" method="post">
        <label for="name" class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Name</span>
            <input
                    type="text" name="name" id="name" value="${tour.name}"
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    placeholder="Name Tour"
            />
            <p class="mt" style="color: red">
                ${messageTourName}
            </p>
        </label>
        <label for="price" class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Price</span>
            <input
                    type="number" name="price" id="price" value="${tour.price}"
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    placeholder="Input Price"
            />
            <p class="mt" style="color: red">
                ${messagePrice}
            </p>
        </label>
        <label for="start_time" class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Start Time</span>
            <input
                    type="date" name="start_time" id="start_time" value="${tour.start_time}"
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    placeholder="Jane Doe"
            />
        </label>
        <label for="end_time" class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">End Time</span>
            <input
                    type="date" name="end_time" id="end_time" value="${tour.end_time}"
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    placeholder="Jane Doe"
            />
        </label>
        <label for="img" class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Image</span>
            <input
                    type="text" name="img" id="img" value="${tour.img}"
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
        </label>

        <label for="description" class="block mt-4 text-sm">
            <span class="text-gray-700 dark:text-gray-400">Description</span>
            <textarea
                    name="description" id="description"
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                    rows="3"
                    placeholder="Enter some long form description."
            >${tour.description}</textarea>
        </label>

        <c:forEach items="${tagList}" var="tag">
        <div class="flex mt-6 text-sm">
            <label class="flex items-center dark:text-gray-400">
                    <input
                            type="checkbox"
                            name='myCheckbox' value='${tag.tag_id}'
                            class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                    />
                    <span class="ml-2">
                            ${tag.name}
                    </span>
            </label>
        </div>
        </c:forEach>
        <button
                onclick="return confirm('Are you sure to create this Tour?')"
                class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
        >
            <a>Create Tour</a>
        </button>
        <button type="button"
                class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
        >
            <a href="tours">Back</a>
        </button>
    </form>

</div>
<%--    <label for="name">Name</label>--%>
<%--    <input type="text" name="name" id="name" value="${tour.name}"/> </br>--%>
<%--    <label for="price">price</label>--%>
<%--    <input type="number" name="price" id="price" value="${tour.price}"/></br>--%>
<%--    <label for="start_time">start_time</label>--%>
<%--    <input type="date" name="start_time" id="start_time" value="${tour.start_time}"/></br>--%>
<%--    <label for="end_time">end_time</label>--%>
<%--    <input type="date" name="end_time" id="end_time" value="${tour.end_time}"/></br>--%>
<%--    <label for="img">img</label>--%>
<%--    <input type="text" name="img" id="img" value="${tour.img}"/></br>--%>
<%--    <label for="description">description</label>--%>
<%--    <input type="text" name="description" id="description" value="${tour.description}"/></br>--%>
<%--<c:forEach items="${tagList}" var="tag">--%>
<%--    <input type='checkbox' name='myCheckbox' value='${tag.tag_id}'>--%>
<%--    <label>${tag.name}</label>--%>
<%--    <br>--%>
<%--</c:forEach>--%>

<%--<h3><a href="service_manager?action=create">--%>
<%--    <button>Add Service</button>--%>
<%--</a></h3>--%>
<%--<button type="submit">Create</button>--%>
</body>
<c:if test="${requestScope['message'] != null}">
    <script>
        alert("${message}")
    </script>
    <%--    <span>${message}</span>--%>
</c:if>
<jsp:include page="footer.jsp"/>