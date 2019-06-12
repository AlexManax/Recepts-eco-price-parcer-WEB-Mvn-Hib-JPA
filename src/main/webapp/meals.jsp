<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javatime" uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" %>
<html>
<head>
    <title>Meals</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>

<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals table</h2>

<table>
    <thead>
    <tr>
        <th>#</th>
        <th>DateTime</th>
        <th>Description</th>
        <th>Calories</th>
        <th>Options</th>
    </tr>
    </thead>
    <tbody>

    <jsp:useBean id="mealList" scope="request" type="java.util.List<ru.javawebinar.topjava.model.MealTo>"/>
    <c:forEach items="${mealList}" var="meal" varStatus="id">

        <tr style="${meal.excess ? 'background-color: rgba(255, 0, 0, 0.2)':'background-color: rgba(0, 175, 16, 0.2)'}">
                <%--        <th style="${meal.excess ? 'background-color: rgba(255, 0, 0, 0.3)':'background-color: rgba(0, 175, 16, 0.1)'}"> <c:out value="${mealList.indexOf(meal) + 1}" /> </th>--%>
            <td>${id.count}</td>
            <fmt:parseDate value="${ meal.dateTime }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
            <td><fmt:formatDate pattern="MM.dd.yyyy HH'h'mm" value="${ parsedDateTime }"/></td>
            <td>${ meal.description }</td>
            <td>${ meal.calories }</td>
                <%--        <th style="${meal.excess ? 'background-color: rgba(255, 0, 0, 0.3)':'background-color: rgba(0, 175, 16, 0.1)'}">
                <button onclick="location.href='/topjava_war_exploded/meals/${mealList.indexOf(meal)}'">Delete </button></th>--%>
            <td><button onclick=location.href="meals?action=edit&userId=<c:out value="${id.count}"/>">Update</button>
                <button onclick=location.href="meals?action=delete&userId=<c:out value="${id.count}"/>">Delete</button></td>
        </tr>

    </c:forEach>
    </tbody>
</table>
<p><button onclick=location.href="meals?action=insert">Add Meal</button></p>
</body>
</html>