<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02.03.2020
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Welcome to family</title>
    <style>
        <%@include file="/resources/css/addCustomerForm.css" %>
    </style>
</head>
<body>

    <div id="wrapper">
        <div id="header">
                <h1>CRM - Customer Relationship Manager</h1>
        </div>
    </div>
    <div id="container">
        <h3>Add Customer:</h3>
        <br><br>
        <form:form action="saveCustomer" modelAttribute="customer" method="post">
            <table id="table1">
                <tbody>
                <tr>
                    <td class="label"><label>First name:</label></td>
                    <td class="input"><form:input class="inputForm" path="firstName" placeholder="Type here customer's first name" /></td>
                </tr>
                <tr>
                    <td class="label"><label>Last name:</label></td>
                    <td class="input"><form:input class="inputForm" path="lastName" placeholder="Type here customer's last name"/></td>
                </tr>
                <tr>
                    <td class="label"><label>Email: </label></td>
                    <td class="input"><form:input class="inputForm" path="email" placeholder="Type here customer's email"/></td>
                </tr>
                <tr>
                    <td><label></label></td>
                    <td class="submit"><br><input type="submit" value="Save new Customer" class="save"></td>
                </tr>
                </tbody>
            </table>
        </form:form>
        <br>
        <br>
        <div class="back">
            <a href="/start">Back to main menu</a>
        </div>
    </div>
</body>
</html>
