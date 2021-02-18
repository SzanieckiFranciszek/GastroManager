<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit payments:</title>
</head>
<body>
<form:form method="post" modelAttribute="payment" action="/payments/edit">
    <form:hidden path="id"/>
    <table>
        <tr>
            <td>Coct:</td>
            <td><form:input path="cost"/></td>
        </tr>
        <tr>
            <td>Data:</td>
            <td><form:input path="date" type="datetime-local"/><br></td>
        </tr>
        <tr>
            <td>Payments status:</td>
            <td><form:checkbox path="payed" value=""/>Payed</td>
        </tr>
        <tr>
            <td>Orders id:</td>
            <td><form:input path="orders.id"/></td>
        </tr>
        <tr>
            <td>User id:</td>
            <td><form:input path="users.id"/></td>
        </tr>

    </table>
    <input type="submit">
</form:form>
</body>
</html>