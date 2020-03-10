<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 28.02.2020
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <br>
        <br>
        <div>
            <h1>CRM - Customer Relation Manager</h1>
        </div>
        <br>
        <br>
        <div>
            <form:form action="search" method="get">
                <table class="upperTable">
                    <tr>
                        <td class="upperBar">
                            <input type="button" value="Add Customer"
                                   onclick="window.location.href='addCustomerForm'; return false;"
                                   class="add-button"/>
                        </td>
                        <td class="upperBar">
                            <h3>Search Customer by name:
                                <input class="inputForm" type="text" name="searchName" placeholder="Type here Customer name" />
                                <br>
                                <br>
                                <input type="submit" value="Search" class="add-button"/>
                                <h4><a class="fullCustList" href="/start">Show full customer list</a> </h4>
                            </h3>
                        </td>
                    </tr>
                </table>
            </form:form>
        </div>
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
                                <td class="customerContentList"> ${tempCustomer.firstName}</td>
                                <td class="customerContentList"> ${tempCustomer.lastName}</td>
                                <td class="customerContentList"> ${tempCustomer.email}</td>
                                <td class="customerContentList" style="text-align: center">
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
