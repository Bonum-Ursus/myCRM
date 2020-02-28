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
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css"/>
<%--    <style>--%>
<%--        <%@include file="/resources/css/style.css" %>--%>
<%--    </style>--%>
    <title>Home page</title>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h1>CRM - Customer Relation Manager</h1>
        </div>
    </div>
    <div id="container0">
        <div class="tbl-header" id="content">
            <table id="container" cellpadding="0" cellspacing="0" border="0">
                <thead>
                    <tr>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Email</th>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0">
                <tbody>
                    <c:forEach var="tempCustomer" items="${customers}">
                        <tr>
                            <td> ${tempCustomer.firstName}</td>
                            <td> ${tempCustomer.lastName}</td>
                            <td> ${tempCustomer.email}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</body>
</html>
