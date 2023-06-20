<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13/6/2023
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<head>
    <title>Edit Tour</title>
</head>
<body>

<h4
        class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
>
    Edit Tour
</h4>
<div
        class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
>
<<<<<<< Updated upstream
    <form action="tours?action=edit" method="post">
<%--        <input type="hidden" name="tour_id" value="${tour.id}">--%>
=======
    <form action="tours?action=edit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" id="id" value="${tour.tour_id}">
>>>>>>> Stashed changes
        <label for="name" class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Name</span>
            <input
                    type="text" name="name" id="name" value="${tour.name}"
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    placeholder="Name Tour"
            />
        </label>
        <label for="price" class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Price</span>
            <input
                    type="number" name="price" id="price" value="${tour.price}"
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    placeholder="Input Price"
            />
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
                    type="file" name="filePart" id="img" value="${tour.img}"
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
            />
            <input
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    type="text" name="filePart1" id="filePart1" value="${filePart1}" readonly
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
                onclick="return confirm('Are you sure to edit this Tour?')"
                class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
        >
            <a>Edit Tour</a>
        </button>
        <button type="button"
                class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
        >
            <a href="tours">Back</a>
        </button>
    </form>
</div>
</body>
<c:if test="${requestScope['message'] != null}">
    <script>
        alert("${message}")
    </script>
    <%--    <span>${message}</span>--%>
</c:if>
<jsp:include page="footer.jsp"/>
