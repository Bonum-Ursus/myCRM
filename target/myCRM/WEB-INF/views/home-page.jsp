<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 28.02.2020
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<%--    <link type="text/css" rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/resources/css/style.css"/>--%>
    <style>
        <%@include file="/resources/css/style.css" %>
    </style>
    <title>Home page</title>
</head>
<body>
    <div class="container">
        <div>
            <h1>CRM - Customer Relation Manager</h1>
        </div>
        <div>
            <input type="button" value="Add Customer"
                   onclick="window.location.href='addCustomerForm'; return false;"
                   class="add-button"/>
        </div>
        <br>
        <div class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
                <thead>
                        <tr>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                </thead>
            </table>
        </div>
        <div class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0">
                <tbody>
                        <c:forEach var="tempCustomer" items="${customers}">
                            <c:url var="updateLink" value="showFormForUpdate">
                                <c:param name="customerId" value="${tempCustomer.id}"/>
                            </c:url>
                            <c:url var="deleteLink" value="deleteCustomer">
                                <c:param name="customerId" value="${tempCustomer.id}"/>
                            </c:url>
                            <tr>
                                <td> ${tempCustomer.firstName}</td>
                                <td> ${tempCustomer.lastName}</td>
                                <td> ${tempCustomer.email}</td>
                                <td style="text-align: center">
                                    <a href="${updateLink}" style="color: white">Update</a>
                                    |
                                    <a href="${deleteLink}" onclick=
                                            "if (!(confirm('Are you sure you want to delete this customer?')))
                                                return false" style="color: white">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
