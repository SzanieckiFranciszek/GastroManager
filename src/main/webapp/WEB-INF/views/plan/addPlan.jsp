<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dodaj składnik</title>
</head>
<body>
<form:form method="post" modelAttribute="plan">
    <table>
        <tr>
            <td>Name:</td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><form:input path="price"/><br></td>
        </tr>

    </table>
    <input type="submit">
</form:form>
</body>
</html>
